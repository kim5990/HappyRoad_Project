package com.kh.hrp.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userEmail;
	private String userName;
	private String userPhone;
	private String user_level;
	private Date userEnrollDate;
	private Date userModifyDate;
	private String userStatus;
	
	public Member() {
		super();
	}
	
	public Member(int userNo, String userId, String userPwd, String userEmail, String userName, String userPhone,
			String user_level, Date userEnrollDate, Date userModifyDate, String userStatus) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userPhone = userPhone;
		this.user_level = user_level;
		this.userEnrollDate = userEnrollDate;
		this.userModifyDate = userModifyDate;
		this.userStatus = userStatus;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public Date getUserEnrollDate() {
		return userEnrollDate;
	}
	public void setUserEnrollDate(Date userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}
	public Date getUserModifyDate() {
		return userModifyDate;
	}
	public void setUserModifyDate(Date userModifyDate) {
		this.userModifyDate = userModifyDate;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	
	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userEmail=" + userEmail
				+ ", userName=" + userName + ", userPhone=" + userPhone + ", user_level=" + user_level
				+ ", userEnrollDate=" + userEnrollDate + ", userModifyDate=" + userModifyDate + ", userStatus="
				+ userStatus + "]";
	}
	
	

}
