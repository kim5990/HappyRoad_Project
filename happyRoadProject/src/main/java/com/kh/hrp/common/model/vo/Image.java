package com.kh.hrp.common.model.vo;

import java.sql.Date;

public class Image {
	private int boardImageNo;
	private int boardNo;
	private String boardImageOrigin;
	private String boardImageChange;
	private String boardImagePath;
	private Date boardImageDate;
	
	public Image() {
		super();
	}

	public Image(int boardImageNo, int boardNo, String boardImageOrigin, String boardImageChange, String boardImagePath,
			Date boardImageDate) {
		super();
		this.boardImageNo = boardImageNo;
		this.boardNo = boardNo;
		this.boardImageOrigin = boardImageOrigin;
		this.boardImageChange = boardImageChange;
		this.boardImagePath = boardImagePath;
		this.boardImageDate = boardImageDate;
	}

	public int getBoardImageNo() {
		return boardImageNo;
	}

	public void setBoardImageNo(int boardImageNo) {
		this.boardImageNo = boardImageNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardImageOrigin() {
		return boardImageOrigin;
	}

	public void setBoardImageOrigin(String boardImageOrigin) {
		this.boardImageOrigin = boardImageOrigin;
	}

	public String getBoardImageChange() {
		return boardImageChange;
	}

	public void setBoardImageChange(String boardImageChange) {
		this.boardImageChange = boardImageChange;
	}

	public String getBoardImagePath() {
		return boardImagePath;
	}

	public void setBoardImagePath(String boardImagePath) {
		this.boardImagePath = boardImagePath;
	}

	public Date getBoardImageDate() {
		return boardImageDate;
	}

	public void setBoardImageDate(Date boardImageDate) {
		this.boardImageDate = boardImageDate;
	}

	@Override
	public String toString() {
		return "Image [boardImageNo=" + boardImageNo + ", boardNo=" + boardNo + ", boardImageOrigin=" + boardImageOrigin
				+ ", boardImageChange=" + boardImageChange + ", boardImagePath=" + boardImagePath + ", boardImageDate="
				+ boardImageDate + "]";
	}
	
	
	
}
