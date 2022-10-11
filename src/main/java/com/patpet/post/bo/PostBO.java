package com.patpet.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.patpet.common.FileManagerService;
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
	
	public List<PostDetail> getPostList(int loginId) {
		
		List<Post> postList = postDAO.selectPostList();
		
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
	
	public Post getPost(int id) {
		return postDAO.selectPost(id);
	}
	
	
	
}
