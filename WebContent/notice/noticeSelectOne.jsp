<%@page import="java.util.List"%>
<%@page import="com.ft.file.FileDTO"%>
<%@page import="com.ft.file.FileDAO"%>
<%@page import="com.ft.board.BoardDTO"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   
   int num = Integer.parseInt(request.getParameter("num"));
   
   NoticeDAO noticeDAO = new NoticeDAO();
   BoardDTO bdt = noticeDAO.selectOne(num);
   FileDAO fd = new FileDAO();
   FileDTO fdt = new FileDTO();
   fdt.setNum(num);
   fdt.setKind("N");
   List<FileDTO> ar = fd.insert(fdt);
   
   %>
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
				<h1>Title:<%=bdt.getTitle() %></h1>
				<h1>Writer:<%=bdt.getWriter() %></h1>
				<h1>Contents:<%=bdt.getContent() %></h1>
				<% for(FileDTO file : ar) {%>
					<h3><a href="../upload/"><%= file.getFname() %></a></h3>
				<%} %>
			</div>
		</div>
		<div>
			<a href="./noticeList.jsp">List</a>
			<a href="./noticeUpdate.jsp">Update</a>
			<a href="./noticeDelete.jsp">Delete</a>
		</div>
		<div class="container">
			<div class="col-md-1">
				<a href="./noticeWriteForm.jsp" class="btn btn-primary">Write</a>
			</div>
		</div>
<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>