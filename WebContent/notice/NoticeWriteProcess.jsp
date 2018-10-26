<%@page import="com.ft.file.FileDAO"%>
<%@page import="com.ft.file.FileDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ft.notice.NoticeDTO"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <jsp:useBean id="noticeDTO" class="com.ft.notice.NoticeDTO" scope="page"></jsp:useBean>
    <jsp:setProperty property ="*" name="noticeDTO"/> --%>
    <%
		String path= request.getServletContext().getRealPath("upload");	
    	//System.out.println(path);
    	int max =  1024*1024*10;
    	MultipartRequest multi = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
    	NoticeDTO ndt = new NoticeDTO();
    	
    	ndt.setTitle(multi.getParameter("title"));
    	ndt.setWriter(multi.getParameter("writer"));
    	ndt.setContent(multi.getParameter("content"));
    	//path 경로에 파일 업로드 끝
    	
    	//파일의 정보
    	/* String fname = multi.getFilesystemName("f1");//매개변수는 파일의 Parameter의 이름
    	String oname = multi.getOriginalFileName("f1");
    	System.out.println("fname"+ fname);
    	System.out.println("oname" + oname);
    	File f = multi.getFile("f1");
    	Enumeration e = multi.getFileNames();//파라미터 명들 */
    	
    	FileDTO f1 = new FileDTO();
    	f1.setFname(multi.getFilesystemName("f1"));
    	f1.setOname(multi.getOriginalFileName("f1"));
    	FileDTO f2 = new FileDTO();
    	f2.setFname(multi.getFilesystemName("f2"));
    	f2.setOname(multi.getOriginalFileName("f2"));
    	
    	
    	//String s1 = request.getParameter("f1");

    	NoticeDAO nd = new NoticeDAO();
    	nd.setNum(num);
    	int result = nd.insert(noticeDTO);
    	
    	f1.setNum(num);
    	f2.setNum(num);
    	f2.setKind("N");
    	f2.setKind("N");
    	
    	FileDAO fd = new FileDAO();
    	
    	
    	
    	
    	String s = "Write Fail";
    	
    	if(result>0){
    		s ="Write Success";
    	}
    	
    	request.setAttribute("message", s);
    	request.setAttribute("path", "./noticeList.jsp?curPage=1");

    	response.sendRedirect("../index.jsp");//이동 해야 할 주소
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

alert('<%= s%>');
location.href="./noticeList.jsp";

</script>

</head>
<body>
</body>
</html>