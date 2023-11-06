<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    #image{
        width: 700px;
        height: 350px;
        background-color: beige;
    }

    #text1{
        max-width: 680px;
        text-align: left;
        line-height: 23px;

    }
    #map{
        width: 650px;
        height: 250px;
        background-color: rgb(178, 191, 207);
    }
    #table-area {
        max-width: 680px;
        text-align: left;
        width:100%;
        border-spacing: 10px;
    }
    #like{
       width: 25px;
    }
    
    .td1{
       max-width: 250px;
    }





</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp"%>
 
   <div id="outer" align="center">
        <br>
        <br>
        <h1>독립기념관단풍나무숲길</h1>

        <h3 style="color: rgb(65, 65, 65);">가을의 낭만을 즐길 수 있는 곳</h3>

        <div align="right" style="max-width: 650px;">
            <!-- 즐겨찾기 안했을 때 -->
            <img src="../../resources/logo/즐겨찾기모음+즐겨찾기전.png" alt=" 즐겨찾기" id="like">
            <!-- 즐겨찾기 했을 때-->
            <img src="../../resources/logo/즐겨찾기-후.png" alt=" 즐겨찾기" id="like">
        </div>

        <br>

        <div id="image">
        </div>

        <br><br>

        <h2 style="margin-right: 600px">상세정보</h2>
        <hr width="700">

        <br>

        <div id="text1">
            독립기념관 단풍나무숲길은 2017년 ‘제1회 단풍나무숲길힐링축제’ 개최를 통해 독립운동사 강연, 통기타 공연, 사진 촬영 등 다채로운 프로그램을 선보였다. 전국의 관광객들에게 독립기념관 단풍나무길을 알리는데 큰 역할을 하였다. 독립기념관 단풍나무숲길은 봄과 여름에는 파랗지만 가을에는 어김없이 빨갛게 물드는 고유수종 청단풍으로 이루어졌다. 수령 20년이 넘은 나무가 터널을 이루어 여느 단풍길과 비교해도 손색이 없다.
        </div>

        <br><br>


        <div id="map">
        </div>

        <br><br>

        <div >
            <table id="table-area">
                <tr>
                    <th><li>주소</li></th>
                    <td class="td1">서울특별시 강남구 테헤란로14길 6</td>
                    <th><li>테마</li></th>
                    <td>계절</td>
                </tr>
                <tr>
                    <th><li>홈페이지</li></th>
                    <td class="td1"><a>https://www.iei.or.kr/main/main.kh</a></td>
                    <th><li>연락처</li></th>
                    <td>0507-1400-2037</td>
                </tr>
                <tr>
                    <th><li>이용시간</li></th>
                    <td>12:00 ~ 15:00</td>
                    <th><li>행사기간</li></th>
                    <td>2023-10-01 ~ 2023-12-31</td>
                </tr>
            </table>
        </div>
    </div>
    <br><br><br>

</body>
</html>