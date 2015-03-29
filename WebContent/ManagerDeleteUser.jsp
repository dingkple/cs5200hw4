<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="edu.cs5200.dao.*,edu.cs5200.model.*, java.util.*, java.sql.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		//		test for deleteComment() method
		CommentManager commentManager = new CommentManager();
		commentManager.deleteComment("5");
	%>

	<%
		//		test for deleteCast() method
		CastManager castManager = new CastManager();
		castManager.deleteCast("1");
	%>

	<%
		//		test for deleteUser() method
		UserManager userManager = new UserManager();
		userManager.deleteUser("hyyearth");
	%>

	<%
		//		test for deleteMovie() method
		MovieManager movieManager = new MovieManager();
		movieManager.deleteMovie("3");
	%>

	<%
		//		test for deleteActor() method
		ActorManager actorManager = new ActorManager();
		actorManager.deleteActor("1");
	%>

</body>
</html>