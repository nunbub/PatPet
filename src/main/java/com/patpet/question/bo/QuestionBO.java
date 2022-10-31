package com.patpet.question.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.post.dao.PostDAO;
import com.patpet.post.model.Post;
import com.patpet.question.answer.bo.AnswerBO;

import com.patpet.question.answer.model.Answer;
import com.patpet.question.dao.QuestionDAO;
import com.patpet.question.model.Question;
import com.patpet.question.model.QuestionDetail;
import com.patpet.user.bo.UserBO;
import com.patpet.user.model.User;

@Service
public class QuestionBO {
	
	@Autowired
	private QuestionDAO questionDAO;
	
	@Autowired
	private PostDAO postDAO;
	
	
	
	@Autowired
	private AnswerBO answerBO;
	
	@Autowired
	private UserBO userBO;

	public int addQuestion(int userId, int postId, int postUserId, String title, String content) {
		return questionDAO.insertQuestion(userId, postId, postUserId, title, content);
	}
	
	public QuestionDetail getPostInfo(int userId, int postId) {
		Post post = postDAO.selectPost(postId);
		User user = userBO.getUserById(userId);
		
		QuestionDetail questionDetail = new QuestionDetail();
		
		questionDetail.setPost(post);
		questionDetail.setUser(user);
		
		return questionDetail;
	}
	
	public List<QuestionDetail> getQuestionList(int loginId, String receive) {
		
		List<Question> questionList = questionDAO.selectQuestionList(loginId);
		List<QuestionDetail> questionDetailList = new ArrayList<>();
		
		for(Question question : questionList) {
			int userId = question.getUserId();
			int postId = question.getPostId();
			
			User user = userBO.getUserById(userId);
			
			Post post = postDAO.selectPost(postId);
			
			QuestionDetail questionDetail = new QuestionDetail();
			
			questionDetail.setQuestion(question);
			questionDetail.setUser(user);
			questionDetail.setPost(post);
			
			questionDetailList.add(questionDetail);
		}
		
		return questionDetailList;
	}
	
	public List<QuestionDetail> receiveQuestionList(int loginId, String receive){
		
		List<Question> questionList = questionDAO.selectReceiveQuestion(loginId);
		List<QuestionDetail> questionDetailList = new ArrayList<>();
		
		for(Question question : questionList) {
			int userId = question.getUserId();
			int postId = question.getPostId();
			
			User user = userBO.getUserById(userId);
			
			Post post = postDAO.selectPost(postId);
			
			QuestionDetail questionDetail = new QuestionDetail();
			
			questionDetail.setQuestion(question);
			questionDetail.setPost(post);
			questionDetail.setUser(user);
			
			questionDetailList.add(questionDetail);			
		}
		
		return questionDetailList;
		
	}

	
	public QuestionDetail getQuestion(int questionId, int loginId) {
		Question question = questionDAO.selectQuestion(questionId);
		
		User questionUser = userBO.getUserById(loginId);
		
		int postId = question.getPostId();
		
		Post questionPost = postDAO.selectPost(postId);
		
		Answer answer = answerBO.getAnswerById(questionId);
		
		QuestionDetail questionDetail = new QuestionDetail();
		
		questionDetail.setQuestion(question);
		questionDetail.setUser(questionUser);
		questionDetail.setPost(questionPost);
		questionDetail.setAnswer(answer);
		
		return questionDetail;
	}
	
	
	
	public int deleteQuestion(int questionId, int userId) {
		Question question = questionDAO.selectQuestionByIdAndUserId(questionId, userId);
		
		if(question == null) {
			return 0;
		}
		
		return questionDAO.deleteQuestion(questionId);
	}
	
	
}
