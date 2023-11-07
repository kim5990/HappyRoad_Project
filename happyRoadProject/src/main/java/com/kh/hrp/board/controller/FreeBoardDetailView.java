package com.kh.hrp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.board.model.service.BoardService;
import com.kh.hrp.board.model.vo.Board;

/**
 * Servlet implementation class FreeBoardDetailView
 */
@WebServlet("/detail.fv")
public class FreeBoardDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		System.out.println(boardNo);
		
		// 조회수 1증가 시키고 데티일 페이지 가져오는 객체
		Board b = new BoardService().increaseCount(boardNo);
		
		System.out.println(b);
		
		if (b != null) {
			request.setAttribute("b", b);
			
			request.getRequestDispatcher("views/board/freeBoardDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "게시글 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
