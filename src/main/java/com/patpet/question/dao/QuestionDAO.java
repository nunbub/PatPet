package com.patpet.question.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.patpet.question.model.Question;

@Repository
public interface QuestionDAO {

	public int insertQuestion(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("title") String title
			, @Param("content") String content);
	
	public Question selectQuestion(@Param("questionId") int questionId);
	
	public List<Question> selectQuestionList(@Param("userId") int userId);
	
	public Question selectQuestionByIdAndUserId(@Param("id") int id, @Param("userId") int userId);
	
	public int deleteQuestion(@Param("questionId") int questionId);
	
}
