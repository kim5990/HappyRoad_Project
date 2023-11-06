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
 * Servlet implementation class FreeBoardEnrollUpdate
 */
@WebServlet("/enrollupdate.fb")
public class FreeBoardEnrollUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardEnrollUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		Board b = new Board();
		b.setBoardNo(boardNo);
		
		int result = new BoardService().updateBoard(b);
		
		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 수정하였습니다.");
			// session으로 안되있음
//			response.sendRedirect(request.getContextPath() + "/detail.fv?bno=" + boardNo);
			
			request.getRequestDispatcher("/detail.fv?bno=" + boardNo).forward(request, response);
			
		} else {
			request.setAttribute("errorMsg", "게시글 수정 실패");
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
