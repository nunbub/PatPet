package com.patpet.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PostController {

	@GetMapping("/post/main/view")
	public String mainPage() {
		
		return "post/main";
	}
	
}
