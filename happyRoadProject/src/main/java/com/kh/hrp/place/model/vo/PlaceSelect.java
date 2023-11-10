package com.kh.hrp.place.model.vo;

import java.sql.Date;

public class PlaceSelect {
    private int placeNo;
      private String placeTitle;
      private String placeContentPoint;
      private String placeContentDetail;
      private String placeThema;
      private String placeAddress;
      private String placeHomepage;
      private String placeContact;
      private String placeTime;
      private String placeStart;
      private String placeEnd;
      private int placeCount;
      private Date placeCreateDate;
      private String placeStatus;
      private String imagePath;
      private String imageChange;
      
   public PlaceSelect() {
      super();
   }

   //관리자페이지 장소 추가
   public PlaceSelect(String placeTitle, String placeContentPoint, String placeContentDetail, String placeThema,
			String placeAddress, String placeHomepage, String placeContact, String placeTime, String placeStart,
			String placeEnd) {
		super();
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
   
   public PlaceSelect(int placeNo, String placeTitle, String placeContentPoint, String placeContentDetail,
         String placeThema, String placeAddress, String placeHomepage, String placeContact, String placeTime,
         String placeStart, String placeEnd, int placeCount, Date placeCreateDate, String placeStatus,
         String imagePath, String imageChange) {
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
      this.placeCount = placeCount;
      this.placeCreateDate = placeCreateDate;
      this.placeStatus = placeStatus;
      this.imagePath = imagePath;
      this.imageChange = imageChange;
   }

public PlaceSelect(int placeNo, String placeTitle, String placeContentPoint, String placeThema, String placeAddress,
         String placeTime, String placeStart, String placeEnd, int placeCount, String imagePath , String imageChange) {
      super();
      this.placeNo = placeNo;
      this.placeTitle = placeTitle;
      this.placeContentPoint = placeContentPoint;
      this.placeThema = placeThema;
      this.placeAddress = placeAddress;
      this.placeTime = placeTime;
      this.placeStart = placeStart;
      this.placeEnd = placeEnd;
      this.placeCount = placeCount;
      this.imagePath = imagePath;
      this.imageChange = imageChange;
   }
   
   public PlaceSelect(int placeNo, String placeTitle, String placeAddress, String imagePath, String imageChange) {
	super();
	this.placeNo = placeNo;
	this.placeTitle = placeTitle;
	this.placeAddress = placeAddress;
	this.imagePath = imagePath;
	this.imageChange = imageChange;
   }
   
   
   public PlaceSelect(int placeNo, String placeTitle, String placeContentPoint, String placeThema, String placeAddress,
		int placeCount, String imagePath, String imageChange) {
	super();
	this.placeNo = placeNo;
	this.placeTitle = placeTitle;
	this.placeContentPoint = placeContentPoint;
	this.placeThema = placeThema;
	this.placeAddress = placeAddress;
	this.placeCount = placeCount;
	this.imagePath = imagePath;
	this.imageChange = imageChange;
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

   public String getPlaceStart() {
      return placeStart;
   }

   public void setPlaceStart(String placeStart) {
      this.placeStart = placeStart;
   }

   public String getPlaceEnd() {
      return placeEnd;
   }

   public void setPlaceEnd(String placeEnd) {
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

   public String getImagePath() {
      return imagePath;
   }

   public void setImagePath(String imagePath) {
      this.imagePath = imagePath;
   }

   public String getImageChange() {
      return imageChange;
   }

   public void setImageChange(String imageChange) {
      this.imageChange = imageChange;
   }
   
      
   
      
}
