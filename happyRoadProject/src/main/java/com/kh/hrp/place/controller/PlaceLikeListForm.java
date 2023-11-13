package com.kh.hrp.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.PageInfoController;
import com.kh.hrp.common.model.vo.PlaceImage;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.PlaceSelect;

/**
 * Servlet implementation class PlaceLikeListForm
 */
@WebServlet("/list.fa")
public class PlaceLikeListForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceLikeListForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int listCount = new PlaceService().selectListCount(userNo); //현재 총 게시글 수
		int currentPage = Integer.parseInt(request.getParameter("cpage")); //현재 페이지(즉, 사용자가 요청한 페이지)
		PageInfo pi = PageInfoController.pageController(listCount, currentPage, 3, 6);
		ArrayList<PlaceSelect> list = new PlaceService().placeLikeSelectList(userNo, pi);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/place/placeLike.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
