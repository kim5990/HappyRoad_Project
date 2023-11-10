package com.kh.hrp.place.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.place.model.service.PlaceService;

/**
 * Servlet implementation class ReviewCreateController
 */
@WebServlet("/create.re")
public class ReviewCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCreateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int star = Integer.parseInt(request.getParameter("star"));
		String reviewContent = request.getParameter("reviewContent");
		
//		System.out.println(reviewContent + " " + star + " " + userNo + " " + placeNo);
		
		int result = new PlaceService().insertReview(placeNo, userNo, star, reviewContent);
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
