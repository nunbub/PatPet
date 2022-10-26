package com.patpet.question.answer.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AnswerDAO {

	public int insertAnswer(
			@Param("userId") int userId
			, @Param("questionId") int questionId
			, @Param("content") String content);
}
