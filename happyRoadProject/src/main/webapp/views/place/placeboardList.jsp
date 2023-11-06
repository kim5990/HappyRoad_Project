<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .tage{
            border: 1px solid;
            height: 50px;
            display: flex;
            column-gap: 16px;
            row-gap: 20px;
            justify-content: space-between;
            align-items: center;
        }
        .shop{
            padding-left: 50px;
            margin-right: 50px;
            display: flex;
        }
        .photo{
            /* border: 1px solid; */
            display: flex;
            justify-content: space-between;

        }
        .dog{
            height: 180px;
            width: 180px;
            cursor: pointer;
        }
        .left-btn{
            margin-top: 80px;
            margin-left: 50px;
            cursor: pointer;
        }
        .right-btn{
            margin-top: 80px;
            margin-right: 50px;
            cursor: pointer;
        }
        .dog-titl{
            height: 180px;
            width: 180px;
        }
        .sumbnail-title{
            /* border: 2px solid; */
            display: flex;
            
        }
        .sumbnail{
            border:1px solid;
            height: 340px;
            width: 300px;
            align-items: center;
            display: flex;
            margin-left: 150px;
            border-radius: 15% 15% 15% 15%;
            
        }
        .photo-sub{
            height: 250px;
            width: 250px;
            margin-top: 50px;
            margin-left: 25px;
            
        }
        .www{
            display: flex;
            border:1px solid;
            
        }
        .aaa{
            border:1px solid;
        }
    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp"%>
	<div class="tage">
        <div class="shop"><a href="">#철원으로 떠나자</a></div>
        <div class="shop"><a href="">#철원으로 떠나자</a></div>
        <div class="shop"><a href="">#철원으로 떠나자</a></div>
        <div class="shop"><a href="">#철원으로 떠나자</a></div>
        <div class="shop"><a href="">#철원으로 떠나자</a></div>
        <div class="shop"><a href="">#철원으로 떠나자</a></div>
    </div>

    <hr>
    <br>

    <div class="photo">
        <div class="left-btn">
            <input type="button"value="&lt" onclick="">
        </div>

        <div class="dog-titl">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="dog" onclick="">
            <input type="text" value="벼랑에 걸린 하늘 길을 걷다">
        </div>
        <div class="dog-titl">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="dog" onclick="">
            <input type="text" value="벼랑에 걸린 하늘 길을 걷다">
        </div>
        <div class="dog-titl">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="dog" onclick="">
            <input type="text" value="벼랑에 걸린 하늘 길을 걷다">
        </div>
        <div class="dog-titl">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="dog" onclick="">
            <input type="text" value="벼랑에 걸린 하늘 길을 걷다">
        </div>

        <div class="right-btn">
            <input type="button"value="&gt" onclick="">
        </div>
    </div>

    <br><br><br><br><br>

    <div class="sumbnail-title">
        <div class="sumbnail">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="photo-sub" onclick="">
        </div>

        <div class="sumbnail">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="photo-sub" onclick="">
        </div>

        <div class="sumbnail">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="photo-sub" onclick="">
        </div>
    </div>

    <br><br><br>

    <div class="sumbnail-title">
        <div class="sumbnail">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="photo-sub" onclick="">
        </div>

        <div class="sumbnail">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="photo-sub" onclick="">
        </div>

        <div class="sumbnail">
            <img src="/ONe/imgs/202212008462_500.jpg" alt="" class="photo-sub" onclick="">
        </div>
    </div>
    <%@ include file = "../common/footer.jsp"%>
    
</body>
</html>