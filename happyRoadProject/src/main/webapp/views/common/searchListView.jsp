<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.kh.hrp.common.PageInfo,
          java.util.ArrayList,
          com.kh.hrp.place.model.vo.Place,
          com.kh.hrp.place.model.vo.PlaceSelect"%>
<%
   PageInfo pi = (PageInfo)request.getAttribute("pi");

   ArrayList<PlaceSelect> plist = (ArrayList<PlaceSelect>)request.getAttribute("plist");
   
   String placeTitle = (String)request.getAttribute("title");
   int listNull = (int)request.getAttribute("listNull");
   
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
                    <button type="button" class="btn btn-secondary" id="btn-order-placeNo" onclick="placeNoList()">최신순</button>
                    <button type="button" class="btn btn-secondary" id="btn-order-placeCount" onclick="placeCountList()">인기순</button>
                </div>
            </div>
        </section>

        <div class="serach-result-all">
            <div class="search-info-list">
                <ul class="ulclass">
                   <% if (listNull == 0) { %>
                      <li>검색 결과가 없습니다.</li>
                      <div style="height: 70px"></div>
                   <% } else { %>
                   <!-- 일치하지 않는 검색어에도 검색결과가 없습니다 띄우기 -->
                   <% for (PlaceSelect p : plist) { %>
                      <li>
                           <a href="eventdetailView.ed?pno=<%=p.getPlaceNo() %>">
                               <img src="./resources/images/<%=p.getImageChange() %>" alt="검색결과이미지">
                           </a>
                        <div class="result-content">
                            <div class="">
                                <div class="result-title"><a href="eventdetailView.ed?pno=<%=p.getPlaceNo() %>"><%= p.getPlaceTitle() %></a></div>
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
        <ul class="pagination justify-content-center" id="search-pagination">
           <% if (currentPage != 1) { %>
              <li class="page-item"><a class="page-link" href="<%=contextPath %>/search.sc?cpage=<%=currentPage - 1 %>&title=<%=placeTitle %>">&lt;</a></li>
           <% } %>
           <% for(int p = startPage; p <= endPage; p++) { %>
              <% if (p == currentPage) { %>
              <li class="page-item"><a class="page-link" href="" disabled><%=p %></a></li>
              <% } else { %>
              <li class="page-item"><a class="page-link" href="<%=contextPath %>/search.sc?cpage=<%=p %>&title=<%=placeTitle %>"><%=p %></a></li>
              <% } %>
             <% } %>
            <% if(listNull != 0 && currentPage != maxPage) { %>
               <li class="page-item"><a class="page-link" href="<%=contextPath %>/search.sc?cpage=<%=currentPage + 1 %>&title=<%=placeTitle %>">&gt;</a></li>
            <% } %>
        </ul>
        
        
        <script>
           /* onload시 검색어 유지, 최신순 버튼 active, 인기순 버튼 클릭시 최신순 버튼 active remove */
         window.onload = function() {
              
            let searchText = '<%=placeTitle%>';
            document.querySelector("#searchLeftInput").value = searchText;
            
            const btnOrderPlaceNo = document.getElementById("btn-order-placeNo");
            const btnOrderPlaceCount = document.getElementById("btn-order-placeCount");
            
            btnOrderPlaceNo.classList.add("active");
            
            
            btnOrderPlaceNo.addEventListener("click", function() {
                 btnOrderPlaceNo.classList.add("active");
                 btnOrderPlaceCount.classList.remove("active");
               });
            
            btnOrderPlaceCount.addEventListener("click", function() {
                 btnOrderPlaceCount.classList.add("active");
                 btnOrderPlaceNo.classList.remove("active");
               }); 
         }

         /* 최신순 버튼 클릭시 다시 최신순으로 보여주기 */
         function placeNoList(){
            console.log("최신순");
            $.ajax({
               url: "placeNoList.sc",
               data: {
                  title : "<%=placeTitle%>",
                  cpage : 1
               },
               success: function(result){
                  console.log("최신순" + result);
                  
                  /* 검색 결과가 없습니다 유지 */
                  if (result[1].length == 0){
                     const noSearch = document.createElement("li");
                     noSearch.innerHTML = "검색 결과가 없습니다.";
                     document.getElementsByClassName('ulclass').appendChild(noSearch);
                  }
                  
                  /* 최신순 그리기 */
                  let str1 = ""
                  for (let r of result[1]){
                     str1 += '<div class="serach-result-all">'
                            + '<div class="search-info-list">'
                            + '<ul class="ulclass">' 
                         + '<li>'
                               + '<a href="eventdetailView.ed?pno="' + r.placeNo + '">'
                                + '<img src="' + r.imagePath + r.imageChange + '" alt="검색결과이미지">'
                               + '</a>'
                             + '<div class="result-content">'
                             + '<div class="">'
                             + '<div class="result-title">'
                             + '<a href="eventdetailView.ed?pno="' + r.placeNo + '">' + r.placeTitle + '</a></div>'
                             + '<div class="result-area"><span>"' + r.placeAddress + '"</span></div>'
                             + '</div></div></li>'
                             + '</ul></div></div>'
                  }
                  document.querySelector(".serach-result-all").innerHTML = str1;
                  
                  
                  /* 페이지네이션 그리기 */
                  let str2 = ""
                  str2 += '<ul class="pagination justify-content-center" id="search-pagination">'
                  if (result[0].currentPage != 1){
                     str2 += '<li class="page-item"><a class="page-link" href="search.sc?cpage="' + result[0].currentPage + '"&title="' + result[1].placeTitle + '"">&lt;</a></li>'
                  }
                  for (let i = result[0].startPage; i <= result[0].endPage; i++){
                     if (i == result[0].currentPage){
                        str2 += '<li class="page-item"><a class="page-link" href="" disabled>' + i + '</a></li>'
                     } else {
                        str2 +=  '<li class="page-item"><a class="page-link" href="search.sc?cpage="' + i + '"&title="' + result[1].placeTitle + '"">' + i + '</a></li>'
                     }
                     if (listNull != 0 && result[0].currentPage != result[0].maxPage) {
                        str2 += '<li class="page-item"><a class="page-link" href="search.sc?cpage="' + result[0].currentPage + '"&title="' + result[1].placeTitle + '"">&gt;</a></li>'
                     }
                     str2 += '</ul>'
                  }
                  document.querySelector("#search-pagination").innerHTML = str2;
                     
               }, error: function(){
                  console.log("ajax 통신 실패");
               }
            })
         }
         /* 인기순 버튼 클릭시 인기순으로 보여주기 */
         function placeCountList(){
            console.log("인기순");
            $.ajax({
               url: "placeCountList.sc",
               data: {
                  title : "<%=placeTitle%>",
                  cpage : 1
               },
               success: function(result){
                  console.log(result);      
                  
                  /* 검색 결과가 없습니다 유지 */
                  if (result[1].length == 0){
                     const noSearch = document.createElement("li");
                     noSearch.innerHTML = "검색 결과가 없습니다.";
                     document.getElementsByClassName('ulclass').appendChild(noSearch);
                  }
                  
                  /* 인기순 그리기 */
                  let str1 = ""
                  for (let r of result[1]){
                     str1 += '<div class="serach-result-all">'
                            + '<div class="search-info-list">'
                            + '<ul class="ulclass">' 
                         + '<li>'
                               + '<a href="eventdetailView.ed?pno="' + r.placeNo + '">'
                                + '<img src="' + r.imagePath + r.imageChange + '" alt="검색결과이미지">'
                               + '</a>'
                             + '<div class="result-content">'
                             + '<div class="">'
                             + '<div class="result-title">'
                             + '<a href="eventdetailView.ed?pno="' + r.placeNo + '">' + r.placeTitle + '</a></div>'
                             + '<div class="result-area"><span>"' + r.placeAddress + '"</span></div>'
                             + '</div></div></li>'
                             + '</ul></div></div>'
                  }
                  document.querySelector(".serach-result-all").innerHTML = str1;
                  
                  
                  /* 페이지네이션 그리기 */
                  let str2 = ""
                  str2 += '<ul class="pagination justify-content-center" id="search-pagination">'
                  if (result[0].currentPage != 1){
                     str2 += '<li class="page-item"><a class="page-link" href="search.sc?cpage="' + result[0].currentPage + '"&title="' + result[1].placeTitle + '"">&lt;</a></li>'
                  }
                  for (let i = result[0].startPage; i <= result[0].endPage; i++){
                     if (i == result[0].currentPage){
                        str2 += '<li class="page-item"><a class="page-link" href="" disabled>' + i + '</a></li>'
                     } else {
                        str2 +=  '<li class="page-item"><a class="page-link" href="search.sc?cpage="' + i + '"&title="' + result[1].placeTitle + '"">' + i + '</a></li>'
                     }
                     if (listNull != 0 && result[0].currentPage != result[0].maxPage) {
                        str2 += '<li class="page-item"><a class="page-link" href="search.sc?cpage="' + result[0].currentPage + '"&title="' + result[1].placeTitle + '"">&gt;</a></li>'
                     }
                     str2 += '</ul>'
                  }
                  document.querySelector("#search-pagination").innerHTML = str2;
                  
                  
               },
               error: function(){
                  console.log("ajax 통신 실패");
               }
            })
         }


         </script>

       
    <%@ include file = "./footer.jsp"%>
       
</body>
</html>