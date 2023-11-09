<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hrp.board.model.vo.Board, com.kh.hrp.member.model.vo.Member"%>
<%
   //글번호, 작성자, 카테고리명, 제목, 내용, 작성일
   Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  
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
                <div>(2)</div>
            </div>
            <diV class="freeBoardTitleLine">
                <div class="titleLine"></div>
            </diV>
            <div class=commentdiv>
             <%if (loginUser != null) { %>
                <input type="text" class="comment" placeholder="댓글을 작성하세요">
                <button type="button" class="btn btn-light" onclick="insertComment()">작성</button>
              <%} else { %>
              	<input type="text" class="comment" placeholder="로그인 후 댓글을 작성하세요">
                <button type="button" class="btn btn-light" >작성</button>
              <%} %>
            </div>

			
            <div class="commenttable" id="commenttable">
                <table>
                    <tr>
                        <td class="tdName" rowspan="2" align="center">홍길동</td>
                        <td class="tdtext" rowspan="2"><input type="text" value="오늘 날씨 좋아요" class="tdtext" disabled
                                readonly></td>
                        <td class="tdDate" colspan="2" align="center">2023-09-25</td>

                    </tr>
                    
                    <tr>
                        <td class="tdDate"><button class="tdbtn" type="button" onclick="createBTN()">수정</button>
                        </td>
                        <td class="tdDate"><button class="tdbtn" type="button" onclick="location.href=''">삭제</button>
                        </td>
                    </tr>
                   
                </table>
            </div>


			<script>
				 window.onload = function(){
					//댓글 가져와서 그려주기
					selectBoardCommentList();
					//setInterval(selectReplyList,2000)
					}
				 
				 function selectBoardCommentList(){
	            		$.ajax({
	            			url: "list.fv",
	            			data : {
	            				bno: <%=b.getBoardNo()%>
	            			},
	            			success: function(res){          
	            				let str = "";
	            				for (let BoardComment of res) {
	            					console.log(BoardComment)
	            					str += "<tr>"
	       							+"<td>" + BoardComment.userName + "</td>"
	       							+"<td>" + BoardComment.commentContent + "</td>"
	       							+"<td>" + BoardComment.commentNewdate + "</td>"
	       							+"</tr>";
	            					
	            				}
	            				
	            				document.querySelector("#commenttable tbody").innerHTML = str;
	            				
	            				
	            			},
	            			error: function(){
	            				console.log("댓글목록 조회중 ajax통신실패");
	            			}
	            		})
	            	}
				 
				 	function insertComment(){
	                    $.ajax({
	                        url : "insert.fv",
	                        data : {
	                            content: document.getElementBy("tdtext").value,
	                            bno: <%=b.getBoardNo()%>
	                        },
	                        type:"post",
	                        success:function(res){
	                            if (res > 0) {//댓글작성 성공
	                            	document.getElementByName("tdtext").value = "";
	                            	selectBoardCommentList();
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