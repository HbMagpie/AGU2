<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>
</head>
<body>

<form method='post' action='fileupload.jsp' enctype="multipart/form-data">
  <!-- 파일업로드를 위해선 반드시 method="post" enctype="Multipart/form-data"여야 한다. (cos 라이브러리에서 제공하는 MultipartRequest 객체를 이용하는 것)-->
	제목 : <input type="text" name="title" /><br />
	이미지 : <input type='file' name='photo' /><br />
  <!-- 파일 업로드는 input type="file"로 지정한다. -->

	<input type='submit' value='upload' />
</form>

</body>
</html>