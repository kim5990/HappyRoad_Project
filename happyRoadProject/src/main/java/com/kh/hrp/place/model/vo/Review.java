package com.kh.hrp.place.model.vo;

public class Review {
	
	private String reviewNo;
	private String placeNo;
	private String userNo;
	private String reviewStar;
	private String reviewContent;
	private String reviewCreateDate;

	
	
	public Review() {}


	public Review(String reviewNo, String placeNo, String userNo, String reviewStar, String reviewContent,
			String reviewCreateDate) {
		super();
		this.reviewNo = reviewNo;
		this.placeNo = placeNo;
		this.userNo = userNo;
		this.reviewStar = reviewStar;
		this.reviewContent = reviewContent;
		this.reviewCreateDate = reviewCreateDate;
	}

	
	
	
	
	// review List 용
	public Review(String reviewNo, String userNo, String reviewStar, String reviewContent, String reviewCreateDate) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.reviewStar = reviewStar;
		this.reviewContent = reviewContent;
		this.reviewCreateDate = reviewCreateDate;
	}


	public String getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getPlaceNo() {
		return placeNo;
	}


	public void setPlaceNo(String placeNo) {
		this.placeNo = placeNo;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getReviewStar() {
		return reviewStar;
	}


	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public String getReviewCreateDate() {
		return reviewCreateDate;
	}


	public void setReviewCreateDate(String reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", placeNo=" + placeNo + ", userNo=" + userNo + ", reviewStar="
				+ reviewStar + ", reviewContent=" + reviewContent + ", reviewCreateDate=" + reviewCreateDate + "]";
	}
	
	
	
	
	
	
	
	
	

}
