<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>

			</style>
		</head>

		<body>
			<%@ include file="./menubar.jsp" %>
				<br>
				<c:if test="${ !empty errorMsg }">
					<script>
						alertify.alert('알림', "${errorMsg}");
					</script>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<br><br>
				<div align="center" style="font-size: 30px;">에러페이지</div>
				<br><br>
				<div align="center">
					<input type="image" src="./resources/logo/공룡.png" width="300" height="300">
				</div>
				<br>
				<div align="center">
					<button class="btn btn-primary" onclick="<%=contextPath %>" type="button">홈으로</button>
					<button class="btn btn-danger" id="back-btn" onclick="history.back()" type="button">뒤로가기</button>
				</div>
				<%@ include file="../common/footer.jsp" %>
		</body>

		</html>