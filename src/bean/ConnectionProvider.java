package bean;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Connection;



public class ConnectionProvider {
	
	static private String user = "";
	static private String pass = "";
	static private String dbClass = "com.mysql.jdbc.Driver";
	static private String dbDriver = "jdbc:mysql://localhost:3306/";
	static private java.sql.Connection  conn = null;

	public static java.sql.Connection getCon() {
	    boolean done = false;
	    //load driver
	    try {
	        Class.forName(dbClass).newInstance();
	        System.out.println("driver loaded"); // THIS IS BEING RETURNED
	    } catch (Exception ex) {
	        System.out.println(ex);
	    }
	    // Connection
	    try {
	        conn = DriverManager.getConnection(dbDriver, user, pass);
	        System.out.println("connected"); // THIS IS NOT BEING RETURNED
	        done = true;
	    } catch (SQLException ex) {
	        System.out.println("SQLException: " + ex.getMessage());
	    }
	    return conn;
	}

	public static void main(String args[]) {

	    ConnectionProvider.getCon();
	    

	}

}
