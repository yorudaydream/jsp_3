<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <jsp:include page="../temp/bootstrap.jsp"></jsp:include>
  <style>
  textarea {width:80%; height:100px;}
  tfoot td{text-align: center;}
  .btn{width:300px; height:50px; background: #000; color:#fff; text-align: center;}
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="../temp/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<form action="./noticeWriteProcess.jsp" method="post">
			<div class="form-group">
					<table class="table">
						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control" name="title" value="" placeholder="enter title"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<!-- <td><input type="text" class="form-control" name="writer" value="" placeholder="enter writer"></td> -->
							<td><input type="text" class="form-control" name="writer" value="" placeholder=""></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea  class="form-control" name="content" value="" placeholder="enter content"></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<!-- <td><input type="text" class="form-control" name="writer" value="" placeholder="enter writer"></td> -->
							<td><input type="file" class="form-control" id ="file" name="f1" value="" placeholder=""></td>
						</tr>
						<tr>
							<th>첨부파일2</th>
							<!-- <td><input type="text" class="form-control" name="writer" value="" placeholder="enter writer"></td> -->
							<td><input type="file" class="form-control" id ="file2" name="f2" value="" placeholder=""></td>
						</tr>
						<tfoot>
							<tr>
								<td colspan="2"><button class="btn">확인</button></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>