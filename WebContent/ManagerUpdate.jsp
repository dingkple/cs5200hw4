<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="edu.cs5200.dao.*, edu.cs5200.model.*, java.util.*, java.sql.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		//		test for updateUser() method
		UserManager userManager = new UserManager();
		String dateStringToParseForUser = "1991-1-14";
		SimpleDateFormat bartDateFormatForUser = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date sqlDateForUser = null;

		try {
			java.util.Date date = bartDateFormatForUser
					.parse(dateStringToParseForUser);

			sqlDateForUser = new java.sql.Date(date.getTime());

		}

		catch (Exception ex) {

			System.out.println(ex.getMessage());
		}

		User user = new User();
		user.setFirstName("zhikai");
		user.setLastName("ding");
		user.setUsername("admin");
		user.setPassword("admin");
		user.setEmail("zhikai@ccs.neu.edu");
		user.setDateOfBirth(sqlDateForUser);
		userManager.updateUser("hyyearth", user);
	%>

	<%
		// 		Test for updateMovie() method.
		MovieManager movieManager = new MovieManager();
		String dateStringToParseForMovie = "2009-4-18";
		SimpleDateFormat bartDateFormatForMovie = new SimpleDateFormat(
				"yyyy-MM-dd");
		java.sql.Date sqlDateForMovie = null;

		try {
			java.util.Date date = bartDateFormatForMovie
					.parse(dateStringToParseForMovie);

			sqlDateForMovie = new java.sql.Date(date.getTime());

		}

		catch (Exception ex) {

			System.out.println(ex.getMessage());
		}

		Movie movie = new Movie();
		movie.setId("m1");
		movie.setTitle("The Day After Tomorrow");
		movie.setPosterImage("http://www.imdb.com/media/rm2621279232/tt0319262?ref_=tt_ov_i");
		movie.setReleaseDate(sqlDateForMovie);
		movieManager.updateMovie("3", movie);
	%>

	<%
		// 		Test for updateActor() method.
		ActorManager actorManager = new ActorManager();
		String dateStringToParseForActor = "1978-4-03";
		SimpleDateFormat bartDateFormatForActor = new SimpleDateFormat(
				"yyyy-MM-dd");
		java.sql.Date sqlDateForActor = null;

		try {
			java.util.Date date = bartDateFormatForActor
					.parse(dateStringToParseForActor);

			sqlDateForActor = new java.sql.Date(date.getTime());

		}

		catch (Exception ex) {

			System.out.println(ex.getMessage());
		}

		Actor actor = new Actor();
        actor.setId("a1");
        actor.setFirstNmae("Bing");
        actor.setLastName("Fan");
        actor.setDateOfBirth(sqlDateForActor);
		actorManager.updateActor("1", actor);
	%>

	<%
		// 		Test for updateComment() method.
		CommentManager commentManager = new CommentManager();
		String dateStringToParseForComment = "2013-4-03";
		SimpleDateFormat bartDateFormatForComment = new SimpleDateFormat(
				"yyyy-MM-dd");
		java.sql.Date sqlDateForComment = null;

		try {
			java.util.Date date = bartDateFormatForComment
					.parse(dateStringToParseForComment);

			sqlDateForComment = new java.sql.Date(date.getTime());

		}

		catch (Exception ex) {

			System.out.println(ex.getMessage());
		}

		Comment comment = new Comment();
        comment.setCommentId("cmt1"); 
        comment.setComment("nice");
        comment.setDate(sqlDateForComment);
        comment.setUsername("zhikai");
        comment.setMovieId("m1");
		commentManager.updateComment("5", comment);
	%>

	<%
		// 		Test for updateCast() method.
		CastManager castManager = new CastManager();
		Cast cast = new Cast();
		cast.setCastId("1");
		cast.setCharacterName("CCC");
		cast.setActorId("a1");
		cast.setMovieId("m1");
		castManager.updateCast("1", cast);
	%>
</body>
</html>