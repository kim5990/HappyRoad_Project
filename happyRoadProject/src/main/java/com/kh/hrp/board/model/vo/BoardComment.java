package com.kh.hrp.board.model.vo;

public class BoardComment {
	private int commentNo;
	private String boardBo; //외래키
	private String commentUser; //외래키
	private String commentContent;
	private String commentNewdate;
	
	public BoardComment() {
		super();
	}

	public BoardComment(int commentNo, String boardBo, String commentUser, String commentContent,
			String commentNewdate) {
		super();
		this.commentNo = commentNo;
		this.boardBo = boardBo;
		this.commentUser = commentUser;
		this.commentContent = commentContent;
		this.commentNewdate = commentNewdate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getBoardBo() {
		return boardBo;
	}

	public void setBoardBo(String boardBo) {
		this.boardBo = boardBo;
	}

	public String getCommentUser() {
		return commentUser;
	}

	public void setCommentUser(String commentUser) {
		this.commentUser = commentUser;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentNewdate() {
		return commentNewdate;
	}

	public void setCommentNewdate(String commentNewdate) {
		this.commentNewdate = commentNewdate;
	}

	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", boardBo=" + boardBo + ", commentUser=" + commentUser
				+ ", commentContent=" + commentContent + ", commentNewdate=" + commentNewdate + "]";
	}

	
}
