package com.spaneos.onlinetest.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

public enum DaoUtil {

	util;
	Logger logger = Logger.getLogger(DaoUtil.class.getName());
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection(){
		Connection con=null;
		
		try {
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ONLINE_TEST", "srikanth", "srikanth");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close(Connection con,Statement st, ResultSet rs){
			try {
				if(con != null)
					con.close();
				if(st != null)
					st.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public void close(Connection con,Statement st){
		try {
			if(con != null)
				con.close();
			if(st != null)
				st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(Connection con,PreparedStatement st, ResultSet rs){
		try {
			if(con != null)
				con.close();
			if(st != null)
				st.close();
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(Connection con,PreparedStatement st){
		try {
			if(con != null)
				con.close();
			if(st != null)
				st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(Connection con,CallableStatement st, ResultSet rs){
		try {
			if(con != null)
				con.close();
			if(st != null)
				st.close();
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(Connection con,CallableStatement st){
		try {
			if(con != null)
				con.close();
			if(st != null)
				st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
