package com.kh.hrp.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.Review;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/rlist.pl")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int PlaceNo = Integer.parseInt(request.getParameter("pno"));
		System.out.println("서블릿왓니");
		
		ArrayList<Review> list = new PlaceService().selectReviewList(PlaceNo);
		// [{},{},{}]
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
		
		//gpt답변
//	    String json = new Gson().toJson(list);
//
//	    response.setContentType("application/json; charset=utf-8");
//	    response.getWriter().write(json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
