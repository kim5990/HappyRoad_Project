<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hrp.common.PageInfo, java.util.ArrayList, com.kh.hrp.place.model.vo.Place"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
	String listNull = (String)request.getAttribute("listNull");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- bootstrap CSS 5.3.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	    
    <!-- bootstrap JavaScript 5.3.1 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<link rel="stylesheet" href="../../resources/css/fonts.css">
	

</head>
<body>
	<%@ include file = "./menubar.jsp"%>

	<!-- 검색결과영역 -->
    <div class="search-container">
        <section id="search-content">
            <div class="search-result-area">
                <div class="search-result-area-div">
                    <button type="button" class="btn btn-secondary" id="btn-order">최신순</button>
                    <button type="button" class="btn btn-secondary" id="btn-order">관련도순</button>
                </div>
            </div>
        </section>

        <div class="serach-result-all">
            <div class="search-info-list">
                <ul class="ulclass">
                	<% if (listNull.equals("0")) { %>
                		<li>검색 결과가 없습니다.</li>
                	<% } else { %>
                	<% for (Place p : list) { %>
	                	<li>
	                        <a href="">
	                            <img src="<%= p.getImagePath() %>" alt="검색결과이미지">
	                        </a>
	                        <div class="result-content">
	                            <div class="">
	                                <div class="result-title"><a href=""><%= p.getPlaceTitle() %></a></div>
	                                <div class="result-area"><span><%= p.getPlaceAddress() %></span></div>
	                            </div>
	                        </div>
	                    </li>
	                    <% } %>
                    <% } %>
                </ul>
            </div>
        </div>

        <!-- 페이지네이션 -->
        <!-- <ul class="pagination justify-content-center" id="search-pagination">
            <li class="page-item"><a class="page-link" href="">&lt;</a></li>
            <li class="page-item"><a class="page-link" href="">1</a></li>
            <li class="page-item"><a class="page-link" href="">2</a></li>
            <li class="page-item"><a class="page-link" href="">3</a></li>
            <li class="page-item"><a class="page-link" href="">&gt;</a></li>
        </ul> -->
        
		<% if (currentPage != 1) { %>
			<button onclick="location.href='<%=contextPath %>/search.sc?cpage=<%=currentPage - 1 %>'">&lt;</button>
        <% } %>
			<% for(int p = startPage; p <= endPage; p++) { %>
				<% if (p == currentPage) { %>
					<button disabled><%=p %></button>
            	<% } else { %>
            		<button onclick="location.href='<%=contextPath %>/search.sc?cpage=<%=p %>'"><%=p %></button>
           		<% } %>
           	<% } %>
           
            <% if (currentPage != maxPage) { %>
            	<button onclick="location.href='<%=contextPath %>/search.sc?cpage=<%=currentPage + 1 %>'">&gt;</button>
			<% } %>

	    
    <%@ include file = "./footer.jsp"%>
	    
</body>
</html>