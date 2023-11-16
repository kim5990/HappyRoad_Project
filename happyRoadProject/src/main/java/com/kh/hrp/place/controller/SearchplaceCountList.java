package com.kh.hrp.place.controller;

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
import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.PageInfoController;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.PlaceSelect;

/**
 * Servlet implementation class SearchplaceCountList
 */
@WebServlet("/placeCountList.sc")
public class SearchplaceCountList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchplaceCountList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String placeTitle = request.getParameter("title");
		String listNull;
		PlaceService pService = new PlaceService();
		PageInfo pi = new PageInfo();
		JSONArray pjArr = new JSONArray();
		
		if (placeTitle == "") { // 검색어 입력 없을시
			
			listNull = "0";
			pi =  PageInfoController.pageController(0, 1, 1, 1);
			
			pjArr.add(pi);
			
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(pjArr, response.getWriter());
		} else {
			
			listNull = "1";
			int searchCount = pService.selectSearchCount(placeTitle);
			int currentPage = Integer.parseInt(request.getParameter("cpage"));
			
			pi = PageInfoController.pageController(searchCount, currentPage, 5, 5);
			ArrayList<PlaceSelect> pslist = pService.selectSearchPlaceCountList(placeTitle, pi);
			
			HashMap<String, Object> responseMap = new HashMap<>();
			responseMap.put("pi", pi);
			responseMap.put("pslist", pslist);
			  
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(responseMap, response.getWriter());

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
