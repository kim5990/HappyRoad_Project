<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    .review-area{
       /* border: 1px solid black; */
       max-width: 680px;
       width:100%;
       /* background-color: rgb(235, 235, 208); */   
    }
    
    .review-pagebar  a{
    	margin: 0 5px; /* 좌우 여백을 5px로 조정, 필요한 간격으로 조절 가능 */
        text-decoration: none;
    }


</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp"%>
 
   <div id="outer" align="center">
        <br>
        <br>
        <h1>${p.placeTitle}</h1>

        <h3 style="color: rgb(65, 65, 65);">${p.placeContentPoint}</h3>

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
            ${p.placeContentDetail}
        </div>

        <br><br>


        <div id="map">
        </div>

        <br><br>

        <div >
            <table id="table-area">
                <tr>
                    <th><li>주소</li></th>
                    <td class="td1">${p.placeAddress}</td>
                    <th><li>테마</li></th>
                    <td>${p.placeThema}</td>
                </tr>
                <tr>
                    <th><li>홈페이지</li></th>
                    <td class="td1"><a>${p.placeHomepage}</a></td>
                    <th><li>연락처</li></th>
                    <td>${p.placeContact}</td>
                </tr>
                <tr>
                    <th><li>이용시간</li></th>
                    <td>${p.placeTime}</td>
                    <th><li>행사기간</li></th>
                    <td>${p.placeStart} ~ ${p.placeEnd}</td>
                </tr>
            </table>
        </div>
    
    <br><br><br>
    
    <br><br><br><br>
        
        <h2 style="margin-right: 600px">후기</h2>
        <hr width="700">
        <br>


        <!-- 로그인 정보 없을 경우 -->

        <!-- 리뷰 없을 경우 -->


        <!-- 로그인 정보 + 리뷰 있을 경우 -->
        

        <table class="review-area" style="padding-right: 20px;">              
                <tr>
                    <th rowspan="2" style="width:50px;">user01</th>
                    <td align="center" style="height: 40px;">ㅇㅇㅇㅇㅇ</td>
                    <td align="right" style="padding-right: 50px;">2023-11-03</td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 10px;">정말 별로였습니다 다들 가지 마세요 정말 별로였습니다 다들 가지 마세요 정말 별로였습니다 다들 가지 마세요 정말 별로였습니다 다들 가지 마세요 정말 별로였습니다 다들 가지 마세요 정말 별로였습니다 다들 가지 마세요 </td>
                </tr>
                <tr style="height: 15px;"></tr>
                


                <tr>
                    <th rowspan="2" style="width: 120px;">user01</th>
                    <td align="center" style="height: 40px;">ㅇㅁㅁㅁㅁ</td>
                    <td align="right" style="padding-right: 50px;">2023-11-03</td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 10px;">만족했습니다 갈만해요 만족했습니다 갈만해요 만족했습니다 갈만해요 만족했습니다 갈만해요 만족했습니다 갈만해요 만족했습니다 갈만해요  </td>
                </tr>
                <tr style="height: 15px;"></tr>
        </table>
        <br>

        <div class="review-pagebar">
            <a><</a>
            <a>1</a>
            <a>2</a>
            <a>3</a>
            <a>></a>

        </div>
        
        <br><br>
    </div>

    <%@ include file = "../common/footer.jsp"%>
    
    
    </div>

</body>
</html>