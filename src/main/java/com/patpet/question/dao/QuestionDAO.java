package com.patpet.question.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionDAO {

	public int insertQuestion(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("title") String title
			, @Param("content") String content);
	
}
