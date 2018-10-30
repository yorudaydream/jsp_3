<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    request.setAttribute("start", 1);
    request.setAttribute("end", 5);
    
    ArrayList<Integer> ar =  new ArrayList<>();
    ar.add(100);
    ar.add(200);
    ar.add(300);
    
    request.setAttribute("ar", ar);
    
    Map<String, String> map = new HashMap<>();
    map.put("f1", "name1");
    map.put("f2", "name2");
    map.put("f3", "name3");
    
    request.setAttribute("m", map);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a>test</a>
<% for(int i=1; i<=10; i++){ %>
	<h1><%= i %></h1>
<%} %>
<c:forEach begin="1" end="10" var="i"><!-- begin 시작설정 end 끝설정 var 변수선언 -->
	<h1>${i}</h1><!-- pageScope 생략 -->
</c:forEach>
<c:forEach begin="${start}" end="${end}" var="t" step="2"><!-- begin 시작설정 end 끝설정 var 변수선언 step 증가값-->
	<h1>${t}</h1>
</c:forEach>
<hr>
<%-- 
	ERROR!!!!!!!
<c:forEach begin="${end}" end="${start}" var="t" step="-1"><!-- begin 시작설정 end 끝설정 var 변수선언 step 증가값 증감식은 -값이 들어갈 수 없다. error-->
	<h1>${t}</h1>
</c:forEach> --%>

<%for(int i=0;i<ar.size(); i++){} %>
<% for(Integer num : ar) {}%>
<c:forEach items="${ar}" var="l" varStatus="v">
	<h3>${l}</h1>
	<h3>${v.count}</h1>
	<h3>${v.index}</h3>
	<h3>${v.first}</h3>
	<h3>${v.last}</h3>
	<h3>${v.begin}</h3>
	<h3>${v.end}</h3>
	<h3>${v.step}</h3>
</c:forEach>

<!-- 
count : 1부터 순서
index : 0부터 순서
first : 첫번째인지 여부 true or false
last : 마지막인지 여부
begin : 첫번호
end : 끝번호
step : 증가값
 -->
 
 <hr>
 
 <c:forEach items="${m}" var="n">
 	<h1>${n}</h1>
 	<h1>${n.value}</h1>
 	<h1>${n.key}</h1>
 </c:forEach>
 <c:forTokens items="" delims=""></c:forTokens>
</body>
</html>