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
import com.patpet.post.model.PostDetail;
import com.patpet.review.model.ReviewDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;

	@GetMapping("/main/view")
	public String mainPage(Model model) {
		
		PostDetail mainPost = postBO.getMainPostDetail();
		ReviewDetail reviewDetail = postBO.getMainReview();
		
		
		model.addAttribute("mainPost", mainPost);
		model.addAttribute("mainReview", reviewDetail);
		
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
	
	@GetMapping("/list/view")
	public String listPage(
			@RequestParam("category") String category
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPostList(userId, category);
		
		model.addAttribute("postList", postList);
		
		return "post/list";
	}
	
	
	@GetMapping("/detail/view")
	public String detail(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId"); // 세션을 통해 로그인한 사용자의 id 받기
		
		PostDetail detailPost = postBO.getPost(id, userId);
		
		model.addAttribute("detailPost", detailPost);
		return "post/detail";
	}
	
	@GetMapping("/update/view")
	public String update(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		PostDetail post = postBO.getPost(id, userId);
		
		model.addAttribute("detailPost", post);
		
		return "post/update";
	}
	
	
}
