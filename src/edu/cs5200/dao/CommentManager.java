package edu.cs5200.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import edu.cs5200.model.Comment;


public class CommentManager {
    DataSource ds;
    
    public CommentManager()
    {
      try {
        Context ctx = new InitialContext();
        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MovieSocialNetwork");
        System.out.println(ds);
      } catch (NamingException e) {
        e.printStackTrace();
      }
    }
    
    // create a Comment
    public void createComment(Comment newComment) {
        String sql = "insert into Comment values (?,?,?,?,?)";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
        	connection = ds.getConnection();
            statement = connection.prepareStatement(sql); 
            statement.setString(1, newComment.getCommentId()); 
            statement.setString(2, newComment.getComment()); 
            statement.setDate(3, newComment.getDate()); 
            statement.setString(4, newComment.getUsername()); 
            statement.setString(5, newComment.getMovieId()); 
            statement.execute();
            statement.close(); 
            statement = null; 
            connection.close();
        } 
        catch (SQLException e) { 
            e.printStackTrace();
        } 
        finally {
            if (statement != null) {
                try {
                    statement.close();
                } 
                catch (SQLException e) {
                    e.printStackTrace();
                } 
            }
            if (connection != null) { 
                try {
                    connection.close(); } 
                catch (SQLException e) {
                    e.printStackTrace();
                }
            } 
        }
    }
    // retrieve all Comments
    public List<Comment> readAllComments()
    {
        List<Comment> comments = new ArrayList<Comment>();
        String sql = "select * from Comment";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet results = statement.executeQuery();
            while(results.next())
            {
                Comment comment = new Comment();
                comment.setCommentId(results.getString("commentid")); 
                comment.setComment(results.getString("comment"));
                comment.setDate(results.getDate("date"));
                comment.setUsername(results.getString("username"));
                comment.setMovieId(results.getString("movieid"));
                comments.add(comment);
            }
            results.close(); results = null; 
            statement.close(); 
            statement = null; 
            connection.close(); 
            connection = null;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return comments;
    }
   
    public List<Comment> readAllCommentsForUsername(String username) { 
        List<Comment> comments = new ArrayList<Comment>();
        String sql = "select * from comment where username=?";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet results = null;
        try {
        	connection = ds.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            results = statement.executeQuery();
            while(results.next()) {
                Comment comment = new Comment();
                comment.setCommentId(results.getString("commentId")); 
                comment.setComment(results.getString("comment"));
                comment.setDate(results.getDate("date"));
                comment.setUsername(results.getString("username"));
                comments.add(comment);
        }
            results.close();
            results = null;
            statement.close();
            statement = null;
            connection.close();
            connection = null;
        } 
        catch (SQLException e) { 
            e.printStackTrace();
        } 
        finally {
            if (statement != null) {
                try {
                    statement.close();
                } 
                catch (SQLException e) {
                    e.printStackTrace();
                } 
            }
            if (connection != null) { 
                try {
                    connection.close(); } 
                catch (SQLException e) {
                    e.printStackTrace();
                }
            } 
        }    
        return comments;
    }

    public List<Comment> readAllCommentsForMovie(String movieId) { 
        List<Comment> comments = new ArrayList<Comment>(); 
        String sql = "select * from comment where movieId=?";
        Connection connection = null; 
        PreparedStatement statement = null; 
        ResultSet results = null;
        try {
            connection = ds.getConnection();
            statement = connection.prepareStatement(sql); 
            statement.setString(1, movieId);
            results = statement.executeQuery(); 
            while(results.next()) {
                Comment comment = new Comment();
                comment.setCommentId(results.getString("commentId")); 
                comment.setComment(results.getString("comment"));
                comment.setDate(results.getDate("date"));
                comment.setUsername(results.getString("username"));
                comments.add(comment);
            }
            results.close(); 
            results = null; 
            statement.close(); 
            statement = null; 
            connection.close(); 
            connection = null;
            } 
        catch (SQLException e) {
            e.printStackTrace();
        } 
        finally {
            if (statement != null) {
                try {
                    statement.close();
                } 
                catch (SQLException e) {
                    e.printStackTrace();
                } 
            }
            if (connection != null) { 
                try {
                    connection.close(); } 
                catch (SQLException e) {
                    e.printStackTrace();
                }
            } 
        }
        return comments;
    }


    // update a Comment by id
    public Comment updateComment(String commentId, Comment newComment)
    {
        String sql = "update comment set comment=?, date=?, username=?, movieId=? where commentid=?";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement = connection.prepareStatement(sql); 
//            statement.setString(1, newComment.getCommentId()); 
            statement.setString(1, newComment.getComment()); 
            statement.setDate(2, newComment.getDate()); 
            statement.setString(3, newComment.getUsername()); 
            statement.setString(4, newComment.getMovieId()); 
            statement.setString(5, commentId); 
            statement.execute();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }  
        return newComment;
    }

    public Comment readCommentForId(String commentId){
        Comment comment = new Comment();
        String sql = "select * from comment where commentid=?"; 
        Connection connection = null; 
        PreparedStatement statement = null;
        ResultSet results = null;
        try {
            connection = ds.getConnection();
        	statement = connection.prepareStatement(sql); 
            statement.setString(1, commentId);
            results = statement.executeQuery(); 
            if(results.next()) {
                comment.setCommentId(results.getString("commentId")); 
                comment.setComment(results.getString("comment"));
                comment.setDate(results.getDate("date"));
                comment.setUsername(results.getString("username"));
                comment.setMovieId(results.getString("movieid"));
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return comment;
    }


    // delete a Comment by id
    public int deleteComment(String Commentid)
    {
        String sql = "delete from Comment where commentId=?";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, Commentid);
            return statement.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }
}
