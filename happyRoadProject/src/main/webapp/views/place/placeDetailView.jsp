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
	
	<!-- 부트스트랩 -->
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


<style>

    .hover:hover{
        cursor: pointer;
    }

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
    
    .review-pagebar a{
    	margin: 0 5px; /* 좌우 여백을 5px로 조정 */
        text-decoration: none;
        padding: 0 3px;      
    }
    
    .review-pagebar a:hover{
    	cursor: pointer;
    }

    .cPage{
        /* border: 1px solid gray; */
        font-size: 17px;
        /* color:black; */
        color: rgb(3, 3, 3);
        border-radius: 30px;
        
    }
    .notcPage{
        font-size: 16px;
        color:rgb(146, 145, 145);
    }
    .review-title{
    	display: flex;
        justify-content: space-between; 
        max-width: 680px;
    }


    


</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp"%>
    

 
   <div id="outer" align="center">
        <br><br><br>
        
        <h1>${p.placeTitle}</h1>
        <h3 style="color: rgb(65, 65, 65);">${p.placeContentPoint}</h3>
        
        <div id="like-area" align="right" style="max-width: 650px;"> 
	        <c:choose>
		        <c:when test="${ loginUser.userNo == null}">
					<img src="resources/logo/즐겨찾기모음+즐겨찾기전.png" alt=" 즐겨찾기" class="like" onclick="alert('즐겨찾기 기능은 로그인 후 사용가능합니다.')">
		        </c:when>
		    </c:choose>            
        </div>
        <br>


		<!-- 이미지가 2개 이상일 경우 슬라이드 기능 활성화 -->
		<div class="image-all">
		    <c:choose>
		        <c:when test="${listSize > 1}">
		            <div id="prev" onclick="prevImage()">&lt;</div>
		        </c:when>
		    </c:choose>
		    <div class="place-image">
		        <c:forEach var="i" items="${list}" varStatus="loop">
		            <img  src="resources/images/${i.placeImageChange}">	
		        </c:forEach>
		    </div>
		    <c:choose>
		        <c:when test="${listSize > 1}">
		            <div id="next" onclick="nextImage()">&gt;</div>
		        </c:when>
		    </c:choose>
		</div>

        <br><br><br>

        <h2 style="margin-right: 570px">상세정보</h2>
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
                    <td class="td1"><a href="${p.placeHomepage}">${p.placeHomepage}</a></td>
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
        
        <div class="review-title">
       		<h2>후기</h2>
       			<c:if test="${ loginUser.userNo != null}">
        			<div  data-bs-toggle="modal"data-bs-target="#myModal" class="hover" style="padding-top:18px; margin-right: 10px; font-size: 16px;">작성하기</div>
        		</c:if>
        </div>
        <hr width="700">
        <br>


        <!-- 로그인 정보 있을 경우 | 로그인 정보 없을 경우 -->

		<c:choose>
	  		<c:when test="${loginUser.userNo == null}">   
		            <h4 class="blur-area2">로그인 후 열람 가능합니다</h4>
		            <a href="loginForm.me" style="color:black">로그인하러 가기</a>
		    </c:when>
		    <c:otherwise>
	            <table class="review-area" style="padding-right: 20px; width:650px; filter: none;">              
	                <tbody>
	                    
	                </tbody>
		    	</table>
		    </c:otherwise>
	    </c:choose>
        
        <br>

        <div class="review-pagebar">
        </div>
        
        <br><br><br>
        
     
    </div>
    
    <%@ include file = "../common/footer.jsp"%>
    




    <!-- ------------------------------- 모달 --------------------------------------- -->



	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">리뷰 작성</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
                    <div class="modal-body">
                        <h6>평점</h6>
                    
                        <div class="input-group mb-3 input-group-lg">  
                            <select class="form-select" name="star" id="starval">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div>
                            <h6>내용</h6>
                            <textarea id="contentval" name="reviewContent" class="form-control" style="height: 200px;"></textarea>
                        </div>
                    </div>
                    <!--
                    <input type="hidden" name="placeNo" value="${p.placeNo}">
                    <input type="hidden" name="userNo" value="${loginUser.userNo}">
                    -->

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-primary" data-bs-dismiss="modal" onclick="createReview()">등록</button>
                        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>
                    </div>

			</div>
		</div>
	</div>


	<!-- --------------------------------- 스크립트 ------------------------------------------ -->
   	
    <script>
        onload = function(){
            selectReviewList(1);
            checkLike();
        }

        // 리뷰 + 페이징바 그려주기
        function selectReviewList(cp){
        	var placeNo = "${p.placeNo}";
        	var loginUser= "${loginUser.userId}"

            $.ajax({
                url : "rlist.pl",
                data : {
                    pno : placeNo,
                    cpage : cp
                },
                success: function(res){
  					let list = res.list;
                    let pi = res.pi
                    
                    // 리뷰 그려주기
                    let str1 = ""
                    for (let review of list){
                        let score = "";
                        for (let i = 0; i < review.reviewStar; i++) {
                                score += "<img width='15px' src='resources/logo/별점-1.png' alt='별'> ";
                            }

						if (loginUser == review.userNo){
							str1 +='<tr><td rowspan="2" style="width:80px; text-align: center;">' + review.userNo
	                    	+ '</td><td id="star" align="left" style="height: 40px; padding-left: 23px;">' + score
	                    	+ '</td><td align="right" style="width:40px; text-align: center;"></td><td align="right" class="hover" onclick="deleteReview(' + review.reviewNo + ',' + pi.currentPage
                            + ')" style="width:40px; text-align: center;">삭제</td><td style="padding-right: 20px; width:160px; text-align: center;">' + review.reviewCreateDate
	                    	+ '</td></tr><tr><td colspan="5" style="padding: 20px;">' + review.reviewContent
	                    	+ '</td></tr><tr><td colspan="5"><hr style="width:680px;"></td></tr>'
						} else {
							str1 +='<tr><td rowspan="2" style="width:80px; text-align: center;">' + review.userNo
	                    	+ '</td><td id="star" align="left" style="height: 40px; padding-left: 23px;">' + score
	                    	+ '</td><td align="right" style="width:40px; text-align: center;"></td><td align="right" style="width:40px; text-align: center;"></td><td style="padding-right: 20px; width:160px; text-align: center;">' + review.reviewCreateDate
	                    	+ '</td></tr><tr><td colspan="5" style="padding: 20px;">' + review.reviewContent
	                    	+ '</td></tr><tr><td colspan="5"><hr style="width:680px;"></td></tr>'
						}

                    }
                	document.querySelector(".review-area tbody").innerHTML = str1;
                	
                	
                	// 페이징바 그려주기
                	let str2 = ""
                	for (let i = pi.startPage; i <= pi.endPage; i++){
                        if (i === pi.currentPage){
                            str2 += "<a class='cPage' onclick='selectReviewList("+i+")'>" + i + "</a>"
                        } else {
                		    str2 += "<a class='notcPage' onclick='selectReviewList("+i+")'>" + i + "</a>"
                        }
                	}
                	document.querySelector(".review-pagebar").innerHTML = str2;

                },
                error : function(){
                    console.log("댓글목록 조회 중 ajax 통신 실패");
                }
            })
        }       


        // 즐겨찾기 조회
        function checkLike(){
            
            $.ajax({
                url : "checkLike.pl",
                data : {
                    pno : "${p.placeNo}",
                    mno : "${loginUser.userNo}"
                },
                success: function(res){
                    let str3 = "";
                    if(res){   // 즐겨찾기 있음
                        str3 += '<img src="resources/logo/즐겨찾기-후.png" alt=" 즐겨찾기" class="like" onclick="deleteLike()">'
                    } else {    // 즐겨찾기 없음
                        str3 += '<img src="resources/logo/즐겨찾기모음+즐겨찾기전.png" alt=" 즐겨찾기" class="like" onclick="insertLike()">'
                    }
                    document.querySelector("#like-area").innerHTML = str3;

                },
                error : function(){
                    console.log("즐겨찾기 조회 중 ajax 통신 실패");
                }
            })
        }

        // 즐겨찾기 삭제
        function deleteLike(){
            $.ajax({
                url : "delete.li",
                data : {
                    placeNo : "${p.placeNo}",
                    userNo : "${loginUser.userNo}"
                },
                success: function(res){
                    if(res > 0){
                   	    checkLike();
                    } else {
                		alert('삭제실패');
                    }

                },
                error : function(){
                    console.log("즐겨찾기 조회 중 ajax 통신 실패");
                }
            })
        }
        
        // 즐겨찾기 추가
        function insertLike(){
            $.ajax({
                url : "insert.li",
                data : {
                    placeNo : "${p.placeNo}",
                    userNo : "${loginUser.userNo}"
                },
                success: function(res){
                    if(res > 0){
                   	    checkLike();
                    } else {
                		alert('추가실패');
                    }
                },
                error : function(){
                    console.log("즐겨찾기 조회 중 ajax 통신 실패");
                }
            })
        }
               
        // 리뷰 추가
        function createReview(){
        	$.ajax({
                url : "create.re",
                method: "post",
                data : {
                    placeNo : "${p.placeNo}",
                    userNo : "${loginUser.userNo}",
                    star : $("#starval").val(),
                    reviewContent : $("#contentval").val()
                },
                success: function(res){
                	if(res > 0){
                		$("#starval").val(1);
                		$("#contentval").val("");
	                    selectReviewList(1);
                	} else {
            			alert('등록실패');
                	}

                },
                error : function(){
                    console.log("즐겨찾기 조회 중 ajax 통신 실패");
                }
            })
        }
        
        // 리뷰 삭제
        function deleteReview(rno, cpage){
        	$.ajax({
                url : "delete.re",
                data : {
                    reviewNo : rno,
                    userNo : "${loginUser.userNo}"
                },
                success: function(res){
                	if(res > 0){
	                    selectReviewList(cpage);
                	} else {
            			alert('삭제실패');
                	}
                },
                error : function(){
                    console.log("즐겨찾기 조회 중 ajax 통신 실패");
                }
            })
        }
        
    
    </script>
	

	<!--------------------------- 이미지 슬라이드 ------------------------------->
	
 	<script>
        const images = document.querySelectorAll(".place-image img");
        let currentIndex = 0;
        
     	// 최초 이미지 표시
       	showImage(currentIndex);

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

        
    </script>
    
    
    
    
    
    <!---------------------------- 카카오맵 -------------------------------->
    
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