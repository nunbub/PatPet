package com.patpet.post.attention.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AttentionDAO {

	public int insertAttention(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectAttentionCount(@Param("postId") int postId);
	
}
