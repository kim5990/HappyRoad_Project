package com.kh.hrp.place.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.place.model.service.PlaceService;

/**
 * Servlet implementation class PlaceLikeDeleteController
 */
@WebServlet("/delete.fa")
public class PlaceLikeDeleteController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceLikeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int userNo = Integer.parseInt(request.getParameter("userNo"));
      int placeNo = Integer.parseInt(request.getParameter("placeNo"));
      int result = new PlaceService().placeLikeDeleteController(userNo, placeNo);
      if(result > 0 ) {
         request.getRequestDispatcher("list.fa?cpage=1&userNo="+userNo).forward(request, response);
      }else {
    	  request.setAttribute("errorMsg", "즐겨찾기 삭제 실패");
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