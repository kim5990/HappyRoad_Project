package com.kh.hrp.place.controller;

import java.io.File;
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

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.hrp.common.MyFileRenamePolicy;
import com.kh.hrp.common.model.vo.PlaceImage;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.Place;
import com.oreilly.servlet.MultipartRequest;

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
      
      if (ServletFileUpload.isMultipartContent(request)) {
         
         //maxSize
         int maxSize = 10*1024*1024;
         //물리적 경로
         String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
         //MultipartRequest 생성
         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
         
         Place p = new Place();
         //Place 객체에 추가
         p.setPlaceTitle(multiRequest.getParameter("placeTitle"));
         p.setPlaceThema(multiRequest.getParameter("placeThema"));
         p.setPlaceContentPoint(multiRequest.getParameter("placeContentPoint"));
         p.setPlaceContentDetail(multiRequest.getParameter("placeContentDetail"));
         p.setPlaceAddress(multiRequest.getParameter("placeAddress"));
         p.setPlaceHomepage(multiRequest.getParameter("placeHomepage"));
         p.setPlaceContact(multiRequest.getParameter("placeContact"));
         
         //받은 날짜가 스트링 -> sql날짜로 변환
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         
         try {
            //행사 시작일 ~ 종료일
            Date startDate = dateFormat.parse(multiRequest.getParameter("placeStart"));
            Date endDate = dateFormat.parse(multiRequest.getParameter("placeEnd"));
            // SQL 날짜 형식으로 출력
               java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
               java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());
               
               //바꾼 날짜 데이터 set에 저장
               
            p.setPlaceStart(sqlStartDate);
            p.setPlaceEnd(sqlEndDate);
            
            //행사시작시간부터 끝나는 시간
            SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm");
            
            String startTime = multiRequest.getParameter("startTime");
            String endTime = multiRequest.getParameter("endTime");
            
            Date userstartTime = inputFormat.parse(startTime);
            Date useroutTime = inputFormat.parse(endTime);
            
             SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");
             outputFormat.applyPattern("HH:mm");
             String convertedStartTime = outputFormat.format(userstartTime);
             String convertedOutTime = outputFormat.format(useroutTime);

             p.setPlaceTime(convertedStartTime + "~" + convertedOutTime);
            /////////////////////////////////////////////
         } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         ArrayList<PlaceImage> plist = new ArrayList<PlaceImage>();
         PlaceImage pI = null;
         
         //PLACE INSERT 후 INSERT한 행의 PlaceNo를 SELECT

        for(int i = 1; i < 4; i++) {
           if(i == 1 && multiRequest.getOriginalFileName("file"+i) != null) {
              pI = new PlaceImage();
              pI.setPlaceImageOrigin(multiRequest.getOriginalFileName("file"+i));
              pI.setPlaceImageChange(multiRequest.getFilesystemName("file"+i));
              pI.setPlaceImagePath("resources/images/");
              pI.setPlaceImageLevel(1);
              plist.add(pI);

           }else if( i > 1 && multiRequest.getOriginalFileName("file"+i) != null ) {
        	   pI = new PlaceImage();
               pI.setPlaceImageOrigin(multiRequest.getOriginalFileName("file"+i));
               pI.setPlaceImageChange(multiRequest.getFilesystemName("file"+i));
               pI.setPlaceImagePath("resources/images/");
               pI.setPlaceImageLevel(2);
               plist.add(pI);
           }
        }
        int result = new PlaceService().insertManagerPlaceImage(p , plist);
        	
		 if(result > 0) {
	         request.getSession().setAttribute("alertMsg", "PLACE게시글 작성 성공");
	         response.sendRedirect("place.ma");
	      }else {
	    	 if (pI != null) {
	            new File(savePath + pI.getPlaceImageChange()).delete();
	         }
	    	 
	    	  request.setAttribute("errorMsg", "PLACE게시글 작성 실패");
	          request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		     
	      }
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