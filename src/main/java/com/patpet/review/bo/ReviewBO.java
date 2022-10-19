package com.patpet.review.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.patpet.common.FileManagerService;
import com.patpet.review.dao.ReviewDAO;
import com.patpet.review.model.Review;
import com.patpet.review.model.ReviewDetail;
import com.patpet.user.bo.UserBO;
import com.patpet.user.model.User;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addReview(int userId, String title, String content, MultipartFile file) {
		String imagePath = null;
		
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) {
				return 0;
			}
 		}
		
		return reviewDAO.insertReview(userId, title, content, imagePath);
	}

	public List<ReviewDetail> getMainReviewList(int loginId) {
		
		List<Review> reviewList = reviewDAO.selectReviewList();
		
		List<ReviewDetail> reviewDetailList = new ArrayList<>();
		
		for(Review review : reviewList) {
			
			int userId = review.getUserId();
			
			User user = userBO.getUserById(userId);
			
			ReviewDetail reviewDetail = new ReviewDetail();
			
			reviewDetail.setReview(review);
			reviewDetail.setUser(user);
			
			reviewDetailList.add(reviewDetail);
			
		}
		
		return reviewDetailList;
		
		
	}
	
}
