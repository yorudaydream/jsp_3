<%@page import="java.util.List"%>
<%@page import="com.ft.file.FileDTO"%>
<%@page import="com.ft.file.FileDAO"%>
<%@page import="com.ft.board.BoardDTO"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--    <%request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   
   int num = Integer.parseInt(request.getParameter("num"));
   
   NoticeDAO noticeDAO = new NoticeDAO();
   BoardDTO bdt = noticeDAO.selectOne(num);
   FileDAO fd = new FileDAO();
   FileDTO fdt = new FileDTO();
   fdt.setNum(num);
   fdt.setKind("N");
   //List<FileDTO> ar = fd.insert(fdt);
   //BoardDTO bdt = (BoardDTO)request.getAttribute("dto");
   String board  = (String)request.getAttribute("board");
   
   %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../temp/header.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row">
				<h1>${board} View</h1>
			</div>
			<div class="row">
				<h1>Title:${dto.title}<%-- <%=bdt.getTitle() %> --%></h1>
				<h1>Writer:${dto.writer}<%-- <%=bdt.getWriter() %> --%></h1>
				<h1>Contents:${requestScope.dto.content}<%-- <%=bdt.getContent() %> --%></h1>
				
			</div>
		</div>
		<div>
			<a href="./${requestScope.board}<%-- <%= board %> --%>List.do">List</a>
			<a href="./${requestScope.board}<%-- <%= board %> --%>Update.do?num=${dto.num}">Update</a>
			<a href="./${requestScope.board}<%-- <%= board %> --%>Delete.do?num=${dto.num}">Delete</a>
		</div>
		<div class="container">
			<div class="col-md-1">
				<a href="./${board}WriteForm.jsp" class="btn btn-primary">Write</a>
			</div>
		</div>
<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>