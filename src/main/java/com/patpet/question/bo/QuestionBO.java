package com.patpet.question.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.post.dao.PostDAO;
import com.patpet.post.model.Post;
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
	private UserBO userBO;

	public int addQuestion(int userId, int postId, String title, String content) {
		return questionDAO.insertQuestion(userId, postId, title, content);
	}
	
	public QuestionDetail getPostInfo(int userId, int postId) {
		Post post = postDAO.selectPost(postId);
		User user = userBO.getUserById(userId);
		
		QuestionDetail questionDetail = new QuestionDetail();
		
		questionDetail.setPost(post);
		questionDetail.setUser(user);
		
		return questionDetail;
	}
	
	public List<QuestionDetail> getQuestionList(int loginId) {
		
		List<Question> questionList = questionDAO.selectQuestionList(loginId);
		List<QuestionDetail> questionDetailList = new ArrayList<>();
		
		for(Question question : questionList) {
			int userId = question.getUserId();
			
			User user = userBO.getUserById(userId);
			
			QuestionDetail questionDetail = new QuestionDetail();
			
			questionDetail.setQuestion(question);
			questionDetail.setUser(user);
			
			questionDetailList.add(questionDetail);
		}
		
		return questionDetailList;
	}
}
