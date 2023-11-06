<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      .memberMenu{
      display: flex;
      width: 100%;
      justify-content: center;
      margin-top: 30px;
    }

    .memberMenuBar{
      display: flex;
      width: 770px;
      height: auto;
      justify-content: center;
    }

    .memberMenuBar .btn-active{
      background-color: #198754;
      color: white;
    }


    .insertForm{
      display: flex;
      width: 100%;
      justify-content: center;
      
    }
    .insertFormdiv{
      display: flex;
      width: 800px;
      height: 600px;
      border: 1px solid black;
      justify-content: center;
      border-radius: 20px;
    }
    .insertFormHeader{
      width: 500px;
    }

    .insertTitle{
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
    </style>
</head>
<body>
  <%@ include file = "../common/menubar.jsp"%>
      <div class="memberMenu">
        <div class="memberMenuBar">
          <div class="memberMenu">
            <ul class="nav nav-tabs">
                <li class="nav-item ">
                  <a class="nav-link active" style="background-color: rgb(81, 126, 165); color: white;" aria-current="page" href="loginForm.me" >로그인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);" href="insertform.me">회원가입</a>
                </li>
          </div>
        </div>  
      </div>
              <div class="insertForm">
                <div class = "insertFormdiv">
                  <div class="insertFormHeader">
                      <div class="insertTitle"><h2>로그인</h2></div>
                      <form action="login.me" method="post" class="row g-3 needs-validation" novalidate>
                      <div class="form-floating">
                        <input type="text" class="form-control" id="idInput" name ="userId" aria-describedby="inputGroupPrepend" placeholder="ID를 입력하세요" required>
                        <label for="idinput">아이디</label>
                        <div class="invalid-feedback">
                          아이디를 입력하세요.
                        </div>
                        <div class="valid-feedback">
                          참 잘했습니다.
                        </div>
                      </div>
                      <div class="form-floating">
                        <input type="password" class="form-control" id="passwordInput" name ="userPwd" aria-describedby="inputGroupPrepend" placeholder="Password를 입력하세요." required>
                        <label for="passwordInput">비밀번호</label>
                        <div class="invalid-feedback">
                          비밀번호를 입력하세요.
                        </div>
                        <div class="valid-feedback">
                          참 잘했습니다.
                        </div>
                      </div>
                      <br><br><br><br>
                      <button  class="btn btn-outline-success" type="submit">로그인</button>
                      <button  class="btn btn-danger" id="back-btn" type="submit">뒤로가기</button>
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


</body>
</html>