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
		// 		Test for readUser() method.
		UserManager userManager = new UserManager();
		User user = userManager.readUser("zhikai");
	%>
	<table class="table">
		<tr>
			<td><%=user.getUsername()%></td>
			<td><%=user.getPassword()%></td>
			<td><%=user.getFirstName()%></td>
			<td><%=user.getLastName()%></td>
			<td><%=user.getEmail()%></td>
			<td><%=user.getDateOfBirth()%></td>
		</tr>
	</table>

	<%
		// 		Test for readMovie() method.
		MovieManager movieManager = new MovieManager();
		Movie movie = movieManager.readMovie("m1");
	%>
	<table class="table">
		<tr>
			<td><%=movie.getId()%></td>
			<td><%=movie.getTitle()%></td>
			<td><%=movie.getPosterImage()%></td>
			<td><%=movie.getReleaseDate()%></td>
		</tr>
	</table>

	<%
		// 		Test for readActor() method.
		ActorManager actorManager = new ActorManager();
		Actor actor = actorManager.readActor("a1");
	%>
	<table class="table">
		<tr>
			<td><%=actor.getId()%></td>
			<td><%=actor.getFirstName()%></td>
			<td><%=actor.getLastName()%></td>
			<td><%=actor.getDateOfBirth()%></td>
		</tr>
	</table>

	<%
		// 		Test for readCommentForId() method.
		CommentManager commentManager = new CommentManager();
		Comment comment = commentManager.readCommentForId("cmt1");
	%>
	<table class="table">
		<tr>
			<td><%=comment.getCommentId()%></td>
			<td><%=comment.getComment()%></td>
			<td><%=comment.getDate()%></td>
			<td><%=comment.getUsername()%></td>
			<td><%=comment.getMovieId()%></td>
		</tr>
	</table>

	<%
		// 		Test for readCastForId() method.
		CastManager castManager = new CastManager();
		Cast cast = castManager.readCastForId("c1");
	%>
	<table class="table">
		<tr>
			<td><%=cast.getCastId()%></td>
			<td><%=cast.getCharacterName()%></td>
			<td><%=cast.getActorId()%></td>
			<td><%=cast.getMovieId()%></td>
		</tr>
	</table>


</body>
</html>