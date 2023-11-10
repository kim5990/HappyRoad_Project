<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.kh.hrp.member.model.vo.Member"%>

<%
	String contextPath=request.getContextPath(); 
	Member loginUser=(Member)session.getAttribute("loginUser"); 
	String alertMsg = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!--부트스트랩-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
	

	
	<link rel="stylesheet" href="./resources/css/fonts.css">
	<link rel="stylesheet" href="./resources/css/header.css">
	<link rel="stylesheet" href="./resources/css/main.css">
	<link rel="stylesheet" href="./resources/css/placetitle.css">
	<link rel="stylesheet" href="./resources/css/placeList.css">
	<link rel="stylesheet" href="./resources/css/eventtitle.css">
	<link rel="stylesheet" href="./resources/css/eventcalender.css">
	<link rel="stylesheet" href="./resources/css/hotnowtitle.css">
	<link rel="stylesheet" href="./resources/css/hotNow.css">
	<link rel="stylesheet" href="./resources/css/tail.css">
	<link rel="stylesheet" href="./resources/css/mainboard.css">
	<link rel="stylesheet" href="./resources/css/searchresult.css">
	
	<script type="text/javascript" src="./resources/js/main.js"></script>
	<!-- bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
	<% if(alertMsg != null) { %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
	<header class="header-container">
		<div class="header-section">
		
			<div class="left-section">
				<input type="text" class="left-section_input" name="title" onkeyup="enterkey()">
				<input type="image" onclick = "searchOn()" src="./resources/logo/free-icon-magnifier-2319177.png" height="17" width="17">
			</div>

			<div class="middle-section">
				<div class="title_div" align="center">
					<h2 class="title_Text" onclick="location.href = '<%=contextPath%>'">Happy Road</h2>
				</div>
			</div>
			
			<div class="right-section">
             <% if (loginUser == null) { %>
                 <input type="image" onclick="location.href = 'freeboardForm.fb?cpage=1'"
                     src="./resources/logo/header-게시판.png" height="17" width="17">
                 <input type="image" onclick = "alertify.alert('에러 메세지', '로그인 후 이용가능 합니다.');" src="./resources/logo/즐겨찾기모음+즐겨찾기전.png"
                     height="17" width="17">
                 <input type="image" onclick="location.href = 'loginForm.me'" src="./resources/logo/로그인-전.png"
                     height="17" width="17">
             <% } else { %>
				<input type="image" onclick="location.href = 'freeboardForm.fb?cpage=1'"
					src="./resources/logo/header-게시판.png" height="17" width="17">
				<input type="image" onclick="location.href = 'list.fa?cpage=1&userNo=<%=loginUser.getUserNo() %>'" src="./resources/logo/즐겨찾기-후.png"
					height="17" width="17">
					
			<% if (loginUser.getUser_level().equals("0")) { %>
				<input type="image" onclick="location.href = 'freeboardForm.fb?cpage=1'" src="./resources/logo/관리자.png"
					height="17" width="17">
			<% } else { %>
				<input type="image" onclick="location.href = 'myPage.me'" src="./resources/logo/로그인-후.png"
					height="17" width="17">
				<% } %>
            <% } %>
             
			</div>
		</div>
	
	</header>
	
    <script>
    	function searchOn(){
    		let searchText = document.querySelector("input[name='title']").value;
    		location.href = 'search.sc?cpage=1&title='+ encodeURIComponent(searchText);
    	}
    	
    	function enterkey() {
    		if (window.event.keyCode == 13) {
    			let searchText = document.querySelector("input[name='title']").value;
    			location.href = 'search.sc?cpage=1&title='+ encodeURIComponent(searchText);
    	    }
    	}
    </script>
    
</body>
</html>