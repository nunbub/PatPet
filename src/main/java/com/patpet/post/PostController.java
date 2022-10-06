package com.patpet.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("/main/view")
	public String mainPage() {
		
		return "post/main";
	}
	
	@GetMapping("/introduce/view")
	public String introducePage() {
		return "post/introduce";
	}
	
	@GetMapping("/create/view")
	public String create() {
		return "post/create";
	}
	
	@GetMapping("/dog/view")
	public String dogPage() {
		return "post/dog";
	}
	
}
