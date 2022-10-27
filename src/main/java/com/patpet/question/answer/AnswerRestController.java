package com.patpet.question.answer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.patpet.question.answer.bo.AnswerBO;
import com.patpet.question.dao.QuestionDAO;


@RestController
public class AnswerRestController {

	@Autowired
	private AnswerBO answerBO;
	
	@Autowired
	private QuestionDAO questionDAO;
	
	@GetMapping("/question/answer")
	public Map<String, String> answer(
			@RequestParam("questionId") int questionId
			, @RequestParam("content") String content
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = answerBO.questionAnswer(userId, questionId, content);
		
		// question 테이블에 있는 isAnswer컬럼 update 쿼리로 1로 바꾸기
		int isAnswer = questionDAO.updateIsAnswer(questionId);
		
		
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1 && isAnswer == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
