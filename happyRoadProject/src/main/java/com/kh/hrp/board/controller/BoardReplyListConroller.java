package com.kh.hrp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.hrp.board.model.service.BoardService;
import com.kh.hrp.board.model.vo.BoardComment;
import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.PageInfoController;
import com.kh.hrp.place.model.service.PlaceService;

/**
 * Servlet implementation class BoardReplyInsertConroller
 */
@WebServlet("/list.fv")
public class BoardReplyListConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyListConroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int listCount = new BoardService().selectCommentCount(boardNo); // 총 게시물 가져오기
		
		int currentPage = Integer.parseInt(request.getParameter("cpage")); //현재 페이지(즉, 사용자가 요청한 페이지)
		
		PageInfo pi = PageInfoController.pageController(listCount, currentPage, 5, 5);
		
		ArrayList<BoardComment> list = new BoardService().selectBoardCommentList(pi, boardNo);
		
		// response.setContentType("application/json; charset=utf-8");
		// new Gson().toJson(list, response.getWriter());
		
		HashMap<String, Object> responseMap = new HashMap<>();
		responseMap.put("pi", pi);
		responseMap.put("list", list);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(responseMap, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
