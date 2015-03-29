<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.cs5200.dao.*, edu.cs5200.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Hello World</h1>
    
    <%
    MovieManager movieDAO = new MovieManager();
    
/*     Movie movie = new Movie();
    movie.setTitle("Terminator");
    movie.setPoster("I'll be back");
    movie.setMovieId("432");
    
    movieDAO.create(movie);
 */
    List<Movie> movies = movieDAO.readAllMovies();
    
    for(Movie movie : movies)
    {
        out.println(movie.getTitle());
    }
    
    
    Movie movie = movieDAO.readMovie("a");
    out.println(movie.getTitle());
    
    movie.setTitle("Avatar 3");
    movieDAO.updateMovie("1", movie);
    
    movie = movieDAO.readMovie("a");
    out.println(movie.getTitle());
    
    movieDAO.deleteMovie("a");
    %>
</body>
</html>