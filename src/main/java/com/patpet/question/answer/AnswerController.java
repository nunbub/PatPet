package com.patpet.question.answer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.patpet.question.bo.QuestionBO;
import com.patpet.question.model.QuestionDetail;

@Controller
public class AnswerController {
	
	@Autowired
	private QuestionBO questionBO;

	@GetMapping("/question/answer/view")
	public String answerQuestion(
			@RequestParam("questionId") int questionId
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		QuestionDetail questionDetail = questionBO.getQuestion(questionId, userId);
		
		model.addAttribute("questionDetail", questionDetail);
		
		return "question/answer";
		
	}
	
}
