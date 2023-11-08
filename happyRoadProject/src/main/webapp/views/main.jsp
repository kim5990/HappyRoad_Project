<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<main class="main-container">
	        <div class="main-section1">
	            <input type="image" src="resources/images/main1.png" height="400" width="940" class="main-section-image">
	        </div>
	        <div class="main-section3">
	            <input type="button" onclick = "changeImg(0)" class="main-section3-button" value="1" >
	            <input type="button" onclick = "changeImg(1)" class="main-section3-button" value="2">
	            <input type="button" onclick = "changeImg(2)" class="main-section3-button" value="3">
	            <input type="button" onclick = "changeImg(3)" class="main-section3-button" value="4">
	            <input type="button" onclick = "changeImg(4)" class="main-section3-button" value="5">
	        </div>
	        <div class="main-section2">
	            <div class="main-section-div">
	                <div class="main-section-div-text1">서울개나리축제 </div>
	                <div class="main-section-div-text2">23.10.27 - 23.10.27 </div>
	            </div>
	        </div>
	        <script>
	        	window.onload = function(){
	        		
	        	}
	        	
	        
	        
	        	function changeImg(num){
	        		const mainSectionData = [{
	        			img : "resources/images/main1.png",
	        			text : '<div class="main-section-div-text1">서울개나리축제 </div><div class="main-section-div-text2">23.10.27 - 23.10.27 </div>'
	        		},{
	        			img : "resources/images/main2.png",
	        			text : '<div class="main-section-div-text1">최지원축제 </div><div class="main-section-div-text2">23.10.27 - 23.10.27 </div>'
	        		},{
	        			img : "resources/images/main3.png",
	        			text : '<div class="main-section-div-text1">지원이축제 </div><div class="main-section-div-text2">23.10.27 - 23.10.27 </div>'
	        		},{
	        			img : "resources/images/main4.png",
	        			text : '<div class="main-section-div-text1">원이대축제 </div><div class="main-section-div-text2">23.10.27 - 23.10.27 </div>'
	        		},{
	        			img : "resources/images/main5.png",
	        			text : '<div class="main-section-div-text1">종강파티 </div><div class="main-section-div-text2">23.10.27 - 23.10.27 </div>'
	        		}]
	        		
	        		
                    document.querySelector(".main-container > .main-section1 > input[type='image']").src = mainSectionData[num].img;
	        		document.querySelector(".main-container > .main-section2 > div.main-section-div").innerHTML = mainSectionData[num].text;
	        	}
	        </script>
	</main>
    <div class="place-section">
        <div class="place-section-title">
            <div class="place-section-place-category">
            </div>
            <hr class="place-section-place-border">
            </hr>
            <div class="place-section-place-text">PLACE</div>
        </div>
    </div>
    <div class="place-section-list">
        <div class="place-section-list-images">
            <div class="place-section-list-div-image" >
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1"  src="resources/logo/PLACE-도시.png" height="30"
                    width="30" >
                <h1 class="place_image_text" id="place_image_text1">도심</h1>
                <img class="image-thumbnail" id="image-thumbnail1" onclick = "location.href = 'placeboardlistForm.pb' " src="resources/images/PLACE_1.png">
            </div>
            <div class="place-section-list-div-image">
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1" src="resources/logo/PLACE-계절.png" height="30"
                    width="30">
                <h1 class="place_image_text" id="place_image_text1">계절</h1>
                <img class="image-thumbnail" id="image-thumbnail2" onclick = "location.href = 'placeboardlistForm.pb' " src="resources/images/PLACE_2.png">
            </div>
            <div class="place-section-list-div-image">
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1" src="resources/logo/PLACE-축제.png" height="30"
                    width="30">
                <h1 class="place_image_text" id="place_image_text1">축제</h1>
                <img class="image-thumbnail" id="image-thumbnail3" onclick = "location.href = 'placeboardlistForm.pb' " src="resources/images/PLACE_3.png">
            </div>
            <div class="place-section-list-div-image">
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1" src="resources/logo/PLACE-힐링.png" height="30"
                    width="30">
                <h1 class="place_image_text" id="place_image_text1">힐링</h1>
                <img class="image-thumbnail" id="image-thumbnail4" onclick = "location.href = 'placeboardlistForm.pb' " src="resources/images/PLACE_4.png">
            </div>
        </div>
        <div class="place-section-list-background"></div>
    </div>

    <div class="event-section">
        <div class="event-section-title">
            <div class="event-section-event-category">
            </div>
            <hr class="event-section-event-border">
            </hr>
            <div class="event-section-event-text">EVENT</div>
        </div>
    </div>

    <div class="calender">
        <div class="event-calenderTitleText">2023년 10월</div>
        <div class="event-section-calender">
            <div class="event-section-calender-div">
                <div class="event-calenderLists">
                    <div class="event-calenderList" style="background-color: rgb(135, 205, 252);">
                        <div class="event-calender-day">23</div>
                        <div class="event-calender-month">월</div>
                    </div>
                    <div class="event-calenderList">
                        <div class="event-calender-day">24</div>
                        <div class="event-calender-month">화</div>
                    </div>
                    <div class="event-calenderList">
                        <div class="event-calender-day">25</div>
                        <div class="event-calender-month">수</div>
                    </div>
                    <div class="event-calenderList">
                        <div class="event-calender-day">26</div>
                        <div class="event-calender-month">목</div>
                    </div>
                    <div class="event-calenderList">
                        <div class="event-calender-day">27</div>
                        <div class="event-calender-month">금</div>
                    </div>
                    <div class="event-calenderList">
                        <div class="event-calender-day" style="color: rgb(103, 103, 253);">28</div>
                        <div class="event-calender-month" style="color: rgb(130, 130, 252);">토</div>
                    </div>
                    <div class="event-calenderList">
                        <div class="event-calender-day" style="color: rgb(255, 103, 141);">29</div>
                        <div class="event-calender-month" style="color: rgb(253, 128, 159);">일</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="event-calender-eventlist">
            <div class="event-calender-eventlist-container">
                <div class="event-calender-list">
                    <div class="event-calender-image">
                        <img class="event-calender-image-thumbnail"  onclick = "location.href = 'eventdetailView.ed' " src="">
                    </div>
                    <div class="eventName">행사이름</div>
                    <div class="eventDay">2023.10.28 ~ 2023.11.04</div>
                </div>
                <div class="event-calender-list">
                    <div class="event-calender-image">
                        <img class="event-calender-image-thumbnail"  onclick = "location.href = 'eventdetailView.ed'" src="">
                    </div>
                    <div class="eventName">행사이름</div>
                    <div class="eventDay">2023.10.28 ~ 2023.11.04</div>
                </div>
                <div class="event-calender-list">
                    <div class="event-calender-image">
                        <img class="event-calender-image-thumbnail" onclick = "location.href = 'eventdetailView.ed'" src="">
                    </div>
                    <div class="eventName">행사이름</div>
                    <div class="eventDay">2023.10.28 ~ 2023.11.04</div>
                </div>
                <div class="event-calender-list">
                    <div class="event-calender-image">
                        <img class="event-calender-image-thumbnail" onclick = "location.href = 'eventdetailView.ed'" src="">
                    </div>
                    <div class="eventName">행사이름</div>
                    <div class="eventDay">2023.10.28 ~ 2023.11.04</div>
                </div>
            </div>
        </div>

        <div class="paging">
            <div class="paging-controller">
                <button type="button" onclick = "location.href = '' "class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                        height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z" />
                    </svg></button>
                <button type="button" onclick = "location.href = '' " class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                        height="16" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                    </svg></button>
            </div>
        </div>
    </div>
    <div class="hotNow-section">
        <div class="hotNow-section-title">
            <div class="hotNow-section-hotNow-category">
            </div>
            <hr class="hotNow-section-hotNow-border">
            </hr>
            <div class="hotNow-section-hotNow-text">HOT NOW</div>
        </div>
    </div>
    <div class="hotNow">
        <div class="hotNow-list">
            <div class="hotNow-list-nodes">
                <div class="hotNow-image">
                    <img class="hotNow-image-thumbnail" onclick = "location.href = 'eventdetailView.ed'" id="image-thumbnail2" src="resources/images/HOTNOW_1.png">
                </div>
                <div class="hotNow-list-node1">
                    <div class="hotNow-list-node1-info">
                        <div class="hotNow-list-node1-name">장소이름</div>
                        <textarea class="hotNow-list-node1-Info1" readonly>간단설명간단설명간단설명간단설명간단간단설명간단설명</textarea>
                        <div class="hotNow-list-node1-Info2">위치 링크 등 정보</div>
                    </div>
                </div>
                <div class="hotNow-list-node2"></div>
            </div>
            <div class="hotNow-list-nodes">
                <div class="hotNow-image">
                    <img class="hotNow-image-thumbnail" onclick = "location.href = 'eventdetailView.ed'" id="image-thumbnail2" src="resources/images/HOTNOW_2.png">
                </div>
                <div class="hotNow-list-node1">
                    <div class="hotNow-list-node1-info">
                        <div class="hotNow-list-node1-name">장소이름</div>
                        <textarea class="hotNow-list-node1-Info1" readonly>간단설명간단설명간단설명간단설명간단간단설명간단설명</textarea>
                        <div class="hotNow-list-node1-Info2">위치 링크 등 정보</div>
                    </div>
                </div>
                <div class="hotNow-list-node2"></div>
            </div>
            <div class="hotNow-list-nodes">
                <div class="hotNow-image">
                    <img class=" hotNow-image-thumbnail" onclick = "location.href = 'eventdetailView.ed'" id="image-thumbnail2" src="resources/images/HOTNOW_3.png">
                </div>
                <div class="hotNow-list-node1">
                    <div class="hotNow-list-node1-info">
                        <div class="hotNow-list-node1-name">장소이름</div>
                        <textarea class="hotNow-list-node1-Info1" readonly>간단설명간단설명간단설명간단설명간단간단설명간단설명</textarea>
                        <div class="hotNow-list-node1-Info2">위치 링크 등 정보</div>
                    </div>
                </div>
                <div class="hotNow-list-node2"></div>
            </div>
        </div>
    </div>
</body>
</html>