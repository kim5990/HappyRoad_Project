package com.kh.hrp.place.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.place.model.vo.Place;

/**
 * Servlet implementation class ManagerPlaceInsertController
 */
@WebServlet("/placeInsert.ma")
public class ManagerPlaceInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerPlaceInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
		
		String placeTitle = request.getParameter("placeTitle");
		String placeThema = request.getParameter("placeThema");
		String placeContentPoint = request.getParameter("placeContentPoint");
		String placeContentDetail = request.getParameter("placeContentDetail");
		String placeAddress = request.getParameter("placeAddress");
		String placeHomepage = request.getParameter("placeHomepage");
		String placeContact = request.getParameter("placeContact");
		Date placeStart = formatter.parse(request.getParameter("placeStart"));
		Date placeEnd  = formatter.parse(request.getParameter("placeEnd"));
		String placeTime = request.getParameter("startTime") + "~" + request.getParameter("endTime");
		
		Place pl = new Place(placeTitle, placeContentPoint, placeContentDetail, placeThema, placeAddress
							,placeHomepage, placeContact, placeTime, placeStart, placeEnd);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
