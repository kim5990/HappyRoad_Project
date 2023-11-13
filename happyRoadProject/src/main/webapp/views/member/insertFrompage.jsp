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
        </ul>
      </div>
    </div>
  </div>
   <div class="insertForm">
      <div class = "insertFormdiv">
          <div class="insertFormHeader">
              <div class="insertTitle"><h2>회원가입</h2></div>
              <form action="insert.me" method="post" id="enroll-form" class="row g-3 needs-validation" novalidate>
              <div class="form-floating">
                <input type="text" class="form-control" id="idInput" name="userId" placeholder="ID를 입력하세요(최소 5글자 이상)" required>
                <button type="button" class="btn btn-light" onclick="idCheck()">중복확인</button>
                <label for="idInput">아이디</label>
                <div id="checkResult" style="font-size:0.7em; display:none;"></div>
              </div>
              <div class="form-floating">
                <input type="password" class="form-control" id="passInput" name="userPwd"  placeholder="Password를 입력하세요." required>
                <label for="passInput">비밀번호</label>
                <div class="invalid-feedback">
                  비밀번호 8이상 13이하 (숫자, 문자 합성해주세요)
                </div>
                <div class="valid-feedback">
                  사용가능한 비밀번호 입니다.
                </div>
              </div>
              <div class="form-floating">
                <input type="password" class="form-control" id="passCheckInput" name="passCheckInput" placeholder="Password를 입력하세요." required>
                <label for="passCheckInput">비밀번호확인</label>
                <div class="invalid-feedback">
                  비밀번호가 다릅니다.
                </div>
                <div class="valid-feedback">
                  비밀번호를 확인했습니다.
                </div>
              </div>
              <div class="form-floating">
                <input type="text" class="form-control" id="nameInput" name="userName"  placeholder="이름을 입력하세요" required>
                <label for="floatingName">이름</label>
              </div>
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="이메일작성" name="firstEmail" aria-label="email" required>
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" placeholder="ex)naver.com" name="secondEmail" aria-label="emailaddress" required>
                <div class="invalid-feedback">
                  작성이 안됐습니다.
                </div>
                <div class="valid-feedback">
                  참 잘했습니다.
                </div>
              </div>
           	  <div class="form-floating">
              	<input type="text" class="form-control" placeholder="전화번호작성" name="userPhone" required>
              	<label for="floatingName">전화번호</label>
              	<div class="invalid-feedback">
                  작성이 안됐습니다.
                </div>
                <div class="valid-feedback">
                  참 잘했습니다.
                </div>
              </div>
              <button  class="btn btn-outline-success" type="submit" onclick="return checkPwd();">가입하기</button>
              <button  class="btn btn-danger" id="back-btn" type="button">뒤로가기</button>        
            </form>
          </div>
      </div>
   </div>
   <%@ include file = "../common/footer.jsp"%>
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
   		function idCheck(){
			const idInput = document.querySelector("#enroll-form input[name=userId]");
				
			$.ajax({
		   		url: "idCheck.me",
		   		data: {
		   			"checkId" : idInput.value
		   		},
		   		success : function(result){
		   			if(result === 'NNNNY'){
		   				if (confirm("사용가능한 아이디입니다. 사용하시겠습니다?")) {
								let submitBtn = document.querySelector("#enroll-form button[type=submit]");
								submitBtn.removeAttribute("disabled");
								
								idInput.setAttribute("readonly", true);
							} else {
								idInput.focus();
							}
		   			} else {
		   				alert("이미 존재하거나 탈퇴한 회원입니다.")
							idInput.focus();
		   			}
		   		},
		   		error: function(){
		   			console.log("아이디 중복체크용 ajax통신 실패");
		   		}
		   	})
		};
		
		function checkPwd(){
            let pwdInput = document.querySelector("#enroll-form input[name=userPwd]");
            let pwdCheckInput = document.querySelector("#enroll-form input[name=passCheckInput]");
            if (pwdInput.value !== pwdCheckInput.value) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
                let submitBtn = document.querySelector("#enroll-form button[type=submit]");
				submitBtn.removeAttribute("disabled");
            }
        }
    </script>

    
</body>
</html>