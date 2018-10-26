<%@page import="com.ft.util.DBConnector"%>
<%@page import="com.ft.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="sun.rmi.server.Dispatcher"%>
<%@page import="com.ft.page.MakePager"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@page import="com.ft.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    
    	int curPage = 1;
    	try{
    		curPage = Integer.parseInt(request.getParameter("curPage"));
    	}catch(Exception e){
    		
    	}//만약 curPage안주거나 exception 발생하면 1
    	
    	String kind = request.getParameter("");
    	if(kind == null||kind.equals("")){
    		kind="title";
    	}
    	
    	String search = request.getParameter("search");
    	if(search == null){
    		search = "";
    	}
    	
    	BoardDAO bd = new NoticeDAO();
    	
    	MakePager mk = new MakePager(curPage, search, kind);  	
    	List<BoardDTO> ar = bd.selectList(mk.makeRow());
    	int totalCount = bd.getCount(kind, search);
    	
/*     	
    	request.setAttribute("list", ar);
    	   request.setAttribute("board", "notice");
    	   request.setAttribute("pager", pager);
    	
    	RequestDispatcher view =  request.getRequestDispatcher("../board/boardList.jsp");
    	view.forward(request, response);
    	 */
    	
Pager pager =     
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="../temp/bootstrap.jsp" %>
</head>
<body>
<%-- <h1><%= request.getRequestURI() %></h1>
<h1><%= request.getPathInfo() %></h1>
<h1><%= request.getServletPath() %></h1> --%>
<jsp:include page="../temp/header.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
		<h1>Notice</h1>
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
