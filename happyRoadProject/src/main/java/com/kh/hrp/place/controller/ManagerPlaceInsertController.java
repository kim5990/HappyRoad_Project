package com.kh.hrp.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.hrp.common.MyFileRenamePolicy;
import com.kh.hrp.common.model.vo.PlaceImage;
import com.kh.hrp.place.model.service.PlaceService;
import com.kh.hrp.place.model.vo.PlaceSelect;
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
			System.out.println("이프전");
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			System.out.println("이프후");
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			PlaceSelect ps = new PlaceSelect();
			ps.setPlaceTitle(multiRequest.getParameter("placeTitle"));
			ps.setPlaceThema(multiRequest.getParameter("placeThema"));
			ps.setPlaceContentPoint(multiRequest.getParameter("placeContentPoint"));
			ps.setPlaceContentDetail(multiRequest.getParameter("placeContentDetail"));
			ps.setPlaceAddress(multiRequest.getParameter("placeAddress"));
			ps.setPlaceHomepage(multiRequest.getParameter("placeHomepage"));
			ps.setPlaceContact(multiRequest.getParameter("placeContact"));
			ps.setPlaceStart(multiRequest.getParameter("placeStart"));
			ps.setPlaceEnd(multiRequest.getParameter("placeEnd"));
			ps.setPlaceTime(multiRequest.getParameter("startTime") + "~" + multiRequest.getParameter("endTime"));
			System.out.println(ps);
			ArrayList<PlaceImage> list = new ArrayList<>();
			for(int i = 1; i <= 4; i++) {
				String key = "file" + i;
				if (multiRequest.getOriginalFileName(key) != null) {
					//첨부파일이 존재할 경우
					//Attachment 생성 + 원본명, 수정된파일명, 폴더경로, 파일레벨 => list에 담기
					
					PlaceImage pi = new PlaceImage();
					pi.setPlaceImageOrigin(multiRequest.getOriginalFileName(key));
					pi.setPlaceImageChange(multiRequest.getFilesystemName(key));
					pi.setPlaceImagePath("resources/images/");
					list.add(pi);
					System.out.println("사진");
				}
			}
			
			int result = new PlaceService().insertManagerPlace(ps, list);
			
			if (result > 0) {
				request.getSession().setAttribute("alertMsg", "사진게시글 작성 성공");
				response.sendRedirect(request.getContextPath() + "/place.ma");
			} else {
				request.setAttribute("errorMsg", "사진게시글 작성 실패");
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
