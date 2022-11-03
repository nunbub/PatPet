package com.patpet.review;

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

import com.patpet.review.bo.ReviewBO;

@RestController
@RequestMapping("/review")
public class ReviewRestController {
	
	@Autowired
	private ReviewBO reviewBO;

	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("title") String title
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile[] files
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = reviewBO.addReview(userId, title, content, files);
		
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
			@RequestParam("reviewId") int reviewId
			, @RequestParam("title") String title
			, @RequestParam("content") String content
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = reviewBO.updateReview(userId, reviewId, title, content);
		
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
			@RequestParam("reviewId") int reviewId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = reviewBO.deleteReview(reviewId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
}
