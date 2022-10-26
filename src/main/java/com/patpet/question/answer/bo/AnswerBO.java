package com.patpet.question.answer.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.question.answer.dao.AnswerDAO;

@Service
public class AnswerBO {
	
	@Autowired
	private AnswerDAO answerDAO;
	
	public int questionAnswer(int userId, int questionId, String content) {
		return answerDAO.insertAnswer(userId, questionId, content);
	}

}
