<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.net.*"%>
<%@ page import = "vo.*"%>
<%
	//세션 유효성 검사 : 로그인이 되어있지 않으면 home으로 리다이렉션
	if(session.getAttribute("loginMemberId") == null){
		response.sendRedirect(request.getContextPath()+"/boardList.jsp");
		return;
	}

	//요청값 유효성 검사: null이거나 공백이면 홈으로 리다이렉션 후 코드진행 종료
	if(request.getParameter("boardNo") == null 
			|| request.getParameter("boardNo").equals("")
			|| request.getParameter("boardFileNo") == null 
			|| request.getParameter("boardFileNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/boardList.jsp");
		return;
	}

	//요청값 변수에 저장
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	int boardFileNo = Integer.parseInt(request.getParameter("boardFileNo"));
	//디버깅
	System.out.println(boardNo + "<--removeBoard boardNo");
	System.out.println(boardFileNo + "<--removeBoard boardFileNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeBoard.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 메인메뉴 페이지 include -->
	<div>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	</div>
	
	<!-- 게시글 삭제  -->
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
			<h1>게시글 삭제</h1>
			<form action="./removeBoardAction.jsp" method="post">
				<input type="hidden" name="boardFileNo" value="<%=boardFileNo %>">
				<table class="table">
					<tr>
						<th>게시글 번호</th>
						<td>
							<input type="text" name="boardNo" value="<%=boardNo %>" readonly="readonly" style="border:none">
						</td>			
					</tr>
					<tr>
						<th>회원 ID</th>
						<td>
							<input type="text" name="memberId">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-outline-dark">삭제</button>
						</td>
						<!-- <td></td> -->
					</tr>
				</table>
			</form>
			</div>
		</div>	
	</div>
</body>
</html>