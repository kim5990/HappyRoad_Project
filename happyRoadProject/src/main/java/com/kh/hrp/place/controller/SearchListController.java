package com.kh.hrp.place.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.PageInfoController;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.Place;

/**
 * Servlet implementation class SearchListForm
 */
@WebServlet("/searchDetail.sd")
public class SearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchListController() 
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String condition = request.getParameter("condition"); // "writer" || "title" || "content"
		String keyword = request.getParameter("keyword"); // 사용자가 입력한 키워드값
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		
		int searchCount = new PlaceService().selectSearchCount(map);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		PageInfo pi = PageInfoController.pageController(searchCount, currentPage, 10, 5);
		ArrayList<Place> list = new PlaceService().selectSearchList(map, pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		
		request.getRequestDispatcher("views/common/searchListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
