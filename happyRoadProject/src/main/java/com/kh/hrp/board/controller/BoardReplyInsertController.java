package com.kh.hrp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(CommentContent1);
		System.out.println(boardNo);
		System.out.println(userNo);
		
		BoardComment c = new BoardComment();
		c.setCommentContent(CommentContent1);
		c.setCommentNo(boardNo);
		c.setCommentUser(String.valueOf(userNo));
		
		System.out.println(c);
		int result = new BoardService().insertComment(c);
		System.out.println(result);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
