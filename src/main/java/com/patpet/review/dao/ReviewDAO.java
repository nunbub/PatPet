package com.patpet.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.patpet.review.model.Review;

@Repository
public interface ReviewDAO {

	public int insertReview(Review review);
	
	public List<Review> selectReviewList();
	
	public Review selectMainPage();
	
	public Review selectReview(@Param("id") int id);
	
	public Review selectReviewByIdAndUserId(
			@Param("id") int id, @Param("userId") int userId);
	
	public int updateReview(
			@Param("reviewId") int reviewId
			, @Param("title") String title
			, @Param("content") String content);
	
	public int deleteReview(@Param("reviewId") int reviewId);
}
