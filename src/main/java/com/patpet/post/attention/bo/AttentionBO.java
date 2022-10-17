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
}
