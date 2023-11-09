<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.hrp.common.PageInfo, java.util.ArrayList, com.kh.hrp.board.model.vo.Board" %>
<%
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   
   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Document</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
   <style>
        .search-input{
                    display: flex;
                    width: 100%;
                    height: 30px;
                    align-items: center;
                    justify-content: center;
                }
        .left-search-section {
            display: flex;
            width: 800px;
            justify-content: end;
            
        }

        /* th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        text-align: center;
        } */

        .th{
            border-top: 3px solid #ddd;
            border-bottom: 3px solid #ddd;
            padding: 8px;
            align-items: center;
        }
        .td{    
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
      .list-area>tbody>tr:hover{
          background: gray;
          cursor:pointer;
       }

        #num-btn{
            width: 40px;
            height: 40px;
            font-size: 16px;
            color: black;
            border: none;
        }
        #text{
            text-decoration: none;
        }
        #write-btn{
            border: 1px solid rgb(84, 126, 150);
        }

   </style>

   </head>
   <body>
   <%@ include file = "../common/menubar.jsp"%>
    
    <biv >
        <h1 align="center" style="margin-top: 40px;">자유게시판</h1>
    
        <div class="search-input">
            <div class="left-search-section">
                <input type="text" class="left-section_input" style="background: white;">
                <input type="image" src="./resources/logo/free-icon-magnifier-2319177.png" height="17" width="17">
            </div>
        </div>
    
        <div class="outer">
            <div class="line"></div>
            <table align="center" class="list-area">
                <thead align="center">
                    <tr>
                        <th  width="70" class="th">번호</th>
                        <th width="350" class="th">제 목</th>
                        <th width="80" class="th">작성자</th>
                        <th width="100" class="th">첨부</th>
                        <th width="120" class="th">날짜</th>
                        <th width="80" class="th">조회</th>
                    </tr>
                    
                </thead>
        
                <tbody align="center">
                <%if(list.isEmpty()){ %>
                   <tr>
                       <td colspan="6">조회된 게시글이 없습니다.</td>
                   </tr>
            <%} else {%>
               <% for(Board b : list){ %>
                    <tr>
                        <td class="td"><%=b.getBoardNo() %></td>
                        <td class="td"><%=b.getBoardTitle() %></td>
                        <td class="td"><%=b.getBoardUser() %></td>
                        <td class="td">-</td>
                        <td class="td"><%=b.getBoardEnrollDate() %></td>
                        <td class="td"><%=b.getBoardCount() %></td>
                    </tr>
                    <%} %>
                <%} %>
                </tbody>
            </table>
            <script>
           $(function(){
                 $(".list-area>tbody>tr").click(function(){
                    // $(this) => 클릭된 객체를 가르킨다.
                    // 객체.children() => 객체의 자식노드List을 전부 가져온다.
                    // 노드List.eq(index) => 노드lsit에서 해당 index의 값을 가져온다.
                    // text() => 그냥 메소드를 호출하면 텍스를 반환하고 내부에 값을 전달하면 값이 들어간다.
                    
                    location.href = "<%=contextPath%>/detail.fv?bno=" + $(this).children().eq(0).text();
                 })
              })
           </script>
        </div>
        <br>
    
    	<% if (loginUser != null) {%>
        <div class="search-input">
            <div class="left-search-section">
                <input type="button" value="글쓰기" class="btn btn-light" id="write-btn" onclick="location.href = 'freeboardenroll.fb'">
            </div>
        </div>
        <%} %>
    
        <br><br>

        <div align="center">
           <%if(currentPage != 1){ %>
               <button id="num-btn"><a href="<%=contextPath%>/freeboardForm.fb?cpage=<%=currentPage - 1%>" id="text">&lt;</a></button>
            <%} %>
            
            <%for(int p = startPage; p <= endPage; p++) { %>
              <%if(p == currentPage) { %>
                 <button id="num-btn"><a id="text"><%=p %></a></button>
              <%} else { %>
                  <button id="num-btn"><a href="<%=contextPath%>/freeboardForm.fb?cpage=<%=p %>" id="text"><%=p %></a></button>
               <%} %>
               
            <%} %>
            <% if(currentPage != maxPage){ %>
               <button id="num-btn"><a href="<%=contextPath%>/freeboardForm.fb?cpage=<%=currentPage + 1%>" id="text">&gt;</a></button>
            <%} %>
            
        </div>
    <%@ include file = "../common/footer.jsp"%>

</body>

</html>