package com.patpet.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.patpet.common.FileManagerService;
import com.patpet.post.attention.bo.AttentionBO;
import com.patpet.post.dao.PostDAO;
import com.patpet.post.file.bo.FileBO;
import com.patpet.post.file.model.File;
import com.patpet.post.model.Post;
import com.patpet.post.model.PostDetail;
import com.patpet.question.bo.QuestionBO;
import com.patpet.review.dao.ReviewDAO;
import com.patpet.review.model.Review;
import com.patpet.review.model.ReviewDetail;
import com.patpet.user.bo.UserBO;
import com.patpet.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private AttentionBO attentionBO;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private QuestionBO questionBO;
	
	@Autowired
	private FileBO fileBO;
	
	public int addPost(int userId, String title, String name, String category, String state, String content, MultipartFile[] files) {
		
		Post post = new Post();
		
		post.setUserId(userId);
		post.setTitle(title);
		post.setName(name);
		post.setCategory(category);
		post.setState(state);
		post.setContent(content);
		
		int count = postDAO.insertPost(post);
		
		// 파일 저장
		for(int i = 0; i < files.length; i++) {
			
			MultipartFile file = files[i];
			 			
			String imagePath = FileManagerService.saveFile(userId, file);
					
			fileBO.addFile(post.getId(), 0, imagePath);
					
		}
		 
		return count;
		
	}
	
	
	public PostDetail getMainPostDetail() {
		
		Post post = postDAO.selectMainPost();
		
		
		
		PostDetail mainPostDetail = new PostDetail();
		
		if(post == null) {
			
		} else {
			
			int userId = post.getUserId();
			int postId = post.getId();
			
			User postUser = userBO.getUserById(userId);
			File postFile = fileBO.getFileByPostId(postId);
			
			mainPostDetail.setPost(post);
			mainPostDetail.setPostUser(postUser);
			mainPostDetail.setFile(postFile);
		}
		
		
		return mainPostDetail;
	}
	
	public ReviewDetail getMainReview() {
		
		ReviewDetail reviewDetail = new ReviewDetail();
		Review reviewInfo = reviewDAO.selectMainPage();
		
		if(reviewInfo == null) {
			
		} else {
			
			int reviewUserId = reviewInfo.getUserId(); 
			int reviewId = reviewInfo.getId();
			
			User reviewUser = userBO.getUserById(reviewUserId);
			File reviewFile = fileBO.getFileByReviewId(reviewId);
			
			reviewDetail.setFile(reviewFile);
			reviewDetail.setReview(reviewInfo);
			reviewDetail.setReviewUser(reviewUser);
		}
		
		return reviewDetail;
	}
	
	
	public List<PostDetail> getPostList(int loginId, String category) {
		
		List<Post> postList = postDAO.selectPostList(category);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			
			int postId = post.getId();
			
			User user = userBO.getUserById(userId);
			
			File file = fileBO.getFileByPostId(postId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setPostUser(user);
			postDetail.setFile(file);
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
		
	}
	
	
	public PostDetail getPost(int id, int loginUserId) {
		
		Post post = postDAO.selectPost(id); 
		int postId = post.getId();
		
		User user = userBO.getUserById(loginUserId);
		
		List<File> files = fileBO.getFile(postId);
		
		int attentionCount = attentionBO.getAttentionCount(postId);
		boolean isAttention = attentionBO.isAttention(loginUserId, postId);
		
		PostDetail mainPostDetail = new PostDetail();
		
		mainPostDetail.setPost(post);
		mainPostDetail.setPostUser(user);
		mainPostDetail.setAttentionCount(attentionCount);
		mainPostDetail.setAttention(isAttention);
		mainPostDetail.setFiles(files);
		
		return mainPostDetail;
	}
	
	
	public int updatePost(int userId, int postId, String title,  String name, String category, String state, String content) {
	
		return postDAO.updatePost(userId, title, name, category, state, content);
		
		
	}
	
	
	public int deletePost(int postId, int userId) {


		Post post = postDAO.selectPostByIdAndUserId(postId, userId);
		
		List<File> getFile = fileBO.getFile(postId);
		
		if(post == null) {
			return 0;
		}
		
		for(File file : getFile) {
			
			FileManagerService.removeFile(file.getImagePath());
			
		}
		
		
		attentionBO.deleteAttentionByPostId(postId);
		questionBO.deleteQuestionByPostId(postId);
		fileBO.deleteFileByPostId(postId);
		
		
		return postDAO.deletePost(postId);
		
	}
	
	
}
