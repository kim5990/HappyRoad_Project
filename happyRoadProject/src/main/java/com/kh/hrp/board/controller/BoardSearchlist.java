package com.kh.hrp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.board.model.service.BoardService;
import com.kh.hrp.board.model.vo.Board;
import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.PageInfoController;
import com.kh.hrp.place.model.vo.PlaceSelect;

/**
 * Servlet implementation class BoardSearchlist
 */
@WebServlet("/boardSearch.bo")
public class BoardSearchlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchcontent = request.getParameter("title"); //검색창 내용
		int listNull;
		int currentPage = Integer.parseInt(request.getParameter("cpage")); //요청 페이지
		ArrayList<Board> list = new ArrayList<Board>();
		
		if (searchcontent == "") { // 검색어 입력 없을시
			listNull = 0;
			PageInfo pi =  PageInfoController.pageController(0, 1, 5, 5);
			
			request.setAttribute("listNull", listNull);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("title", searchcontent);
			
			request.getRequestDispatcher("views/board/searchBoard.jsp").forward(request, response);
		} else {
			listNull = 1;
			
			int bsearchCount = new BoardService().SearchBoardCount(searchcontent); // 검색어 총 갯수
			
			PageInfo pi = PageInfoController.pageController(bsearchCount, currentPage, 5, 5);
			
			list = new BoardService().SearchBoardList(pi, searchcontent); // 검색어 리스트
			
			
			if(!list.isEmpty()) {
				listNull = 1;
			} else {
				listNull = 0;
			}
			
			request.setAttribute("listNull", listNull);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("title", searchcontent);
			
			request.getRequestDispatcher("views/board/searchBoard.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
