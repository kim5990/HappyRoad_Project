package com.kh.hrp.place.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.PageInfoController;
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
		int reviewListCount = new PlaceService().reviewListCount(PlaceNo);
		int currentPage = Integer.parseInt(request.getParameter("cpage")); //현재 페이지(즉, 사용자가 요청한 페이지)

		PageInfo pi = PageInfoController.pageController(reviewListCount, currentPage, 5, 3);
		
		
		ArrayList<Review> list = new PlaceService().selectReviewList(PlaceNo, pi);
		// [{},{},{}]
		

//		response.setContentType("application/json; charset=utf-8");
//		new Gson().toJson(list, response.getWriter());
		
		
//		// JSON 객체를 생성하고 필드를 추가
//		JsonObject jsonResponse = new JsonObject();
//		jsonResponse.addProperty("num", num); // num 변수 추가
//		jsonResponse.add("list", new Gson().toJsonTree(list)); // list 변수 추가
//
//		// JSON 응답을 클라이언트로 보내기
//		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().write(jsonResponse.toString());
		
		
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
