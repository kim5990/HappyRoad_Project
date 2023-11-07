package com.kh.hrp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.hrp.member.model.service.MemberService;
import com.kh.hrp.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("firstEmail") + "@" + request.getParameter("secondEmail");
		String userPhone = request.getParameter("userPhone");
		
		Member m = new Member(userId, userPwd, userEmail ,userName, userPhone);
		
		int result = new MemberService().insertMember(m);
		
		if (result > 0) { // 회원가입 성공
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			
			// /jsp url재용청 => index페이지
			response.sendRedirect(request.getContextPath());
			
		} else { // 회원가입실패
			// 에러문구가 보여지는 에러페이지
			request.setAttribute("errorMsg", "회원가입에 실패하였습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
