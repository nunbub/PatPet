package com.patpet.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.patpet.common.FileManagerService;
import com.patpet.post.attention.bo.AttentionBO;
import com.patpet.post.dao.PostDAO;
import com.patpet.post.model.Post;
import com.patpet.post.model.PostDetail;
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
	
	public int addPost(int userId, String title, String name, String category, String state, String content, MultipartFile file) {
		String imagePath = null;
		
		if(file != null ) {
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) {
				return 0;
			}
		}
		return postDAO.insertPost(userId, title, name, category, state, content, imagePath);
	}
	
	public PostDetail getMainPostDetail() {
		Post post = postDAO.selectMainPost();
		
		int userId = post.getUserId();
		
		User user = userBO.getUserById(userId);
		
		PostDetail mainPostDetail = new PostDetail();
		
		mainPostDetail.setPost(post);
		mainPostDetail.setUser(user);
		
		return mainPostDetail;
	}
	
	public List<PostDetail> getPostList(int loginId, String category) {
		
		List<Post> postList = postDAO.selectPostList(category);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			
			User user = userBO.getUserById(userId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
		
	}
	
	public PostDetail getPost(int id) {
		Post post = postDAO.selectPost(id);
		
		int userId = post.getUserId();
		
		User user = userBO.getUserById(userId);
		int attentionCount = attentionBO.getAttentionCount(post.getId());
		boolean isAttention = attentionBO.isAttention(userId, post.getId());
		
		PostDetail mainPostDetail = new PostDetail();
		
		mainPostDetail.setPost(post);
		mainPostDetail.setUser(user);
		mainPostDetail.setAttentionCount(attentionCount);
		mainPostDetail.setAttention(isAttention);
		
		return mainPostDetail;
	}
	
	public int updatePost(int userId, int postId, String title,  String name, String category, String state, String content, MultipartFile file) {
	
		Post post = postDAO.selectPost(postId);
		
		FileManagerService.removeFile(post.getImagePath());
		
		String imagePath = null;
		
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) {
				return 0;
			}
		}
		
		
		return postDAO.updatePost(postId, title, name, category, state, content, imagePath);
		
	}
	
	public int deletePost(int postId, int userId) {
		
		
		
		Post post = postDAO.selectPostByIdAndUserId(postId, userId);
		
		if(post == null) {
			return 0;
		}
		
		FileManagerService.removeFile(post.getImagePath());
		
		attentionBO.deleteAttentionByPostId(postId);
		
		return postDAO.deletePost(postId);
		
	}
	
	
}
