package com.patpet.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.patpet.post.bo.PostBO;
import com.patpet.post.model.Post;
import com.patpet.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;

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
	public String dogPage(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/dog";
	}
	
	@GetMapping("/detail/view")
	public String detail(@RequestParam("id") int id, Model model) {
		
		Post post = postBO.getPost(id);
		
		model.addAttribute("post", post);
		return "post/detail";
	}
	
	
}
