package com.kh.hrp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.kh.hrp.board.model.service.BoardService;
import com.kh.hrp.board.model.vo.BoardComment;
import com.kh.hrp.common.PageInfo;

/**
 * Servlet implementation class BoardCommentListController
 */
@WebServlet("/commentList.cm")
public class BoardCommentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; //현재 총 게시글 수
		int currentPage; //현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대의 개수
		int boardLimit; // 한 페이지내에 보여질 게시글 최대갯수
		// 위 4개의 값을 기준으로 아래 3개의 값을 구할 것이다.
		
		int maxPage; //가장 마지막페이지(총 페이지의 수)
		int startPage; //페이징바의 시작수
		int endPage; //페이징바의 끝수
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));	
		
		// *listCount : 총 게시글 수 가져오기
		listCount = new BoardService().selectCommentCount(boardNo);
		
		// *currentPage : 현재 페이지(즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
	
		// *pageLimit : 페이징바의 최대 갯수(단위)
		pageLimit = 5;
		
		//* boardLimit : 한 페이지내에 보여질 게시글 최대갯수(단위)
		boardLimit = 3;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
	
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit+1;
		
		endPage = startPage + pageLimit - 1;
		
		//startPage가 11이면 endPage는 20이 됨(만약 maxPage가 13이라면?)
		endPage = endPage > maxPage ? maxPage : endPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<BoardComment> list = new BoardService().commentSelectList(pi, boardNo);
		
		HashMap<String, Object> responseMap = new HashMap<>();
		responseMap.put("pi", pi);
		responseMap.put("list", list);
		
		System.out.println(pi);
		
//		JSONArray jArr = new JSONArray();
//		
//		jArr.add(responseMap);
//		jArr.add(pi);

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
