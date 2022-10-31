package com.patpet.question;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.patpet.question.bo.QuestionBO;

import com.patpet.question.model.QuestionDetail;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionBO questionBO;

	@GetMapping("/create/view")
	public String createQuestion(
			@RequestParam("postId") int postId
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		QuestionDetail questionDetail = questionBO.getPostInfo(userId, postId);
		
		model.addAttribute("questionDetail", questionDetail);
		
		return "question/create";
	}
	
	@GetMapping("/list/view")
	public String listQuestion(
			@RequestParam("loginId") int loginId
			, @RequestParam("receive") String receive
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		if(receive == "N") {
			
			List<QuestionDetail> questionList = questionBO.getQuestionList(userId, receive);
			model.addAttribute("questionList", questionList);
		} else {
			List<QuestionDetail> questionDetailList = questionBO.receiveQuestionList(loginId, receive);
			model.addAttribute("questionDetailList", questionDetailList);
		}
		
		
		
		
		
		
		return "question/list";
	}
	
	
	
	@GetMapping("/detail/view")
	public String detailQuestion(
			@RequestParam("questionId") int questionId
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		QuestionDetail questionDetail = questionBO.getQuestion(questionId, userId);
		
		model.addAttribute("questionDetail", questionDetail);
		
		return "question/detail";
		
	}
	
	
}
