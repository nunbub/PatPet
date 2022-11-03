package com.patpet.review.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.patpet.common.FileManagerService;
import com.patpet.post.file.bo.FileBO;
import com.patpet.post.file.model.File;
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
	
	@Autowired
	private FileBO fileBO;
	
	public int addReview(int userId, String title, String content, MultipartFile[] files) {
		
 		Review review = new Review();
 		
 		review.setUserId(userId);
 		review.setTitle(title);
 		review.setContent(content);
 		
 		int count = reviewDAO.insertReview(review);
 		
 		for(int i = 0; i < files.length; i++) {
 			MultipartFile file = files[i];
 			
 			String imagePath = FileManagerService.saveFile(userId, file);
 			
 			fileBO.addFile(0, review.getId(), imagePath);
 		}
		
		return count;
	}

	public List<ReviewDetail> getMainReviewList(int loginId) {
		
		List<Review> reviewList = reviewDAO.selectReviewList();
		
		List<ReviewDetail> reviewDetailList = new ArrayList<>();
		
		for(Review review : reviewList) {
			
			int userId = review.getUserId();
			
			int reviewId = review.getId();
			
			User user = userBO.getUserById(userId);
			
			File file = fileBO.getFileByReviewId(reviewId);
			
			ReviewDetail reviewDetail = new ReviewDetail();
			
			reviewDetail.setReview(review);
			reviewDetail.setUser(user);
			reviewDetail.setFile(file);
			
			reviewDetailList.add(reviewDetail);
			
		}
		
		return reviewDetailList;
		
	}
	
	public ReviewDetail getReview(int id, int loginUserId) {
		Review review = reviewDAO.selectReview(id);
		
		User reviewUser = userBO.getUserById(loginUserId);
		
		ReviewDetail reviewDetail = new ReviewDetail();
		
		reviewDetail.setReview(review);
		reviewDetail.setUser(reviewUser);
		
		return reviewDetail;
	}
	
	public int updateReview(int userId, int reviewId, String title, String content) {
		
		
		return reviewDAO.updateReview(reviewId, title, content);
		
	}
	
	public int deleteReview(int reviewId, int userId) {
		
		Review review = reviewDAO.selectReviewByIdAndUserId(reviewId, userId);
		
		File file = fileBO.reviewFile(reviewId);
		
		if(review == null) {
			return 0;
		}
		
		FileManagerService.removeFile(file.getImagePath());
		
		return reviewDAO.deleteReview(reviewId);
	}
}
