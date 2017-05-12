/**
 * Name			:	DBConnection.java
 * Desc			:	Used to get/create Connection Objects
 * Author Name	:	Anish Ratnawat,Surendra Pratap Singh,Gaurav Pandey
 * Institute 	:   IIIT Bangalore
 * */
package databaseManager;
import java.sql.*;

import Commons.Common;

public class DBConnection {

    private static Connection con;
    
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(Common.dbURL, Common.dbUserName, Common.dbPwd);
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    //Get connection objects
    public static Connection getConnection() throws SQLException {
        if (con.isClosed()) {
            con = DriverManager.getConnection(Common.dbURL, Common.dbUserName, Common.dbPwd);
        }
        return con;
    }
    public static void closeConnection(Connection con,PreparedStatement ps){
    	try {
	    	if(con!=null){
				con.close();
	    	}
	    	if(ps!=null){
	    		ps.close();
	    	}
    	} catch (SQLException e) {
			System.out.println("DBConnection:::::closeConnection::::"+e.getMessage());
		}
    }
    
}


