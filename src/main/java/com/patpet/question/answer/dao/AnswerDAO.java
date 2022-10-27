package com.patpet.question.answer.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.patpet.question.answer.model.Answer;

@Repository
public interface AnswerDAO {

	public int insertAnswer(
			@Param("userId") int userId
			, @Param("questionId") int questionId
			, @Param("content") String content);
	
	public Answer selectAnswer(@Param("questionId") int questionId);
}
