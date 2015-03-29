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

import edu.cs5200.model.Cast;

public class CastManager {
	DataSource ds;

    public CastManager()
    {
      try {
        Context ctx = new InitialContext();
        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MovieSocialNetwork");
        System.out.println(ds);
      } catch (NamingException e) {
        e.printStackTrace();
      }
    }

	public void closeConnection(Connection connection) {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void createCast(Cast newCast) {
		String sql = "insert into cast values (?,?,?,?)";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, newCast.getCastId());
			statement.setString(2, newCast.getCharacterName());
			statement.setString(3, newCast.getActorId());
			statement.setString(4, newCast.getMovieId());
			statement.execute();
			statement.close();
			statement = null;
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}

	}

	public List<Cast> readAllCasts() {
		List<Cast> casts = new ArrayList<Cast>();
		String sql = "select * from cast";

		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet results = null;
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(sql);
			results = statement.executeQuery();
			while(results.next()) {
				Cast cast = new Cast();
				cast.setCastId(results.getString("castId"));
				cast.setCharacterName(results.getString("characterName"));
				cast.setActorId(results.getString("actorId"));
				cast.setMovieId(results.getString("movieId"));
				casts.add(cast);
			}
			results.close();
			results = null;
			statement.close();
			statement = null;
			connection.close();
			connection = null;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(results != null) {
				try {
					results.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return casts;
	}
	
	public List<Cast> readAllCastsForActor(String actorId) {
		List<Cast> casts = new ArrayList<Cast>();
		String sql = "select * from cast where actorId=?";

		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet results = null;
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, actorId);
			results = statement.executeQuery();
			while(results.next()) {
				Cast cast = new Cast();
				cast.setCastId(results.getString("castId"));
				cast.setCharacterName(results.getString("characterName"));
				cast.setActorId(results.getString("actorId"));
				cast.setMovieId(results.getString("movieId"));
				casts.add(cast);
			}
			results.close();
			results = null;
			statement.close();
			statement = null;
			connection.close();
			connection = null;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(results != null) {
				try {
					results.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return casts;
	}
	
	public List<Cast> readAllCastsForMovie(String movieId) {
		List<Cast> casts = new ArrayList<Cast>();
		String sql = "select * from cast where movieId=?";

		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet results = null;
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, movieId);
			results = statement.executeQuery();
			while(results.next()) {
				Cast cast = new Cast();
				cast.setCastId(results.getString("castId"));
				cast.setCharacterName(results.getString("characterName"));
				cast.setActorId(results.getString("actorId"));
				cast.setMovieId(results.getString("movieId"));
				casts.add(cast);
			}
			results.close();
			results = null;
			statement.close();
			statement = null;
			connection.close();
			connection = null;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(results != null) {
				try {
					results.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return casts;
	}
	
	public Cast readCastForId(String castId){
		Cast cast = new Cast();
		String sql = "select * from cast where castid=?";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet results = null;
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, castId);
			results = statement.executeQuery();
			if(results.next()) {
				cast.setCastId(results.getString("castId"));
				cast.setCharacterName(results.getString("characterName"));
				cast.setActorId(results.getString("actorId"));
				cast.setMovieId(results.getString("movieId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(results != null) {
				try {
					results.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cast;
	}
	
	public void updateCast(String castId, Cast newCast){
		String sql = "update cast set castId=?, characterName=?, actorId=?, movieId=? where castId=?";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, newCast.getCastId());
			statement.setString(2, newCast.getCharacterName());
			statement.setString(3, newCast.getActorId());
			statement.setString(4, newCast.getMovieId());
			statement.setString(5, castId);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}
	}
	
	public void deleteCast(String castId)
	{
		String sql = "delete from cast where castId=?";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, castId);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}
	}
	

	

	public static void main(String[] args) {		

	}

}
