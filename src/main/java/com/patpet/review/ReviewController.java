package com.patpet.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	@GetMapping("/review/create/view")
	public String createReview() {
		return "review/create";
	}
	
}
