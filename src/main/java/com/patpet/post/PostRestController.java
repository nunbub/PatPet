package com.patpet.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.patpet.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	

	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("title") String title
			, @RequestParam("name") String name
			, @RequestParam("category") String category
			, @RequestParam("state") String state
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.addPost(userId, title, name, category, state, content, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/update")
	public Map<String, String> update(
			@RequestParam("postId") int postId
			, @RequestParam("title") String title
			, @RequestParam("name") String name
			, @RequestParam("category") String category
			, @RequestParam("state") String state
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file) {
		
		int count = postBO.updatePost(postId, postId, title, name, category, state, content, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/delete")
	public Map<String, String> delete(
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.deletePost(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
