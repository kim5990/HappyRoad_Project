<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.kh.hrp.board.model.vo.Board, com.kh.hrp.member.model.vo.Member, com.kh.hrp.board.model.vo.BoardComment" %>
<%
   //글번호, 작성자, 카테고리명, 제목, 내용, 작성일
   Board b = (Board)request.getAttribute("b");
   BoardComment c = (BoardComment)request.getAttribute("c");
  
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<!-- jQuery 3.7.1 -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .freeBoardTitle {
            display: flex;
            width: 100%;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
            margin-bottom: 20px;

        }

        .freeBoardTitleLine {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .titleLine {
            width: 800px;
            border: 1px solid rgb(104, 104, 104);
            opacity: 0.5;
        }

        .freeBoardHead {
            display: flex;
            width: 100%;
            justify-content: center;
        }

        .freeBoardContentHead {
            display: flex;
            width: 800px;
            height: 30px;
            justify-content: right;
            align-items: center;

        }

        .freeBoardTop {
            display: flex;
            width: auto;
            height: auto;
            font-size: small;
            padding-left: 10px;
            padding-right: 10px;
        }

        .boardTitlediv {
            display: flex;
            width: 100%;
            justify-content: center;
        }

        .freeBoardContentTitle {
            display: flex;
            width: 800px;
            height: auto;
            font-size: large;
            font-weight: 800;
            margin-bottom: 30px;
            margin-left: 20px;
        }

        .boardContentdiv {
            display: flex;
            width: 100%;
            justify-content: center;
        }

        .boardContent {
            display: flex;
            width: 800px;
            height: auto;
            font-size: large;
            font-weight: 800;
            margin-bottom: 30px;

        }

        #boardContentText {
            width: auto;
            font-size: medium;
            overflow: hidden;
            border: none;
            resize: none;
            background-color: white;
            margin-left: 30px;
        }

        .boardbuttondiv {
            display: flex;
            width: 100%;
            justify-content: center;
            margin-bottom: 30px;

        }

        .boardbutton {
            display: flex;
            width: 300px;
            justify-content: space-around;
        }

        .boardbottom {
            display: flex;
            width: 100%;
            height: auto;
            justify-content: center;
            background-color: rgb(224, 224, 224);
        }

        .boardbottomcomment {
            width: 800px;
            height: 400px;
        }

        .commentTitle {
            display: flex;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .commentdiv {
            display: flex;
            margin-top: 10px;
            justify-content: center;
        }

        .comment {
            width: 700px;
            border: none;
            font-size: small;
        }

        .commenttable {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }


        .tdName {
            font-weight: 800;
            font-size: small;
            width: 60px;
            height: 40px;
        }

        .tdtext {
            width: 600px;
            font-size: small;
            border: none;
            background-color: rgb(224, 224, 224);
        }

        .tdDate {
            font-size: small;
        }

        table {
            border-bottom: 1px solid rgb(104, 104, 104);
            border-collapse: separate;
            border-spacing: 10px 10px;
        }

        .tdbtn {
            border: none;
            background-color: rgb(224, 224, 224);
        }
      .cPage{
        /* border: 1px solid gray; */
        font-size: 30px;
        /* color:black; */
        color: rgb(3, 3, 3);
        border-radius: 30px;
        margin-left: 20px;
        
	    }
	    .notcPage{
	        font-size: 30px;
	        color:rgb(146, 145, 145);
	         margin-left: 20px;
	         cursor:pointer;
	    }
	    .review-pagebar{
	    display: flex;  
	    justify-content: center;
	    cursor:pointer;
	    }
    </style>
</head>

<body>
   <%@ include file = "../common/menubar.jsp"%>
    <div class="freeBoardTitle">
        <h3>자유게시판</h3>
    </div>
    <diV class="freeBoardTitleLine">
        <div class="titleLine"></div>
    </diV>
    <div class="freeBoardHead">
        <diV class="freeBoardContentHead">
            <div class="freeBoardTop">작성 날짜 : </div>
            <div class="freeBoardTop"><%=b.getBoardEnrollDate() %> </div>
            <div class="freeBoardTop">작성자 : </div>
            <div class="freeBoardTop"><%=b.getBoardUser() %></div>
            <div class="freeBoardTop">조회수 : </div>
            <div class="freeBoardTop"><%=b.getBoardCount() %></div>
        </diV>
    </div>
    <div class="boardTitlediv">
        <diV class="freeBoardContentTitle">
            <div>
                <%=b.getBoardTitle() %>
            </div>
        </diV>
    </div>
    <div class="boardContentdiv">
        <div class="boardContent">
            <textarea name="" id="boardContentText" cols="140" rows="10" readonly disabled><%=b.getBoardContent() %></textarea>
        </div>
    </div>
    <div class="boardbuttondiv">
        <div class="boardbutton">
        
        <%if (loginUser != null && loginUser.getUserName().equals(b.getBoardUser())) {%>
            <button type="button" class="btn btn-dark" onclick="location.href='<%=contextPath %>/updateForm.fv?bno=<%=b.getBoardNo() %>'">수정하기</button>
            <button type="button" class="btn btn-dark" onclick="location.href='<%=contextPath %>/delete.fv?bno=<%=b.getBoardNo() %>'">삭제하기</button>
        <%} %>
        
            <button type="button" class="btn btn-secondary" onclick="location.href='freeboardForm.fb?cpage=1'">돌아가기</button>
        </div>
    </div>

    <div class="boardbottom">
        <div class="boardbottomcomment">
            <div class=commentTitle>
                <div>댓글</div>
                <div id="tak"></div>
            </div>
            <diV class="freeBoardTitleLine">
                <div class="titleLine"></div>
            </diV>
            <div class=commentdiv>
             <%if (loginUser != null) { %>
                <input type="text" id="reply-content" onkeyup="insertComment(event)" class="comment" placeholder="댓글을 작성하세요">
                <button type="button" class="btn btn-light"  onclick="butnComment()">작성</button>
              <%} else { %>
              	<input type="text" class="comment" placeholder="로그인 후 댓글을 작성하세요">
                
              <%} %>
            </div>

			
            <div class="commenttable" id="commenttable">
                <table>
               		<!-- 댓글 -->
                    <tr>
                    	<td class="tdName" rowspan="2" align="center"> </td>
                    	<td class="tdtext" rowspan="2"><input type="text" value="" class="tdtext" disabled readonly> </td>
                        <td class="tdDate" colspan="2" align="center"> </td>
                    </tr>
        
                </table>
                 
       			 
            </div>
				 <!-- 댓글 페이지 -->
                 <div class="review-pagebar" >
             		
       			 </div>

			<script>
				 window.onload = function(){
					//댓글 가져와서 그려주기
					selectBoardCommentList(1);
					//setInterval(selectReplyList,2000)
					}
				 
				 function selectBoardCommentList(cp){
					 	var loginUser= "${loginUser.userName}"
					 		
	            		$.ajax({
	            			url: "list.fv", //commentList.cm  list.fv 짬봉 되있음 
	            			data : {
	            				bno: '${b.boardNo}',
	            				cpage : cp
	            			},
	            			success: function(res){     
	            				let list = res.list;
	                            let pi = res.pi
	              
	                            // 리뷰 그려주기
	            				let str = "";
	            				for (let BoardComment of list) {
	            					
	            					// 작성자랑 로그인 유저가 맞아야 보이는 리스트 
	            					if (loginUser == BoardComment.userName){
	            						console.log(loginUser)
		            					str += "<tr>"
		       							+'<td class="tdName" rowspan="2" align="center">' + BoardComment.userName + "</td>"
		       							+'<td class="tdtext" rowspan="2">' + BoardComment.commentContent + "</td>"
		       							+'<td class = "tdDate" colspan="2" align="center">' + BoardComment.commentNewdate + "</td>"
		       							+"</tr>"
		       							+"<tr>"
		       	                        +'<td class="tdDate"><button class="tdbtn" type="button" onclick="createBTN()"></button> </td>'
		       	                        +'<td class="tdDate">' + '<button class="tdbtn" type="button" onclick="deleteComment(' + BoardComment.commentNo
		       	                        +')">삭제</button>' + ' </td>'
		       	                        + '</tr>';
	            					} else { // 아니면 댓글만 보이게
	            						str += "<tr>"
	            							+'<td class="tdName" rowspan="2" align="center">' + BoardComment.userName + "</td>"
			       							+'<td class="tdtext" rowspan="2">' + BoardComment.commentContent + "</td>"
			       							+'<td class = "tdDate" colspan="2" align="center">' + BoardComment.commentNewdate + "</td>"
			       							+"</tr>"
			       							+"<tr>"
			       	                        +'<td class="tdDate"><button class="tdbtn" type="button" onclick="createBTN()"></button> </td>'
			       	                        +'<td class="tdDate">' + '<button class="tdbtn" type="button"></button>' + ' </td>'
			       	                        + '</tr>';
	            					}
	            				}
	            				
	            				document.querySelector("#commenttable tbody").innerHTML = str;
	            				document.querySelector("#tak").innerHTML = pi.listCount;
	            				//console.log(res);
	            				
	            				// 페이징바 그려주기
	                        	let str2 = ""
	                        	for (let i = pi.startPage; i <= pi.endPage; i++){
	                                if (i === pi.currentPage){
	                                	 str2 += "<a class='cPage' onclick='selectBoardCommentList("+i+")'>" + i + "</a>"
	                                } else {
	                        		    str2 += "<a class='notcPage' onclick='selectBoardCommentList("+i+")'>" + i + "</a>"
	                              }
	                        	}
	                        	document.querySelector(".review-pagebar").innerHTML = str2;
	            			},
	            			error: function(){
	            				console.log("댓글목록 조회중 ajax통신실패");
	            			}
	            		})
	            	}
				 
				 	function butnComment(){ //작성버튼 눌렀을때 댓글 기능
				 		
						$.ajax({
	                        url : "insert.fv",
	                        data : {
	                            content: document.getElementById("reply-content").value,
	                            bno: '${b.boardNo}'
	                        },
	                        type:"post",
	                        success:function(res){
	                            if (res > 0) {//댓글작성 성공
	                            	document.getElementById("reply-content").value = "";
	                            	selectBoardCommentList(1);
	                            }
	                        },
	                        error:function(){
								console.log("댓글 작성중 ajax통신 실패")
	                        }
	                    })
	                    
				 	}
				 
				 	function insertComment(ev){ //엔터키 눌렀을때 댓글 기능
					
						if(ev.keycode || ev.keyCode === 13){
							$.ajax({
		                        url : "insert.fv",
		                        data : {
		                            content: document.getElementById("reply-content").value,
		                            bno: '${b.boardNo}'
		                        },
		                        type:"post",
		                        success:function(res){
		                            if (res > 0) {//댓글작성 성공
		                            	document.getElementById("reply-content").value = "";
		                            	selectBoardCommentList(1);
		                            }
		                        },
		                        error:function(){
									console.log("댓글 작성중 ajax통신 실패")
		                        }
		                    })
						}
						
	                }
				 	
				 	function deleteComment(commentNo){
				 		console.log(commentNo)
					 	 $.ajax({
		                        url : "commentdelete.fv",
		                        data : {
		                            commentNo: commentNo
		                        },
		                        success:function(res){
		                        	if (res > 0) {//댓글삭제 성공
		                            	selectBoardCommentList(1);
		                            }
		        					
		                        },
		                        error:function(){
									console.log("댓글 작성중 ajax통신 실패")
		                        }
		                    })
		                }
			</script>

		</div>
    </div>
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>