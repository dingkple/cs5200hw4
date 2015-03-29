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
		// 		Test for readAllUsers() method.
		UserManager userManager = new UserManager();
		List<User> users = userManager.readAllUsers();
	%>
	<form>
		<table class="table">

			<%
				for (User user : users) {
			%>
			<tr>
				<td><%=user.getUsername()%></td>
				<td><%=user.getPassword()%></td>
				<td><%=user.getFirstName()%></td>
				<td><%=user.getLastName()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getDateOfBirth()%></td>
				<%
					}
				%>
			
		</table>
	</form>

	<%
		// 		Test for readAllMoives() method.
		MovieManager movieManager = new MovieManager();
		List<Movie> movies = movieManager.readAllMovies();
	%>
	<form>
		<table class="table">

			<%
				for (Movie movie : movies) {
			%>
			<tr>
				<td><%=movie.getId()%></td>
				<td><%=movie.getTitle()%></td>
				<td><%=movie.getPosterImage()%></td>
				<td><%=movie.getReleaseDate()%></td>
				<%
					}
				%>
			
		</table>
	</form>

	<%
		// 		Test for readAllActors() method.
		ActorManager actorManager = new ActorManager();
		List<Actor> actors = actorManager.readAllActors();
	%>
	<form>
		<table class="table">

			<%
				for (Actor actor : actors) {
			%>
			<tr>
				<td><%=actor.getId()%></td>
				<td><%=actor.getFirstName()%></td>
				<td><%=actor.getLastName()%></td>
				<td><%=actor.getDateOfBirth()%></td>
				<%
					}
				%>
			
		</table>
	</form>

	<%
		// 		Test for readAllComments() method.
		CommentManager commentManager = new CommentManager();
		List<Comment> comments = commentManager.readAllComments();
	%>
	<form>
		<table class="table">

			<%
				for (Comment comment : comments) {
			%>
			<tr>
				<td><%=comment.getCommentId()%></td>
				<td><%=comment.getComment()%></td>
				<td><%=comment.getDate()%></td>
				<td><%=comment.getUsername()%></td>
				<td><%=comment.getMovieId()%></td>
				<%
					}
				%>
			
		</table>
	</form>

	<%
		// 		Test for readAllCommentsForUsername() method.
		CommentManager commentManagerForUsername = new CommentManager();
		List<Comment> commentsForUsername = commentManagerForUsername
				.readAllCommentsForUsername("hyyearth");
	%>
	<form>
		<table class="table">

			<%
				for (Comment comment : comments) {
			%>
			<tr>
				<td><%=comment.getCommentId()%></td>
				<td><%=comment.getComment()%></td>
				<td><%=comment.getDate()%></td>
				<td><%=comment.getUsername()%></td>
				<td><%=comment.getMovieId()%></td>
				<%
					}
				%>
			
		</table>
	</form>

	<%
		// 		Test for readAllCommentsForMovie() method.
		CommentManager commentManagerForMovie = new CommentManager();
		List<Comment> commentsForMovie = commentManagerForMovie
				.readAllCommentsForMovie("3");
	%>
	<form>
		<table class="table">

			<%
				for (Comment comment : comments) {
			%>
			<tr>
				<td><%=comment.getCommentId()%></td>
				<td><%=comment.getComment()%></td>
				<td><%=comment.getDate()%></td>
				<td><%=comment.getUsername()%></td>
				<td><%=comment.getMovieId()%></td>
				<%
					}
				%>
			
		</table>
	</form>

	<%
		// 		Test for readAllCasts() method.
		CastManager castManager = new CastManager();
		List<Cast> casts = castManager.readAllCasts();
	%>
	<form>
		<table class="table">

			<%
				for (Cast cast : casts) {
			%>
			<tr>
				<td><%=cast.getCastId()%></td>
				<td><%=cast.getCharacterName()%></td>
				<td><%=cast.getActorId()%></td>
				<td><%=cast.getMovieId()%></td>
				<%
					}
				%>
			
		</table>
	</form>
	
	<%
		// 		Test for readAllCastsForActor() method.
		CastManager castManagerForActor = new CastManager();
		List<Cast> castsForActor = castManagerForActor.readAllCastsForActor("1");
	%>
	<form>
		<table class="table">

			<%
				for (Cast cast : casts) {
			%>
			<tr>
				<td><%=cast.getCastId()%></td>
				<td><%=cast.getCharacterName()%></td>
				<td><%=cast.getActorId()%></td>
				<td><%=cast.getMovieId()%></td>
				<%
					}
				%>
			
		</table>
	</form>
	
		<%
		// 		Test for readAllCastsForActor() method.
		CastManager castManagerForMovie = new CastManager();
		List<Cast> castsForMovie = castManagerForMovie.readAllCastsForMovie("3");
	%>
	<form>
		<table class="table">

			<%
				for (Cast cast : casts) {
			%>
			<tr>
				<td><%=cast.getCastId()%></td>
				<td><%=cast.getCharacterName()%></td>
				<td><%=cast.getActorId()%></td>
				<td><%=cast.getMovieId()%></td>
				<%
					}
				%>
			
		</table>
	</form>


</body>
</html>