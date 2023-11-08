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
      height: 1000px;
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
               <a class="nav-link active"  style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);"
                 aria-current="page" href="list.fa">즐겨찾기 리스트</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" style="background-color: rgb(81, 126, 165); color: white;"
                 href="myPage.me">마이페이지</a>
             </li>
         </div>
       </div>
     </div>

   <div class="myPageForm">
      <div class = "myPageFormdiv">
          <div class="myPageFormHeader">
              <div class="myPageTitle"><h2>마이페이지</h2></div>
              <form action="update.pwd" method="post" class="row g-3 needs-validation" novalidate>
              <div class="form-floating">
                <input type="text" class="form-control" readonly id="idInput" name="userId" value="<%=userId %>" required>
                <label for="floatingId">아이디</label>
              </div>
              <div class="form-floating">
              	<input type="password" class="form-control" id="pwdInput" name="userPwd" value="<%=userPwd %>" readonly>
              </div>
              <div class="form-floating">
                <input type="password" class="form-control" id="passInput" name="updatePwd" placeholder="Password를 입력하세요." required>
                <label for="passInput">변경할 비밀번호</label>
                <div class="invalid-feedback">
                  비밀번호 8이상 13이하 (숫자, 문자 합성해주세요)
                </div>
                <div class="valid-feedback">
                  변경가능한 비밀번호 입니다.
                </div>
              </div>
              <div class="form-floating">
                <input type="password" class="form-control" id="passCheckInput" placeholder="Password를 입력하세요." required>
                <label for="passCheckInput">비밀번호확인</label>
                <div class="invalid-feedback">
                  비밀번호가 다릅니다.
                </div>
                <div class="valid-feedback">
                  비밀번호를 확인했습니다.
                </div>
              </div>
              <div class="form-floating">
                <input type="text" class="form-control" id="nameInput" value="<%=userName %>" readonly required>
                <label for="floatingName">이름</label>
              </div>
             <div class="form-floating">
                <input type="text" class="form-control" id="nameInput" value="<%=userEmail %>" readonly required>
                <label for="floatingName">이메일</label>
              </div>
              <div class="form-floating">
                <input type="text" class="form-control" placeholder="전화번호작성" value="<%=userPhone %>" readonly required>
              	<label for="floatingName">전화번호</label>
              	
              </div>
              <button  class="btn btn-outline-success" type="submit">수정완료</button>
              <button  class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#deleteModal">회원탈퇴</button>
              <button  class="btn btn-outline-danger" onclick="history.back()" type="button">뒤로가기</button>        
            </form>
          </div>
      </div>
   </div>
   <script>
     // Example starter JavaScript for disabling form submissions if there are invalid fields
     (() => {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
  })()
    </script>

    <script>
      document.querySelector("#passCheckInput").addEventListener("input", function(){
          let passCheak = this.value;
          let passInput = document.querySelector("#passInput").value
          isPASSINPUT = passInput === passCheck;
          if(isNAMEINPUT){
          this.classList.remove("is-invalid");
          this.classList.add("is-valid");
        }else{
          this.classList.remove("is-valid");
          this.classList.add("is-invalid");
        }
      })
    </script>
    
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
                    <form action="/delete.me" method="post">
                    	<b>탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까?</b>
                    	<br><br>
                    	
                    	<input type="hidden" name="userId" value="<%=userId %>">
                    	
                    	비밀번호 : <input type="password" name="userPwd" required>
                    	<br><br>
                    	<button type="submit" class="btn btn-sm btn-danger">탈퇴하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>