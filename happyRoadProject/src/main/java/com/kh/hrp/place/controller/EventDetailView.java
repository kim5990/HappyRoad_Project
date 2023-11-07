package com.kh.hrp.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hrp.common.model.vo.PlaceImage;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.Place;


/**
 * Servlet implementation class EventDetailView
 */
@WebServlet("/eventdetailView.ed")
public class EventDetailView extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int placeNo = Integer.parseInt(request.getParameter("pno"));
      
      PlaceService pService = new PlaceService();
      
      // 1. 조회수 1 증가시키고 보여줄 place 객체 가져오기
      Place p = pService.increaseCount(placeNo);
      
      
      // 2. 사진 list 불러오기
      if (p != null) {
         ArrayList<PlaceImage> list = pService.selectPlaceImageList(placeNo);
         
		 request.setAttribute("p", p);
         request.setAttribute("list", list);
         request.setAttribute("listSize", list.size());
         request.getRequestDispatcher("views/place/placeDetailView.jsp").forward(request, response);
      } else {
         request.setAttribute("errorMsg", "게시글 조회에 실패");
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