<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.ArrayList, com.kh.hrp.common.PageInfo, com.kh.hrp.place.model.vo.PlaceSelect" %>
    <%
    PageInfo pi=(PageInfo)request.getAttribute("pi");
    ArrayList<PlaceSelect> list = (ArrayList<PlaceSelect>)request.getAttribute("list");
        %>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <title>Insert title here</title>
          <style>
            .memberMenu {
              display: flex;
              width: 100%;
              justify-content: center;
              margin-top: 30px;
            }

            .memberMenuBar {
              display: flex;
              width: 770px;
              height: auto;
              justify-content: center;
            }

            .memberMenuBar .btn-active {
              background-color: #198754;
              color: white;
            }


            .insertForm {
              display: flex;
              width: 100%;
              height: auto;
              justify-content: center;
            }

            .insertFormdiv {
              display: flex;
              width: 1200px;
              height: auto;
              border: 1px solid black;
              justify-content: center;
              border-radius: 20px;

            }

            .insertFormHeader {
              width: 100%;
              height: auto;
              text-align: center;
            }

            .insertTitle {
              display: flex;
              justify-content: center;
              margin-top: 20px;
              margin-bottom: 20px;
            }

            .favortiesList {
              display: flex;
              width: 100%;
              height: auto;
              justify-content: space-evenly;
              margin-top: 20px;
              margin-bottom: 20px;
              flex-direction: row;
              flex-wrap: wrap;
            }

            .favorites {
              width: 300px;
              height: auto;
              margin-left: 30px;
              margin-right: 30px;

            }

            .favortiesNone {
              font-size: 20px;
              text-align: center;
            }

            .card {
              margin-top: 20px;
              margin-bottom: 20px;
            }
          </style>

        </head>

        <body>
          <%@ include file="../common/menubar.jsp" %>
            <div class="memberMenu">
              <div class="memberMenuBar">
                <div class="memberMenu">
                  <ul class="nav nav-tabs">
                    <li class="nav-item ">
                      <a class="nav-link active" style="background-color: rgb(81, 126, 165); color: white;"
                        aria-current="page" href="list.fa?cpage=1&userNo=<%=loginUser.getUserNo() %>">즐겨찾기 리스트</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);"
                        href="myPage.me">마이페이지</a>
                    </li>
                    <%if (loginUser.getUser_level().equals("0")){ %>
                    	<li>
	             	<a class="nav-link active" style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);"
	                 href="place.ma">장소 추가</a>
	             </li>
             <%} %>
                </div>
              </div>
            </div>

            </div>
            <div class="insertForm">
              <div class="insertFormdiv">
                <div class="insertFormHeader">
                  <br><br>
                  <div class="insertTitle">
                    <h2>즐겨찾기</h2>
                  </div>
               <%if (list.isEmpty()) {%>
                        <div class=favortiesNone>
                          즐겨찾기 목록이 비었습니다.
                        </div>
                   <%}else{%>
                  <div class=favortiesList>
                      <%for(PlaceSelect p : list) {%>
                    <div class="favorites">
                            <div class="card" aria-hidden="true">
                              <img src="<%=p.getImagePath() + p.getImageChange() %>" class="card-img-top">
                              <div class="card-body">
                                <h5 class="card-title">
                                  <%=p.getPlaceTitle() %>
                                </h5>
                                <p class="card-text">
                                  <%=p.getPlaceContentPoint() %>
                                </p>
                                <a href="eventdetailView.ed?pno=<%=p.getPlaceNo()%>"  class="btn btn-success">보러가기</a>
                                <a href="delete.fa?userNo=3&placeNo=<%=p.getPlaceNo() %>" class="btn btn-danger">삭제하기</a>
                              </div>
                            </div>
                    </div>
                    <%} %>
                  </div>
                   <%} %>
                  <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                      <%if(pi.getCurrentPage() !=1) {%>
                        <li class="page-item disabled">
                          <a class="page-link" href="list.fa?cpage=<%=pi.getCurrentPage() -1 %>&userNo=3">이전</a>
                        </li>

                        <%} %>
                          <%for(int p=pi.getStartPage(); p <=pi.getEndPage(); p++) {%>
                            <%if(p==pi.getCurrentPage()) {%>
                              <li class="page-item">
                                <a class="page-link" style="text-decoration: none;">
                                  <%=p %>
                                </a>
                              </li>
                              <%}else{ %>
                                 <li class="page-item">
                                   <a class="page-link" href="list.fa?cpage=<%=p %>&userNo=3">
                                     <%=p %>
                                   </a>
                                 </li>
                              <%} %>
                         <%} %>

                                  <%if(pi.getCurrentPage() !=pi.getMaxPage()){ %>
                                    <li class="page-item">
                                      <a class="page-link"
                                        href="list.fa?cpage=<%=pi.getCurrentPage() + 1 %>&userNo=3">다음</a>
                                    </li>
                                    <%} %>
                    </ul>
                  </nav>
                  <br><br>
                  <button class="btn btn-dark" id="back-btn" onclick = "history.back()"  type="submit">뒤로가기</button>
                  <br><br>
                </div>
              </div>
            </div>
         <%@ include file = "../common/footer.jsp"%>
        </body>


        </html>