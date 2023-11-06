<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageForm title here</title>
<style>
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

   <div class="myPageForm">
      <div class = "myPageFormdiv">
          <div class="myPageFormHeader">
              <div class="myPageTitle"><h2>마이페이지</h2></div>
              <form action="" method="post" class="row g-3 needs-validation" novalidate>
              <div class="form-floating">
                <input type="text" class="form-control" readonly id="idInput" value="아이디" required>
                <label for="floatingId">아이디</label>
              </div>
              <div class="form-floating">
                <input type="password" class="form-control" id="passInput" placeholder="Password를 입력하세요." required>
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
                <input type="text" class="form-control" id="nameInput" value="권두원" readonly required>
                <label for="floatingName">이름</label>
              </div>
              <div class="input-group mb-3">
                <input type="text" class="form-control" aria-label="email" value="whgdk9548@naver.com" required>
              </div>
              <div class="mb-3">
                <select class="form-select" required aria-label="select example">
                  <option value="">남자</option>
                </select>
              </div>
              <button  class="btn btn-outline-success" type="submit">수정완료</button>
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