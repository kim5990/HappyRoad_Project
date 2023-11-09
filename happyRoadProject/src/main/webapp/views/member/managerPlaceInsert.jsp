<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        .insertPlace {
            display: flex;
            justify-content: center;
        }

        .mb-3 {
            width: 600px;
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
                        <a class="nav-link" style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);"
                            aria-current="page" href="list.fa">즐겨찾기 리스트</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" style="background-color: rgb(255, 255, 255); color: rgb(81, 126, 165);"
                            href="myPage.me">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  active" style="background-color: rgb(81, 126, 165); color: white;"
                            href="">장소 추가</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="insertForm">
        <div class="text-bg-light p-3 insertFormdiv">
            <div class="insertFormHeader">
                <br>
                <div class="insertTitle">
                    <h2>장소 게시물 추가</h2>
                </div>
                <br>
                <form action="placeInsert.ma" method="post">
                    <div class="insertPlace">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" name="placeTitle"
                                placeholder="방문지를 쓰세요">
                            <label for="floatingInput">방문지</label>
                            <div class="form-floating">
                                <select class="form-select" id="floatingSelect"
                                    aria-label="Floating label select example" name="placeThema">
                                    <option selected>테마</option>
                                    <option value="season">계절</option>
                                    <option value="downtown">도심</option>
                                    <option value="festival">축제</option>
                                    <option value=" healing">힐링</option>
                                </select>
                                <label for="floatingSelect">THEMA</label>
                            </div>
                        </div>
                    </div>

                    <div class="insertPlace">
                        <div class="mb-3">
                            <input type="email" class="form-control" name="placeContentPoint"
                                id="exampleFormControlInput1" placeholder="한줄 설명">
                        </div>
                    </div>
                    <div class="insertPlace">
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">상세 설명</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="placeContentDetail"
                                rows="3"></textarea>
                        </div>
                    </div>

                    <div class="insertPlace">
                        <div class="mb-3">
                            <input type="email" class="form-control" name="placeAddress" id="exampleFormControlInput1"
                                placeholder="예시)서울특별시 강남구 테헤란로14길 6">
                        </div>
                    </div>
                    <div class="insertPlace">
                        <div class="mb-3">

                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon3">홈페이지 url</span>
                                <input type="text" class="form-control" name="placeHomepage" id="basic-url"
                                    aria-describedby="basic-addon3 basic-addon4">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">전화번호</span>
                                <input type="text" name="placeContact" class="form-control" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-sm">
                            </div>
                        </div>
                    </div>

                    <div class="insertPlace">
                        <div class="row g-2">
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="date" name="placeStart" class="form-control" id="floatingInputGrid"
                                        placeholder="2023-10-01" value="">
                                    <label for="floatingInputGrid">행사시작일</label>
                                </div>
                            </div>
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="date" name="placeEnd" class="form-control" id="floatingInputGrid"
                                        placeholder="2023-10-01" value="">
                                    <label for="floatingInputGrid">행사종료일</label>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating">
                                        <input type="time" name="startTime" class="form-control" id="floatingInputGrid"
                                            placeholder="2023-10-01" value="">
                                        <label for="floatingInputGrid">이용시간부터</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating">
                                        <input type="time" name="endTime" class="form-control" id="floatingInputGrid"
                                            placeholder="010-xxxx-xxxx" value="">
                                        <label for="floatingInputGrid">까지</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="insertPlace">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupFile01">업로드</label>
                            <input type="file" class="form-control" id="inputGroupFile01">
                        </div>
                    </div>
                    <div class="insertPlace">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupFile01">업로드</label>
                            <input type="file" class="form-control" id="inputGroupFile01">
                        </div>
                    </div>
                    <div class="insertPlace">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupFile01">업로드</label>
                            <input type="file" class="form-control" id="inputGroupFile01">
                        </div>
                    </div>
                    <div class="insertPlace">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupFile01">업로드</label>
                            <input type="file" class="form-control" id="inputGroupFile01">
                        </div>
                    </div>
                    <br>

                    <button type="submit" class="btn btn-success">게시물 추가</button>
                </form>
                <%@ include file = "../common/footer.jsp"%>
            </div>
        </div>
    </div>
</body>
</html>