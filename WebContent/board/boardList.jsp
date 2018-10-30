<%@page import="com.ft.qna.QnaDTO"%>
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
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--태그명은 c로  -->
    
    <%-- 
    
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    String board= (String)request.getAttribute("board");
    List<BoardDTO> ar = (List<BoardDTO>)request.getAttribute("list");
    
    Pager pager = (Pager)request.getAttribute("pager");
    String board = (String)request.getAttribute("board");
    %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="../temp/bootstrap.jsp" %>
</head>
<body>
<%-- <jsp:include page="../temp/header.jsp"></jsp:include> --%>
<c:import url="../../../temp/header.jsp" />
	<%-- <c:param name="test" value="3"></c:param> parameter 값 전달이 필요할때--%>
<%-- </c:import> 혼자 열고 닫기 --%>

<div class="container-fluid">
	<div class="row">
		<h1>${requestScope.board}</h1>
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
			
			<c:forEach items="${ar}" var="bdt">
				<tr>
				<td>${bdt.num}</td>
				<td><a href="./${board}SelectOne.do?num=${bdt.num}">
				<c:catch>
					<c:forEach begin="1" end="${bdt}">
					--
					</c:forEach>
				</c:catch>
				${bdt.title}
				</td>
				<td>${bdt.writer}</td>
				<td>${bdt.reg_date}</td>
				<td>${bdt.hit}</td>
			</tr>
			</c:forEach>
			<%-- 
			<% for(BoardDTO bdt : ar){ %>
			<tr>
				<td><%=bdt.getNum() %></td>
				<td><a href="./${board}SelectOne.do?num=<%bdt.getNum()%>">
				<%//instanceof 같은 타입인지 비교
				//if(bdt instanceof QnaDTO){
				try{ QnaDTO qdt = (QnaDTO)bdt;
				for(int i=0; i<qdt.getDepth();i++){%>
				--
				<%} 
				}catch (Exception e){}//예외처리 받아서 아무것도 안하면 됨%>
				<%= bdt.getTitle() %>
				</td>
				<td><%=bdt.getWriter() %></td>
				<td><%=bdt.getReg_date() %></td>
				<td><%=bdt.getHit() %></td>
			</tr>
			<% }%> --%>
		</table>
		
	<div class="container-fluid">
		<div class="row">
				<ul class="pagination">
					<%if(pager.getCurBlock()>1){ %>
					<li><a href="./${board}List.jsp?curPage=<%= 1 %>"><span class="glyphicon  glyphicon-backward"></span></a></li>
					<%} %>
					<c:if test="${pager.curBlock>1}">
						<li><a href="./${board}List.jsp?curPage=${pager.startNum-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					</c:if>
					<%-- <%if(pager.getCurBlock()>1){ %>
					<li><a href="./${board}List.jsp?curPage=<%= pager.getStartNum()-1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					<%} %> --%>
					
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li><a href="./${board}List.jsp?curPage=${i}">${i}</a></li>
					</c:forEach>
					
					<%-- <% for(int i=pager.getStartNum(); i<=pager.getLastNum(); i++) {%>
						<li><a href="./${board}List.jsp?curPage=<%=i%>"><%=i%></a></li>
					<% } %> --%>
					
					<c:if test="${pager.curBlock<pager.totalBlock}">
						<li><a href="./${board}List.jsp?curPage=${pager.LastNum+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					</c:if>
					
					<%-- <% if(pager.getCurBlock() < pager.getTotalBlock()){ %>
					<li><a href="./${board}List.jsp?curPage=<%=pager.getLastNum()+1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					<% } %> --%>
					<%-- <% if(pager.getCurBlock() != pager.getTotalBlock()){ %> --%>
					<li><a href="./${board}List.jsp?curPage=${pager.totalPage}"><span class="glyphicon glyphicon-forward"></span></a></li>
					<%-- <% } %> --%>
				</ul>
		</div>
	</div>
	</div>
</div>
<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>