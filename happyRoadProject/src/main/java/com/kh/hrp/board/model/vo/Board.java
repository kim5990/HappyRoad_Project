package com.kh.hrp.board.model.vo;

import java.sql.Date;

public class Board {
   private int boardNo;
   private String userId;
   private String boardTitle;
   private String boardContent;
   private int boardCount;
   private String boardEnrollDate;
   private String boardStatus;
   
 

   
   public Board() {}
   
   
   // 기본 생성자
   public Board(int boardNo, String userId, String boardTitle, String boardContent, int boardCount,
			String boardEnrollDate, String boardStatus) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardEnrollDate = boardEnrollDate;
		this.boardStatus = boardStatus;
	}
   
   // 게시물 가져오기
   public Board(int boardNo, String userId, String boardTitle, String boardContent,
	         int boardCount, String boardEnrollDate) {
	      super();
	      this.boardNo = boardNo;
	      this.userId = userId;
	      this.boardTitle = boardTitle;
	      this.boardContent = boardContent;
	      this.boardCount = boardCount;
	      this.boardEnrollDate = boardEnrollDate;
	   }


public int getBoardNo() {
	return boardNo;
}


public void setBoardNo(int boardNo) {
	this.boardNo = boardNo;
}


public String getUserId() {
	return userId;
}


public void setUserId(String userId) {
	this.userId = userId;
}


public String getBoardTitle() {
	return boardTitle;
}


public void setBoardTitle(String boardTitle) {
	this.boardTitle = boardTitle;
}


public String getBoardContent() {
	return boardContent;
}


public void setBoardContent(String boardContent) {
	this.boardContent = boardContent;
}


public int getBoardCount() {
	return boardCount;
}


public void setBoardCount(int boardCount) {
	this.boardCount = boardCount;
}


public String getBoardEnrollDate() {
	return boardEnrollDate;
}


public void setBoardEnrollDate(String boardEnrollDate) {
	this.boardEnrollDate = boardEnrollDate;
}


public String getBoardStatus() {
	return boardStatus;
}


public void setBoardStatus(String boardStatus) {
	this.boardStatus = boardStatus;
}


@Override
public String toString() {
	return "Board [boardNo=" + boardNo + ", userId=" + userId + ", boardTitle=" + boardTitle + ", boardContent="
			+ boardContent + ", boardCount=" + boardCount + ", boardEnrollDate=" + boardEnrollDate + ", boardStatus="
			+ boardStatus + "]";
}




   
   
}