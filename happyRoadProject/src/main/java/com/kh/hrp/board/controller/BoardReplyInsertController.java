package com.kh.hrp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.hrp.board.model.service.BoardService;
import com.kh.hrp.board.model.vo.BoardComment;
import com.kh.hrp.member.model.vo.Member;

/**
 * Servlet implementation class BoardReplyInsertController
 */
@WebServlet("/insert.fv")
public class BoardReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String CommentContent1 = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		BoardComment c = new BoardComment();
		c.setCommentContent(CommentContent1);
		c.setCommentNo(boardNo);
		c.setCommentUser(String.valueOf(userNo));
		
		int result = new BoardService().insertComment(c);
		//request.setAttribute("c", c);
		
 
		
		new Gson().toJson(c);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
