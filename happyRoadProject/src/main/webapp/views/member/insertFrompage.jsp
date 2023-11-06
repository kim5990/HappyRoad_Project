<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .insertForm{
      display: flex;
      width: 100%;
      height: 1000px;
      justify-content: center;
      
    }
    .insertFormdiv{
      display: flex;
      width: 800px;
      height: 800px;
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

    .mb-3{
      justify-content: center;
      display: flex;
      height: 58px;
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
              <a class="nav-link" aria-current="page" style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);" href="loginForm.me" >로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="background-color: rgb(81, 126, 165); color: white;" href="insertform.me" selected >회원가입</a>
            </li>
      </div>
    </div>
  </div>
   <div class="insertForm">
      <div class = "insertFormdiv">
          <div class="insertFormHeader">
              <div class="insertTitle"><h2>회원가입</h2></div>
              <form action="" method="post" class="row g-3 needs-validation" novalidate>
              <div class="form-floating">
                <input type="text" class="form-control" id="idInput" placeholder="ID를 입력하세요" required>
                <label for="idInput">아이디</label>
                <div class="invalid-feedback">
                  5글자 이상 10글자 이하로 작성해 주세요.
                </div>
                <div class="valid-feedback">
                  사용가능한 아이디 입니다.
                </div>
              </div>
              <div class="form-floating">
                <input type="password" class="form-control" id="passInput" placeholder="Password를 입력하세요." required>
                <label for="passInput">비밀번호</label>
                <div class="invalid-feedback">
                  비밀번호 8이상 13이하 (숫자, 문자 합성해주세요)
                </div>
                <div class="valid-feedback">
                  사용가능한 비밀번호 입니다.
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
                <input type="text" class="form-control" id="nameInput" placeholder="이름을 입력하세요" required>
                <label for="floatingName">이름</label>
                <div class="invalid-feedback">
                  5글자 이상 10글자 이하로 작성해 주세요.
                </div>
                <div class="valid-feedback">
                  사용가능한 이름 입니다.
                </div>
              </div>
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="이메일작성" aria-label="email" required>
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" placeholder="ex)naver.com" aria-label="emailaddress" required>
                <div class="invalid-feedback">
                  작성이 안됐습니다.
                </div>
                <div class="valid-feedback">
                  참 잘했습니다.
                </div>
                
              </div>
              <div class="mb-3">
                <select class="form-select" required aria-label="select example">
                  <option value="">성별(선택)</option>
                  <option value="1">남자</option>
                  <option value="2">여자</option>
                </select>
                <br>
                <div class="invalid-feedback">성별은 반드시 입력해주세요</div>
              </div>

              <button  class="btn btn-outline-success" type="submit">가입하기</button>
              <button  class="btn btn-danger" id="back-btn" type="button">뒤로가기</button>        
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
        let isIDINPUT=false;
        let isPASSINPUT=false;
        let isPASSCHECKINPUT=false;
        let isNAMEINPUT=false;
        let isGENDER=false;

      document.querySelector("#nameInput").addEventListener("input", function(){
      //1. 입력한 value 값을 읽어온다.
      let inputId=this.value;
      //2. 유효성(5글자이상 10글자 이하)을 검증한다.
      isIDINPUT = inputId.length >= 5 && inputId.length <= 10;
      //3. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
      if(isIDINPUT){
         this.classList.remove("is-invalid");
         this.classList.add("is-valid");
      }else{
         this.classList.remove("is-valid");
         this.classList.add("is-invalid");
      }
   });

   document.querySelector("#idName").addEventListener("input", function(){
      //1. 입력한 value 값을 읽어온다.
      let inputName=this.value;
      //2. 유효성(5글자이상 10글자 이하)을 검증한다.
      isIDINPUT = inputName.length >= 5 && inputName.length <= 10;
      //3. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
      if(isNAMEINPUT){
         this.classList.remove("is-invalid");
         this.classList.add("is-valid");
      }else{
         this.classList.remove("is-valid");
         this.classList.add("is-invalid");
      }
   });
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
</body>
</html>