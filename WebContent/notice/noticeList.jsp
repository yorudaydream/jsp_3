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
    	
    	
    	request.setAttribute("list", ar);
    	   request.setAttribute("board", "notice");
    	   request.setAttribute("pager", pager);
    	
    	RequestDispatcher view =  request.getRequestDispatcher("../board/boardList.jsp");
    	view.forward(request, response);
    	
    	
    
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <h1><%= request.getRequestURI() %></h1>
<h1><%= request.getPathInfo() %></h1>
<h1><%= request.getServletPath() %></h1> --%>

</body>
</html>