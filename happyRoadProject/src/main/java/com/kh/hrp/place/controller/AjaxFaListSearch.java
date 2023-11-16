package com.kh.hrp.place.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class AjaxFaListSearch
 */
@WebServlet("/ajaxFaListSearch.pl")
public class AjaxFaListSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFaListSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String placeThema = request.getParameter("thema");
		int listCount = new PlaceService().placeThemaListCount(placeThema); //현재 총 게시글 수
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		PageInfo pi = PageInfoController.pageController(listCount, currentPage, 4, 4);
		ArrayList<PlaceSelect> psList = new PlaceService().selectFaPlaceBoardList(placeThema, pi);
		
		JSONArray jArr = new JSONArray();
		jArr.add(psList);
		jArr.add(pi);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(jArr, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
