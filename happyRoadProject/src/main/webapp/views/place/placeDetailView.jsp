<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery 3.7.1 -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<style>


    .place-image{
        width: 700px;
        height: 400px;
        overflow: hidden; /* 내부 내용을 잘라내는 설정 */
        /* background-color: beige;*/
        position: relative;

        
    }
    
    .place-image img {
		width: 100%; /* 이미지의 가로 크기를 부모 요소에 맞게 100%로 설정 */
		height: auto; /* 가로 크기에 맞게 세로 비율을 유지하도록 설정 */
	}
	
	.image-all{
		max-width: 900px;
		display : flex;
		justify-content: space-around;
		align-items: center; 
	}
	
	
	#prev, #next {
		font-size: 30px;
		width: 50px
	}

	#prev:hover, #next:hover  {
		cursor: pointer;
	}
	
	

	

    #ContentDetail{
        max-width: 680px;
        text-align: left;
        line-height: 23px;

    }
    #map{
        width: 650px;
        height: 300px;
        background-color: rgb(178, 191, 207);
    }
    #table-area {
        max-width: 680px;
        text-align: left;
        width:100%;
    }
    
    .table-height{
    	 height: 150px;
    }
    
    
    .like{
       width: 25px;
    }
    .like:hover {
		cursor: pointer;
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
    	margin: 0 5px; /* 좌우 여백을 5px로 조정 */
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
        
	        <c:choose>
		        <c:when test="${ userNo == null}">
					<img src="resources/logo/즐겨찾기모음+즐겨찾기전.png" alt=" 즐겨찾기" class="like" onclick="alert('즐겨찾기 기능은 로그인 후 사용가능합니다.')">
		        </c:when>

		        <c:when test="${ userNo != null && like == false }">
					<img src="resources/logo/즐겨찾기모음+즐겨찾기전.png" alt=" 즐겨찾기" class="like" onclick="location.href='insert.li?userNo=${userNo}&placeNo=${p.placeNo}'">
		        </c:when>

		        <c:when test="${ userNo != null && like == true }">
					<img src="resources/logo/즐겨찾기-후.png" alt=" 즐겨찾기" class="like" onclick="location.href='delete.li?userNo=${userNo}&placeNo=${p.placeNo}'">
		        </c:when>
		    </c:choose>
        </div>

        <br>
        
        
		<!-- 이미지가 2개 이상일 경우 슬라이드 기능 활성화 -->
		<div class="image-all">
		    <c:choose>
		        <c:when test="${listSize > 1}">
		            <div id="prev">&lt;</div>
		        </c:when>
		    </c:choose>
		    <div class="place-image">
		        <c:forEach var="i" items="${list}" varStatus="loop">
		            <img src="resources/images/${i.placeImageChange}" alt="사진${loop.index+1}">	
		        </c:forEach>
		    </div>
		    <c:choose>
		        <c:when test="${listSize > 1}">
		            <div id="next">&gt;</div>
		        </c:when>
		    </c:choose>
		</div>

    	


        <br><br><br>

        <h2 style="margin-right: 600px">상세정보</h2>
        <hr width="700">

        <br>

        <div id="ContentDetail">
            ${p.placeContentDetail}
        </div>

        <br><br>


        <div id="map">
        </div>

        <br><br>

        <div>
            <table id="table-area">
                <tr>
                    <th style="height:30px"><li>주소</li></th>
                    <td class="td1">${p.placeAddress}</td>
                    <th><li>테마</li></th>
                    <td>${p.placeThema}</td>
                </tr>

                <tr>
                    <th style="height:30px"><li>홈페이지</li></th>
                    <td class="td1"><a>${p.placeHomepage}</a></td>
                    <th><li>연락처</li></th>
                    <td>${p.placeContact}</td>
                </tr>

                <tr>
                    <th style="height:30px"><li>이용시간</li></th>
                    <td>${p.placeTime}</td>
                    <th><li>행사기간</li></th>
                    
                    <c:choose>
                    	<c:when test="${p.placeStart != null}">
                            <td>${p.placeStart} ~ ${p.placeEnd}</td>
                    	</c:when>
                    	<c:otherwise>
                            <td></td>
                    	</c:otherwise>
                    </c:choose>        
                </tr>
            </table>
        </div>

    
  	    <br><br><br><br><br>
        
        <h2 style="margin-right: 600px">후기</h2>
        <hr width="700">
        <br>


        


        <!-- 로그인 정보 없을 경우 -->

        <!-- 리뷰 없을 경우 -->


        <!-- 로그인 정보 + 리뷰 있을 경우 -->
        

        <table id="review-area" style="padding-right: 20px; width:650px;">              
			<tbody>
			
              	
                <script>
                    onload = function(){
                        // 댓글 가져와서 그려주기
                        selectReviewList();
                    }
          
            
                    function selectReviewList(){
                    	var placeNo = "${p.placeNo}";

                        $.ajax({
                            url : "rlist.pl",
                            data : {
                                pno : placeNo,
                                cpage : 1
                            },
                            success: function(res){
                                // 위에서가 아닌 success에서 그려줘야 화면 새로고침안하고 만들어짐 
                                let str = ""
                                for (let review of res){
                                    let score = "";
                                    for (let i = 0; i < review.reviewStar; i++) {
                                            score += "<img width='15px' src='resources/logo/별점-1.png' alt='별'> ";
                                        }
                                    str += '<tr><th rowspan="2" style="width:50px;">' + review.userNo + '</th><td id="star" align="left" style="height: 40px; padding-left: 30px;">' + score + '</td><td align="right" style="padding-right: 50px;">'+ review.reviewCreateDate +'</td></tr><tr><td colspan="3" style="padding: 20px;">'+ review.reviewContent +'</td></tr><tr><td colspan="3"><hr style="width:680px;"><td></tr>'
                                }
                            document.querySelector("#review-area tbody").innerHTML = str;


                            },
                            error : function(){
                                console.log("댓글목록 조회 중 ajax 통신 실패");
                            }
                        })
                    }
                </script>
                        
			
			</tbody>
        </table>


        <br>

        <div class="review-pagebar">
            <a>&lt;</a>
            <a>1</a>
            <a>2</a>
            <a>3</a>
            <a>&gt;</a>

        </div>
        
        <br><br><br><br>
    </div>

    <%@ include file = "../common/footer.jsp"%>
    





	<!-- -------------------------- 스크립트 ------------------------------------ -->
	
	

	
	
	
	
	

	<!-- 이미지 슬라이드 -->
 	<script>
        const images = document.querySelectorAll(".place-image img");
        const prev = document.getElementById("prev");
        const next = document.getElementById("next");
        let currentIndex = 0;

        function showImage(index) {
            images.forEach((image, i) => {
                if (i === index) {
                    image.style.display = "block";
                } else {
                    image.style.display = "none";
                }
            });
        }

        function prevImage() {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            showImage(currentIndex);
        }

        function nextImage() {
            currentIndex = (currentIndex + 1) % images.length;
            showImage(currentIndex);
        }

        prev.addEventListener("click", prevImage);
        next.addEventListener("click", nextImage);

        // 최초 이미지 표시
       	showImage(currentIndex);
    </script>
    
    
    
    
    
    <!-- 카카오맵 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abd7155d789dd6d2c34f07d821c4bc64&libraries=services"></script>
	<script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        
        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 
        
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
        
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch("${p.placeAddress}", function(result, status) {
        
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
        
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
        
                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+"${p.placeTitle}"+'</div>'
                });
                infowindow.open(map, marker);
        
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });    
    </script>
    
</body>
</html>