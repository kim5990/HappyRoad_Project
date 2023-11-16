<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <main class="main-container">
        <div class="main-section1">
            <input type="image" src="resources/images/2023102415001800073.jpg" height="400" width="940"
                class="main-section-image">
        </div>
        <div class="main-section3">
            <input type="button" onclick="changeImg(0)" class="main-section3-button" value="1">
            <input type="button" onclick="changeImg(1)" class="main-section3-button" value="2">
            <input type="button" onclick="changeImg(2)" class="main-section3-button" value="3">
            <input type="button" onclick="changeImg(3)" class="main-section3-button" value="4">
            <input type="button" onclick="changeImg(4)" class="main-section3-button" value="5">
        </div>
        <div class="main-section2">
            <div class="main-section-div">
                <div class="main-section-div-text1">한국의집 고호재</div>
                <div class="main-section-div-text2">23.11.12 - 23.11.12</div>
            </div>
        </div>

        <script>

            function changeImg(num) {
                const mainSectionData = [{
                    img: "resources/images/2023102415001800073.jpg",
                    text: '<div class="main-section-div-text1">한국의집 고호재</div><div class="main-section-div-text2">23.11.12 - 23.11.12 </div>'
                }, {
                    img: "resources/images/2023102415001800040.jpg",
                    text: '<div class="main-section-div-text1">인천개항장 문화재야행</div><div class="main-section-div-text2">23.11.16 - 23.11.16 </div>'
                }, {
                    img: "resources/images/2023102415001800030.jpg",
                    text: '<div class="main-section-div-text1">벽초지수목원 국화축제</div><div class="main-section-div-text2">23.11.18 - 23.11.18 </div>'
                }, {
                    img: "resources/images/2023102415001800057.jpg",
                    text: '<div class="main-section-div-text1">롯데월드 miracle winter</div><div class="main-section-div-text2">23.11.14 - 23.11.14 </div>'
                }, {
                    img: "resources/images/2023102415001800069.jpg",
                    text: '<div class="main-section-div-text1">고성통일명태축제 </div><div class="main-section-div-text2">23.11.13 - 23.11.13 </div>'
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
            <div class="place-section-list-div-image">
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1" src="resources/logo/PLACE-도시(흰).png"
                    height="30" width="30">
                <h1 class="place_image_text" id="place_image_text1">도심</h1>
                <img class="image-thumbnail" id="image-thumbnail1"
                    onclick="location.href = 'placeboardlistForm.pb?thema=도심&cpage=1' " src="resources/images/PLACE_1.png">
            </div>
            <div class="place-section-list-div-image">
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1" src="resources/logo/PLACE-계절(흰).png"
                    height="30" width="30">
                <h1 class="place_image_text" id="place_image_text1">계절</h1>
                <img class="image-thumbnail" id="image-thumbnail2"
                    onclick="location.href = 'placeboardlistForm.pb?thema=계절&cpage=1' " src="resources/images/PLACE_2.png">
            </div>
            <div class="place-section-list-div-image">
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1" src="resources/logo/PLACE-축제(흰).png"
                    height="30" width="30">
                <h1 class="place_image_text" id="place_image_text1">축제</h1>
                <img class="image-thumbnail" id="image-thumbnail3"
                    onclick="location.href = 'placeboardlistForm.pb?thema=축제&cpage=1' " src="resources/images/PLACE_3.png">
            </div>
            <div class="place-section-list-div-image">
                <input type="image" class="logo-thumbnail" id="logo-thumbnail1" src="resources/logo/PLACE-힐링(흰).png"
                    height="30" width="30">
                <h1 class="place_image_text" id="place_image_text1">힐링</h1>
                <img class="image-thumbnail" id="image-thumbnail4"
                    onclick="location.href = 'placeboardlistForm.pb?thema=힐링&cpage=1' " src="resources/images/PLACE_4.png">
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
        <div class="event-calenderTitleText" id="calendar-title"></div>
        <div class="event-section-calender">
            <div class="event-section-calender-div">
                <div class="event-calenderLists">
                    <div class="calendar2" id="calendar2"></div>
                </div>
            </div>
        </div>

        <div class="event-calender-eventlist">
            <div class="event-calender-eventlist-container">

            </div>
        </div>

        <div class="paging">
            <div class="paging-controller">

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

        </div>
    </div>
    <!-- 스크립트 코드 -->
    <script>
        //년도 월 추출 함수
        function updateCalendarTitle() {
            let currentDate = new Date();

            let year = currentDate.getFullYear();
            let month = currentDate.getMonth() + 1; // JavaScript에서 월은 0부터 시작하므로 1을 더해줍니다.

            document.getElementById('calendar-title').innerText = year + '년 ' + month + '월';
        }

        //캘린더 일주일 함수 
        function initCalendar() {
            updateCalendarTitle();
            const calendarContainer = document.getElementById('calendar2');
            const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
            const today = new Date();
            let selectedDay = today;

            function updateCalendar() {
                calendarContainer.innerHTML = '';

                for (let i = 0; i < 7; i++) {
                    const day = new Date(selectedDay);
                    day.setDate(selectedDay.getDate() - selectedDay.getDay() + i);

                    const dayElement = document.createElement('div');
                    dayElement.classList.add('day');
                    if (i === today.getDay() && day.getDate() === today.getDate()) {
                        dayElement.classList.add('current-day');
                    }

                    const dayOfWeekElement = document.createElement('div');
                    dayOfWeekElement.innerText = daysOfWeek[i];
                    // 색상 스타일 추가
                    if (i === 0) {
                        dayOfWeekElement.classList.add('sunday');
                        dayElement.classList.add('sunday');
                    } else if (i === 6) {
                        dayOfWeekElement.classList.add('saturday');
                        dayElement.classList.add('saturday');
                    }

                    const dateElement = document.createElement('div');
                    dateElement.innerText = day.getDate();

                    dayElement.appendChild(dayOfWeekElement);
                    dayElement.appendChild(dateElement);

                    dayElement.addEventListener('click', function () {
                        document.querySelector('.current-day').classList.remove('current-day');
                        dayElement.classList.add('current-day');
                        selectedDay = day;
                        
                        ajaxEventCalenderImage(day.getFullYear(), day.getMonth()+1, day.getDate(), 1);
                    });

                    calendarContainer.appendChild(dayElement);
                }
            }

            updateCalendar();
        }

        initCalendar();
    </script>
    <script>
        window.onload = function () {
            let day = new Date();
            ajaxEventCalenderImage(day.getFullYear(), day.getMonth() + 1, day.getDate(), 1);
            countOfSelect();

        }

        //EVENT 부분
        function ajaxEventCalenderImage(setYear, setMonth, setDay, num) {
            $.ajax({
                url: "mainEventListSearch.ma",
                data: {
                    thema: "축제",
                    year: setYear,
                    month: setMonth,
                    day: setDay,
                    cpage: num
                },
                type: "post",
                success: function (result) {
                   
                    
                    drawEventCalenderImage(result);
                    

                },
                error: function () {
                    console.log("축제게시글조회실패");
                }
            })
        }
        
        function drawEventCalenderImage(result){
        	 let str = "";
        	 
        	 if (result[0].length !== 0) {
                 for (let r of result[0]) {
                     str += '<div class="event-calender-list">'
                         + '<div class="event-calender-list">'
                         + '<img class="event-calender-image-thumbnail"  onclick = "location.href = ' + "'eventdetailView.ed" + "?pno=" + r.placeNo 
                         		+ "'" + '" src="./'+ r.imagePath + r.imageChange + '">'
                         + '</div>'
                         + ' <div class="eventName">' + r.placeTitle + '</div>'
                         + '<div class="eventDay">' + r.placeStart + " ~ " + r.placeEnd + '</div>'
                         + '</div>'
                 }
                 
                 paging(result[1], result[0]);

                 $(".event-calender-eventlist").css("align-items", "end");
                 $(".event-calender-eventlist-container").css("justify-content", "space-between");
                 console.log(str);
                 document.querySelector(".event-calender-eventlist-container").innerHTML = str;
             } else {

                 str += '<div id = "nonr">' + "해당 날짜에 행사가 없습니다." + '<div>'
                 $(".event-calender-eventlist").css("align-items", "center");
                 $(".event-calender-eventlist-container").css("justify-content", "center");
                 document.querySelector(".event-calender-eventlist-container").innerHTML = str;

                 if (result[1]) {
                     paging(result[1], result[0]);
                 }
             }
        }
        
        //EVENT button 부부분
        function paging(page) {
        	console.log(page)
            let str = "";
        	let day = new Date();
            if (page.currentPage === 1) {
                str += '<button type="button" disabled onclick = "ajaxEventCalenderImage('+ day.getFullYear() + ',' + (day.getMonth() + 1) + ','+ day.getDate() + ','+ (page.currentPage - 1) + ')"; class="btn btn-dark">'
                    + '<svg xmlns="http://www.w3.org/2000/svg" width="16"  height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">'
                    + '<path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z" /> '
                    + '</svg>'
                    + '</button>'
            }else{
            	 str += '<button type="button" onclick = "ajaxEventCalenderImage('+ day.getFullYear() + ',' + (day.getMonth() + 1) + ','+ day.getDate() + ','+ (page.currentPage - 1) + ')"; class="btn btn-dark">'
                 + '<svg xmlns="http://www.w3.org/2000/svg" width="16"  height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">'
                 + '<path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z" /> '
                 + '</svg>'
                 + '</button>'
            }
            
            if (page.currentPage !== page.maxPage){
            	 str += '<button type="button" onclick = "ajaxEventCalenderImage('+ day.getFullYear() + ',' + (day.getMonth() + 1) + ','+ day.getDate() + ','+ (page.currentPage + 1) + ')"; class="btn btn-dark">'
	                + '<svg xmlns="http://www.w3.org/2000/svg" width="16"  height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">'
	                + '<path fill-rule="evenodd"  d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />'
	                + '</svg>'
	                + '</button>'
             	
            }else{
            	 str += '<button type="button" disabled  onclick = "ajaxEventCalenderImage('+ day.getFullYear() + ',' + (day.getMonth() + 1) + ','+ day.getDate() + ','+ (page.currentPage + 1) + ')"; class="btn btn-dark">'
	                + '<svg xmlns="http://www.w3.org/2000/svg" width="16"  height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">'
	                + '<path fill-rule="evenodd"  d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />'
	                + '</svg>'
	                + '</button>'
            }
            document.querySelector(".paging-controller").innerHTML = str;
        }

        //HOT NOW 부분
        function countOfSelect() {
            $.ajax({
                url: "countSearch.ma",
                type: "post",
                success: function (result) {
                    let str = ""
                    for (let r of result) {
                        str += '<div class="hotNow-list-nodes">'
                            + '<div class="hotNow-image">'
                            + '<img class="hotNow-image-thumbnail" onclick = "location.href = '
                            + "'eventdetailView.ed" + "?pno=" + r.placeNo + "'" + '" id="image-thumbnail2" src="' + r.imagePath + r.imageChange + '">'
                            + '</div>'
                            + '<div class="hotNow-list-node1">'
                            + '<div class="hotNow-list-node1-info">'
                            + '<div class="hotNow-list-node1-name">' + r.placeTitle + '</div>'
                            + '<textarea class="hotNow-list-node1-Info1" style = "border : none; outline: none;" readonly>' + r.placeContentPoint + '</textarea>'
                            + '<div class="hotNow-list-node1-Info2">' + r.placeAddress + '</div>'
                            + '</div>'
                            + '</div>'
                            + '<div class= "hotNow-list-node2"></div>'
                            + '</div>';
                    }
                    document.querySelector(".hotNow-list").innerHTML = str;
                },
                error: function () {
                    console.log("인기게시글조회실패");
                }
            })
        }

    </script>
</body>

</html>