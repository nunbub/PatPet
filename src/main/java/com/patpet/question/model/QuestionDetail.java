package com.patpet.question.model;

import com.patpet.post.model.Post;
import com.patpet.user.model.User;

public class QuestionDetail {

	private Post post;
	private User user;
	private Question question;
	
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	
}
