package com.patpet.post.attention.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.post.attention.dao.AttentionDAO;

@Service
public class AttentionBO {

	@Autowired
	private AttentionDAO attentionDAO;
	
	public int addAttention(int userId, int postId) {
		return attentionDAO.insertAttention(userId, postId);
	}
	
	public int getAttentionCount(int postId) {
		return attentionDAO.selectAttentionCount(postId);
	}
	
	public int deleteAttention(int userId, int postId) {
		return attentionDAO.deleteAttention(userId, postId);
	}
	
	public boolean isAttention(int userId, int postId) {
		int count = attentionDAO.selectCountAttentionByUserId(userId, postId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int deleteAttentionByPostId(int postId) {
		return attentionDAO.deleteAttentionByPostId(postId);
	}
}
