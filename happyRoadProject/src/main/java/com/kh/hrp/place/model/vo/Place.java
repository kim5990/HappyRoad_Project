package com.kh.hrp.place.model.vo;

import java.sql.Date;

public class Place {
   private int placeNo;
   private String placeTitle;
   private String placeContentPoint;
   private String placeContentDetail;
   private String placeThema;
   private String placeAddress;
   private String placeHomepage;
   private String placeContact;
   private String placeTime;
   private Date placeStart;
   private Date placeEnd;
   private int placeCount;
   private Date placeCreateDate;
   private String placeStatus;
   private String placeTitleImg;
   
   public Place() {
      super();
   }
   
	public Place(int placeNo, String placeTitle, String placeContentPoint, String placeContentDetail, String placeThema,
			String placeAddress, String placeHomepage, String placeTime, Date placeStart, Date placeEnd, int placeCount,
			Date placeCreateDate, String placeStatus) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.placeContentPoint = placeContentPoint;
		this.placeContentDetail = placeContentDetail;
		this.placeThema = placeThema;
		this.placeAddress = placeAddress;
		this.placeHomepage = placeHomepage;
		this.placeTime = placeTime;
		this.placeStart = placeStart;
		this.placeEnd = placeEnd;
		this.placeCount = placeCount;
		this.placeCreateDate = placeCreateDate;
		this.placeStatus = placeStatus;
	}

	// placeLikeSelectList 에서 사용하는 생성자
	public Place(int placeNo, String placeTitle, String placeContentPoint, String placeContentDetail,
			String placeAddress) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.placeContentPoint = placeContentPoint;
		this.placeContentDetail = placeContentDetail;
		this.placeAddress = placeAddress;
	}

	// selectPlace 에서 사용하는 생성자
	public Place(int placeNo, String placeTitle, String placeContentPoint, String placeContentDetail, String placeThema,
			String placeAddress, String placeHomepage, String placeContact, String placeTime, Date placeStart,
			Date placeEnd) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.placeContentPoint = placeContentPoint;
		this.placeContentDetail = placeContentDetail;
		this.placeThema = placeThema;
		this.placeAddress = placeAddress;
		this.placeHomepage = placeHomepage;
		this.placeContact = placeContact;
		this.placeTime = placeTime;
		this.placeStart = placeStart;
		this.placeEnd = placeEnd;
	}
   
	// selectSearchList 에서 사용하는 생성자
	public Place(int placeNo, String placeTitle, String placeAddress) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.placeAddress = placeAddress;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlaceTitle() {
		return placeTitle;
	}

	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}

	public String getPlaceContentPoint() {
		return placeContentPoint;
	}

	public void setPlaceContentPoint(String placeContentPoint) {
		this.placeContentPoint = placeContentPoint;
	}

	public String getPlaceContentDetail() {
		return placeContentDetail;
	}

	public void setPlaceContentDetail(String placeContentDetail) {
		this.placeContentDetail = placeContentDetail;
	}

	public String getPlaceThema() {
		return placeThema;
	}

	public void setPlaceThema(String placeThema) {
		this.placeThema = placeThema;
	}

	public String getPlaceAddress() {
		return placeAddress;
	}

	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}

	public String getPlaceHomepage() {
		return placeHomepage;
	}

	public void setPlaceHomepage(String placeHomepage) {
		this.placeHomepage = placeHomepage;
	}

	public String getPlaceContact() {
		return placeContact;
	}

	public void setPlaceContact(String placeContact) {
		this.placeContact = placeContact;
	}

	public String getPlaceTime() {
		return placeTime;
	}

	public void setPlaceTime(String placeTime) {
		this.placeTime = placeTime;
	}

	public Date getPlaceStart() {
		return placeStart;
	}

	public void setPlaceStart(Date placeStart) {
		this.placeStart = placeStart;
	}

	public Date getPlaceEnd() {
		return placeEnd;
	}

	public void setPlaceEnd(Date placeEnd) {
		this.placeEnd = placeEnd;
	}

	public int getPlaceCount() {
		return placeCount;
	}

	public void setPlaceCount(int placeCount) {
		this.placeCount = placeCount;
	}

	public Date getPlaceCreateDate() {
		return placeCreateDate;
	}

	public void setPlaceCreateDate(Date placeCreateDate) {
		this.placeCreateDate = placeCreateDate;
	}

	public String getPlaceStatus() {
		return placeStatus;
	}

	public void setPlaceStatus(String placeStatus) {
		this.placeStatus = placeStatus;
	}

	public String getPlaceTitleImg() {
		return placeTitleImg;
	}

	public void setPlaceTitleImg(String placeTitleImg) {
		this.placeTitleImg = placeTitleImg;
	}

	@Override
	public String toString() {
		return "Place [placeNo=" + placeNo + ", placeTitle=" + placeTitle + ", placeContentPoint=" + placeContentPoint
				+ ", placeContentDetail=" + placeContentDetail + ", placeThema=" + placeThema + ", placeAddress="
				+ placeAddress + ", placeHomepage=" + placeHomepage + ", placeContact=" + placeContact + ", placeTime="
				+ placeTime + ", placeStart=" + placeStart + ", placeEnd=" + placeEnd + ", placeCount=" + placeCount
				+ ", placeCreateDate=" + placeCreateDate + ", placeStatus=" + placeStatus + "]";
	}

     
   
}