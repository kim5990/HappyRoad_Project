package com.kh.hrp.place.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.PageInfoController;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.PlaceSelect;

/**
 * Servlet implementation class MainEventListSearch
 */
@WebServlet("/mainEventListSearch.ma")
public class MainEventListSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainEventListSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String thema = request.getParameter("thema");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 // 문자열을 Date 객체로 변환
        String dateString = year + "-" + month + "-" + day;
        try {
			Date date = dateFormat.parse(dateString);
			// SQL 날짜 형식으로 출력
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            int listCount = new PlaceService().selectEventListCount(sqlDate, thema);
        	int currentPage = Integer.parseInt(request.getParameter("cpage"));
        	PageInfo pi = PageInfoController.pageController(listCount, currentPage, 2, 4);
        	
    		ArrayList<PlaceSelect> list = new PlaceService().mainEventListSearch(sqlDate, thema, pi);
   
    		
    		JSONArray jArr = new JSONArray();
    		jArr.add(list);
    		jArr.add(pi);
    		response.setContentType("application/json; charset=utf-8");
    		new Gson().toJson(jArr, response.getWriter());

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
