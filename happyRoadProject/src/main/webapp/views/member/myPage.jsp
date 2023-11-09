<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageForm title here</title>
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
    .myPageForm{
      display: flex;
      width: 100%;
      height: auto;
      justify-content: center;
      
    }
    .myPageFormdiv{
      display: flex;
      width: 800px;
      height: 800px;
      border: 1px solid black;
      justify-content: center;
      border-radius: 20px;
    }
    .myPageFormHeader{
      width: 500px;
    }

    .myPageTitle{
      display: flex;
      justify-content: center;
      margin-top: 20px;
      margin-bottom: 20px;
    }

    #back-btn{
      color: rgb(235, 162, 162);
      border: 1px solid rgb(235, 162, 162);
      --bs-btn-active-bg: rgb(235, 162, 162);
      background-color: white;
    }
    #back-btn:hover{
      background-color: rgb(235, 162, 162);
      color: white;
    }

    .mb-3{
      justify-content: center;
      display: flex;
      height: 58px;
    }


</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp"%>
    <%
    	String userId = loginUser.getUserId();
    	String userName = loginUser.getUserName();
    	String userPhone = loginUser.getUserPhone();
    	String userEmail = loginUser.getUserEmail();
    	String userPwd = loginUser.getUserPwd();
    %>
    <div class="memberMenu">
       <div class="memberMenuBar">
         <div class="memberMenu">
           <ul class="nav nav-tabs">
             <li class="nav-item ">
               <a class="nav-link"  style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);"
                 aria-current="page" href="list.fa?cpage=1&userNo=<%=loginUser.getUserNo() %>">즐겨찾기 리스트</a>
             </li>
             <li class="nav-item">
               <a class="nav-link active" style="background-color: rgb(81, 126, 165); color: white;"
                 href="myPage.me">마이페이지</a>
             </li>     
             <%if (loginUser.getUser_level().equals("0")){ %>
	             <li>
	             	<a class="nav-link active" style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);"
	                 href="place.ma">장소 추가</a>
	             </li>
             <%} %>
           </ul>
         </div>
       </div>
     </div>
   <div class="myPageForm">
      <div class = "myPageFormdiv">
          <div class="myPageFormHeader">
          <br><br>
              <div class="myPageTitle"><h2>마이페이지</h2></div>
              <form action="<%=contextPath %>/update.me" method="post" class="row g-3 needs-validation" novalidate>
              <div class="form-floating">
                <input type="text" class="form-control" id="idInput" name="userId" value="<%=userId %>" readonly required>
                <label for="floatingId">아이디</label>
              </div>
              <div class="form-floating">
                <input type="text" class="form-control" id="nameInput" name="userName" value="<%=userName %>"  required>
                <label for="floatingName">이름</label>
              </div>
             <div class="form-floating">
                <input type="text" class="form-control" id="nameInput" name="userEmail" value="<%=userEmail %>"  required>
                <label for="floatingName">이메일</label>
              </div>
              <div class="form-floating">
                <input type="text" class="form-control" placeholder="전화번호작성" name="userPhone" value="<%=userPhone %>" required>
              	<label for="floatingName">전화번호</label>              	
              </div>
              <button class="btn btn-outline-success" type="submit">정보변경</button>
              <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#updatePwdModal">비밀번호변경</button>
              <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#deleteModal">회원탈퇴</button>
              <button type="button" class="btn btn-outline-danger" onclick="history.back()">뒤로가기</button>        
            </form>
          </div>
      </div>
   </div>
    <div class="modal" id="deleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회원탈퇴</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <form action="<%=contextPath %>/delete.me" method="post">
                    	<b>탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까?</b>
                    	<br><br>
                    	
                    	<input type="hidden" name="userId" value="<%=userId %>">
                    	
                    	비밀번호 : <input type="password" name="userPwd" required>
                    	<br><br>
                    	<button type="submit" class="btn btn-outline-warning">탈퇴하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file = "../common/footer.jsp"%>
    <!-- 비밀번호 변경용 Modal -->
    <div class="modal" id="updatePwdModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">비밀번호 변경</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <form action="<%=contextPath %>/updatePwd.me" method="post">
                    	<input type="hidden" name="userId" value=<%=userId %> >
                        <table>
                            <tr>
                                <td>현재 비밀번호</td>
                                <td><input type="password" name="userPwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호</td>
                                <td><input type="password" name="updatePwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호 확인</td>
                                <td><input type="password" name="checkPwd" required></td>
                            </tr>
                        </table>
                        <br>
                        <button id="edit-pwd-btn" type="submit" class="btn btn-sm btn-secondary" >비밀번호변경</button>
                    </form>

                    <script>
                        document.getElementById('edit-pwd-btn').onclick = function(){
                            if ($("input[name=updatePwd]").val() !== $("input[name=checkPwd]").val()) {
                                alert("비밀번호를 확인해주세요.")
                                return false;
                            }
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
</body>
</html>