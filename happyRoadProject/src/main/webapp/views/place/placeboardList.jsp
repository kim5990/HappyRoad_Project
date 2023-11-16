<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hrp.place.model.vo.PlaceSelect, java.util.ArrayList, com.kh.hrp.common.PageInfo"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<PlaceSelect> pslist = (ArrayList<PlaceSelect>)request.getAttribute("psList");
	String thema = (String)request.getAttribute("thema");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	   int currentPage = pi.getCurrentPage();
	   int startPage = pi.getStartPage();
	   int endPage = pi.getEndPage();
	   int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .thumBack {
            display: flex;
            justify-content: center;
            align-items: center;
            width: auto;
            height: auto;
            border-left: none;
            border-right: none;
        }

        .thumBack1 {
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: space-between;
            width: 100%;
            height: 600px;
        }

        .headThumbnail1 {
            display: flex;
            height: 100px;
        }

        .headThumbnailList1 {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100px;
            border-left: none;
            border-right: none;
        }

        .headThumbnailList2 {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 1500px;
            height: 400px;
        }

        .headThumbnail {
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: center;
            border: 1px solid white;
            border-radius: 10px;
            width: 300px;
            height: 300px;
            cursor: pointer;

        }

        .space {
            display: flex;
            width: 1650px;
            height: 100px;
            align-items: center;
            justify-content: space-around;
            font-size: 20px;
        }


        .headThumbnailTitle {
            text-align: center;
            font-size: 20px;
            font-weight: 800;
            color: white;
            background-color: #198754;
            border: none;
        }

        .cardList {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            flex-direction: column;

        }

        .cards {
            display: flex;
            width: 1200px;
            height: 600px;
            justify-content: space-around;
            margin-top: 20px;
            margin-bottom: 20px;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .card-body{
            height: auto;
            width: auto;
        }

        .card {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 20px;
            margin-right: 20px;
            width: 400px;
            height: 300px;
            border-radius: 10px;
            cursor: pointer;
        }
        .card:hover{
            opacity: 0.8;
        }
        
        .fabtn{
        	margin-left : 20px;
        	margin-right : 20px;
        	z-index : 2;
        }
    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp"%>
	<br><br>

    <div class="border border-success thumBack">
        <div class="border border-success headThumbnailList1 ">
            <div class="headThumbnail1">
                <ul class="nav nav-underline space">
                	 <li class="nav-item">
                        <a class="nav-link link-dark" onclick = "themaSelect('도심', 1)" id = "downtownTitle" >#도심</a>
                    </li>
                
                    <li class="nav-item">
                        <a class="nav-link link-dark active" onclick = "themaSelect('계절', 1)" id = "seasonTitle" aria-current="page" >#계절</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link link-dark" onclick = "themaSelect('축제', 1)" id = "festivalTitle" >#축제</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link link-dark" onclick = "themaSelect('힐링', 1)" id = "healingTitle" >#힐링</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <br><br>
    <div class="cardList">
        <div class="cards">
        	<%for(PlaceSelect p : pslist) {%>
            <div class="card" onclick = "categoryCardBtn(<%=p.getPlaceNo() %>)" style="width: 15rem; height: 250px;">
                <div class="card-body">
                    <div style="display: flex; align-items: center; justify-content: center; font-size: 20px;
                    font-weight: 800;">
                        <div align = "center" class="card-font"><%=p.getPlaceTitle() %></div>
                        <div style="display: flex; justify-content: center; align-items: center;"></div>
                    </div>
                    <div>
                        <img src="./<%=p.getImagePath() %><%=p.getImageChange() %>" style="width: 180px; height: 120px;" class="card-img-top"
                            alt="...">
                    </div><br>
                    <h6><%=p.getPlaceContentPoint() %> </h6>
                </div>
            </div>
            <%} %>
        </div>
         <nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		    <%if(currentPage != 1){ %>
		      <a class="page-link" href="<%=contextPath%>/placeboardlistForm.pb?thema=<%=thema %>&cpage=<%=currentPage - 1%>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		      <%} %>
		    </li>
		    <%for(int p = startPage; p <= endPage; p++) { %>
		    	<%if(p == currentPage) { %>
		    	<li class="page-item"><a class="page-link"><%=p %></a></li>
		     	<%} else { %>
		     	<li class="page-item"><a class="page-link" href="<%=contextPath%>/placeboardlistForm.pb?thema=<%=thema %>&cpage=<%=p %>"><%=p %></a></li>
		     	<%} %>
		     <%} %>
		    <li class="page-item">
		    <% if(currentPage != maxPage){ %>
		      <a class="page-link" href="<%=contextPath%>/placeboardlistForm.pb?thema=<%=thema %>&cpage=<%=currentPage + 1%>" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		      <%} %>
		    </li>
		  </ul>
		</nav>
    </div>
        <h1 class="text-bg-success p-3 thumBack" style="margin-bottom: 0px;">인기 여행지</h1>
        <div class=" text-bg-success p-3 thumBack" id = "popList" >
         
        </div>
        
    <%@ include file = "../common/footer.jsp"%>
    <script>
    	$(function(){
    		topTitleSelect('${thema}');
    		ajaxFaListSearch(1);
    	})
    	function topTitleSelect(thema){
    		
    		const seasonTitle = document.getElementById("seasonTitle");
    		const downtownTitle = document.getElementById("downtownTitle");
    		const healingTitle = document.getElementById("healingTitle");
    		const festivalTitle = document.getElementById("festivalTitle");
    		
    		console.log(thema);
    		if(thema === '도심'){
    			document.getElementById("seasonTitle").classList.remove('active')
    			document.getElementById("healingTitle").classList.remove('active')
    			document.getElementById("festivalTitle").classList.remove('active')
    			document.getElementById("downtownTitle").classList.add('active')
    		}else if (thema === '계절'){
    			document.getElementById("downtownTitle").classList.remove('active')
    			document.getElementById("healingTitle").classList.remove('active')
    			document.getElementById("festivalTitle").classList.remove('active')
    			document.getElementById("seasonTitle").classList.add('active')
    		}else if (thema === '축제'){
    			document.getElementById("downtownTitle").classList.remove('active')
    			document.getElementById("healingTitle").classList.remove('active')
    			document.getElementById("seasonTitle").classList.remove('active')
    			document.getElementById("festivalTitle").classList.add('active')
    		}else{
    			document.getElementById("downtownTitle").classList.remove('active')
    			document.getElementById("festivalTitle").classList.remove('active')
    			document.getElementById("seasonTitle").classList.remove('active')
    			document.getElementById("healingTitle").classList.add('active')
    		}

    	}
    	
    	function ajaxFaListSearch(cpage){
    		console.log(cpage)
    		$.ajax({
    			url : "ajaxFaListSearch.pl",
    			data : {
    				thema : '${thema}',
    				cpage : cpage
    			},
    			success: function(list){
    				buttonpop(list[1]);
    				headThumbnailList2(list[0]);
    				
    			},
    			error : function(){
    				console.log("ajax통신 실패");
    			}
    		})
    	}
    	
    	function buttonpop(list){
    		console.log(list);
    		let str = "";
    		if(list.currentPage !== 1){
    			str += '<button type="button" onclick = "ajaxFaListSearch('+ (list.currentPage - 1) +')" class="btn btn-outline-light fabtn">'
				+ '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">'
				+ '<path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z" />'
				+ '</svg>' + '</button>'
    		}
			
    		str += '<div class="headThumbnailList2">'
					+ '</div>'
			if(list.currentPage !== list.maxPage){
				str += '<button type="button" onclick = "ajaxFaListSearch('+ (list.currentPage + 1) +')" class="btn btn-outline-light fabtn">'
				+ '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">'
				+ ' <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />'
				+ '</svg>' + '</button>'
			}
		
			document.querySelector("#popList").innerHTML = str;		
    	}
    		
    	
    	function headThumbnailList2(list){
    		let str = "";
    		if(list !== null){
    			for(let l of list){
        			str += '<div class="headThumbnail" onclick = "categoryCardBtn('+ l.placeNo +')">'
        						+ '<img src="./'+ l.imagePath + l.imageChange +'" style = "max-width : 221px; max-height : 145px" class="rounded mx-auto d-block" alt="...">'
        						+ '<br>'
        						+ '<input class="headThumbnailTitle" type="text" value="'+ l.placeTitle + '">'
        				+ '</div>'
        		}
    			document.querySelector(".headThumbnailList2").innerHTML = str;
    		}else{
    			str += "최신 데이터가 없습니다."
    			document.querySelector(".headThumbnailList2").innerHTML = str;
    		}
    	}
    	
    	function themaSelect(thema, cpage){
    		$.ajax({
    			url : "ajaxthemaSelect.pl",
    			data : {
    				thema : thema,
    				cpage : cpage
    			},
    			success: function(list){
    				let str = ""
    				
					console.log(list)
					themaSelectDraw(list[0]);	
					for(let i of list[0]){
						str = i.placeThema
					}
					themaSelectpagingDraw(list[1], str);
					topTitleSelect(str);
    			},
    			error : function(){
    				console.log("ajax통신 실패");
    			}
    		})
    	}
    	
    	function themaSelectDraw(list){
    		console.log(list);
    		let str = ""
    		for(l of list){
    			str += '<div class="card" onclick = "categoryCardBtn('+ l.placeNo +')" style="width: 15rem; height: 250px;">'
    				+ '<div class="card-body">'
    					+ '<div style="display: flex; align-items: center; justify-content: center; font-size: 20px; font-weight: 800;">'
    						+ '<div align = "center" class="card-font">'+ l.placeTitle + '</div>'
    						+ '<div style="display: flex; justify-content: center; align-items: center;"></div>'
    					+ '</div>'
    					+ '<div style = "display : flex; justify-content: center;">'
    						+ '<img src="./'+ l.imagePath + l.imageChange + '" style="width: 180px; height: 120px;" class="card-img-top"'
    						+ 'alt="...">'
    					+'</div>' + '<br>'
    					+'<h6>' + l.placeContentPoint +'</h6>'
    				+ '</div>' + '</div>'
    		}
    		document.querySelector(".cardList > .cards").innerHTML = str;
    	}
    	
    	function themaSelectpagingDraw(list, thema){
    		let str = ""
    		str += '<li class="page-item">';
    		if(list.currentPage !== 1){
    			str += '<a class="page-link" href="placeboardlistForm.pb?thema='+ thema + '&cpage=' + (list.currentPage - 1) + '" aria-label="Previous" <span aria-hidden="true">&laquo;</span>></a>';
    		}else{
    			str += '<a class="page-link" disabled href="placeboardlistForm.pb?thema='+ thema +'&cpage=' + (list.currentPage - 1) + '" aria-label="Previous" <span aria-hidden="true">&laquo;</span>></a>';
    		}
    		str += '</li>'
    		
    		 for(let p = list.startPage; p <= list.endPage; p++){
    			 if(p == list.currentPage){
    				str += '<li class="page-item"><a class="page-link">'+ p + '</a></li>'
    			 }else{
    				 str += '<li class="page-item"><a class="page-link" href="'+'placeboardlistForm.pb?thema='+ thema +'&cpage='+ p +'">'+ p + '</a></li>'
    			 }
    		 }
    		
			str += '<li class="page-item">'
			if(list.currentPage != list.maxPage){
				str += '<a class="page-link" href="' + 'placeboardlistForm.pb?thema='+ thema +'&cpage='+ (list.currentPage + 1) + '" aria-label="Next"><span aria-hidden="true">&raquo;</span>'
					+ '</a>'
			}
			str += '</li>'
	
    		document.querySelector(".pagination").innerHTML = str;
    			
    	}
    	
    	function categoryCardBtn(pno){
    		location.href = "eventdetailView.ed?pno="+ pno;
    	}
    	
    </script>
</body>
</html>