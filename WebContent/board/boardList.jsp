<%@page import="com.ft.page.Pager"%>
<%@page import="com.ft.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    //한글표시
    
    String t =  request.getParameter("t");    
    
    BoardDAO bd = new BoardDAO();
    
    %> --%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    String board= (String)request.getAttribute("board");
    List<BoardDTO> ar = (List<BoardDTO>)request.getAttribute("list");
    
    Pager pager = (Pager)request.getAttribute("pager");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="../temp/bootstrap.jsp" %>
</head>
<body>
<jsp:include page="../temp/header.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
		<h1><%= board %></h1>
	</div>
	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NUM</td>
				<td>TITLE</td>
				<td>WRITER</td>
				<td>DATE</td>
				<td>HIT</td>
			</tr>
			<% for(BoardDTO bdt : ar){ %>
			<tr>
				<td><%=bdt.getNum() %></td>
				<td><%=bdt.getTitle() %></td>
				<td><%=bdt.getWriter() %></td>
				<td><%=bdt.getReg_date() %></td>
				<td><%=bdt.getHit() %></td>
			</tr>
			<% }%>
		</table>
		
	<div class="container-fluid">
		<div class="row">
				<ul class="pagination">
					<%if(pager.getCurBlock()>1){ %>
					<li><a href="./noticeList.jsp?curPage=<%= 1 %>"><span class="glyphicon  glyphicon-backward"></span></a></li>
					<%} %>
					<%if(pager.getCurBlock()>1){ %>
					<li><a href="./noticeList.jsp?curPage=<%= pager.getStartNum()-1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					<%} %>
					<% for(int i=pager.getStartNum(); i<=pager.getLastNum(); i++) {%>
						<li><a href="./noticeList.jsp?curPage=<%=i%>"><%=i%></a></li>
					<% } %>
					<% if(pager.getCurBlock() != pager.getTotalBlock()){ %>
					<li><a href="./noticeList.jsp?curPage=<%=pager.getLastNum()+1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					<% } %>
					<% if(pager.getCurBlock() != pager.getTotalBlock()){ %>
					<li><a href="./noticeList.jsp?curPage=<%=pager.getTotalPage()%>"><span class="glyphicon glyphicon-forward"></span></a></li>
					<% } %>
				</ul>
		</div>
	</div>
	</div>
	
	
</div>
<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>