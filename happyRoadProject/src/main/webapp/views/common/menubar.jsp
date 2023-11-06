<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.kh.hrp.member.model.vo.Member"%>

    <% String contextPath=request.getContextPath(); 
    Member loginUser=(Member)session.getAttribute("loginUser"); 
    %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <!--부트스트랩-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
                crossorigin="anonymous">

            <link rel="stylesheet" href="resources/css/fonts.css">
            <link rel="stylesheet" href="resources/css/header.css">
            <link rel="stylesheet" href="resources/css/main.css">
            <link rel="stylesheet" href="resources/css/placetitle.css">
            <link rel="stylesheet" href="resources/css/placeList.css">
            <link rel="stylesheet" href="resources/css/eventtitle.css">
            <link rel="stylesheet" href="resources/css/eventcalender.css">
            <link rel="stylesheet" href="resources/css/hotnowtitle.css">
            <link rel="stylesheet" href="resources/css/hotNow.css">
            <link rel="stylesheet" href="resources/css/tail.css">
            <link rel="stylesheet" href="resources/css/mainboard.css">

            <script type="text/javascript" src="./resources/js/main.js"></script>


        </head>

        <body>
            <header class="header-container">
                <div class="header-section">
                    <div class="left-section">
                        <input type="text" class="left-section_input">
                        <input type="image" src="./resources/logo/free-icon-magnifier-2319177.png" height="17"
                            width="17">
                    </div>
                    <div class="middle-section">
                        <div class="title_div" align="center">
                            <h2 class="title_Text" onclick="location.href = '<%=contextPath %>'">Happy Road</h2>
                        </div>
                    </div>
                    <div class="right-section">
                    <%if(loginUser == null ) {%>
                        <input type="image" onclick="location.href = 'freeboardForm.fb?cpage=1'"
                            src="./resources/logo/header-게시판.png" height="17" width="17">
                        <input type="image" disable onclick = "alert('즐겨찾기 리스트는 로그인 후 사용가능합니다.')" src="./resources/logo/즐겨찾기모음+즐겨찾기전.png"
                            height="17" width="17">
                        <input type="image" onclick="location.href = 'loginForm.me'" src="./resources/logo/로그인-전.png"
                            height="17" width="17">
                    <% } else {%>
                    	<input type="image" onclick="location.href = 'freeboardForm.fb?cpage=1'"
                            src="./resources/logo/header-게시판.png" height="17" width="17">
                        <input type="image" onclick="location.href = 'list.fa?cpage=1&userNo=<%=loginUser.getUserNo() %>'" src="./resources/logo/즐겨찾기-후.png"
                            height="17" width="17">
                         <%if(loginUser.getUser_level().equals("0")) {%>
                       	<input type="image" onclick="location.href = ''" src="./resources/logo/관리자.png"
                           	height="17" width="17">
                         <%}else{ %>
                          <input type="image" onclick="location.href = ''" src="./resources/logo/로그인-후.png"
                         height="17" width="17">
                         <%} %>
                    <% } %>
                    </div>
                </div>
            </header>
        </body>

        </html>