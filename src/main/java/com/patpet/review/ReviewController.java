package com.patpet.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.patpet.review.bo.ReviewBO;
import com.patpet.review.model.ReviewDetail;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewBO reviewBO;

	@GetMapping("/create/view")
	public String createReview() {
		return "review/create";
	}
	
	@GetMapping("/main/view")
	public String mainReview(
			Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<ReviewDetail> reviewList = reviewBO.getMainReviewList(userId);
		
		model.addAttribute("reviewList", reviewList);
		
		return "review/main";
	}
	
	@GetMapping("/detail/view")
	public String detailReview(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		ReviewDetail reviewDetail = reviewBO.getReview(id, userId);
		
		model.addAttribute("reviewDetail", reviewDetail);
		
		return "review/detail";
		
	}
	
	@GetMapping("/update/view")
	public String updateReview(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		ReviewDetail review = reviewBO.getReview(id, userId);
		
		model.addAttribute("detailReview", review);
		
		return "review/update";
	}
	
}
