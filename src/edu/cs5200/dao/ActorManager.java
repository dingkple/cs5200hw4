package edu.cs5200.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import edu.cs5200.model.Actor;


public class ActorManager {
    DataSource ds;
    
    public ActorManager()
    {
      try {
        Context ctx = new InitialContext();
        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MovieSocialNetwork");
        System.out.println(ds);
      } catch (NamingException e) {
        e.printStackTrace();
      }
    }
    
    // create a Actor
    public Actor createActor(Actor actor)
    {
        String sql = "insert into actor values (?,?,?,?)";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, actor.getId());
            statement.setString(2, actor.getFirstName());
            statement.setString(3, actor.getLastName());
            statement.setDate(4, actor.getDateOfBirth());
            statement.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    // retrieve all Actors
    public List<Actor> readAllActors()
    {
        List<Actor> actors = new ArrayList<Actor>();
        String sql = "select * from Actor";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet results = statement.executeQuery();
            while(results.next())
            {
                Actor actor = new Actor();
                actor.setId(results.getString("id"));
                actor.setFirstNmae(results.getString("firstname"));
                actor.setLastName(results.getString("lastname"));
                actor.setDateOfBirth(results.getDate("dateofbirth"));
                actors.add(actor);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return actors;
    }
    // retrieve a Actor by id
    public Actor readActor(String actorId)
    {
        Actor actor = new Actor();
        
        String sql = "select * from Actor where id = ?";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, actorId);
            ResultSet result = statement.executeQuery();
            if(result.next())
            {
                 actor.setId(result.getString("id"));
                 actor.setFirstNmae(result.getString("firstname"));
                 actor.setLastName(result.getString("lastname"));
                 actor.setDateOfBirth(result.getDate("dateofbirth"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }       
        return actor;
    }
    // update a Actor by id
    public Actor updateActor(String actorId, Actor actor)
    {
        String sql = "update actor set firstname=?, lastname=?, dateofbirth=? where id=?";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, actor.getId());
            statement.setString(2, actor.getFirstName());
            statement.setString(3, actor.getLastName());
            statement.setString(4, actorId);
            statement.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }       
        return actor;
    }
    // delete a Actor by id
    public int deleteActor(String actorid)
    {
        String sql = "delete from actor where id=?";
        try {
            Connection connection = ds.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, actorid);
            return statement.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }
}
