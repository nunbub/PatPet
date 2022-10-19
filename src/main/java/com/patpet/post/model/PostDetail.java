package com.patpet.post.model;

import com.patpet.review.model.Review;
import com.patpet.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	private Review review;
	private int attentionCount;
	private boolean isAttention;
	
	
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public boolean isAttention() {
		return isAttention;
	}
	public void setAttention(boolean isAttention) {
		this.isAttention = isAttention;
	}
	public int getAttentionCount() {
		return attentionCount;
	}
	public void setAttentionCount(int attentionCount) {
		this.attentionCount = attentionCount;
	}
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
	
	

}
