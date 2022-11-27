package cocktail.test;

import java.sql.*;

public class DriverTest {
	public static void main(String[] args) {
		Connection con;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocktailer","allchan2","SdkU$531");
			System.out.println("Success");
		}
		catch(SQLException ex) { System.out.println("SQLException" + ex);}
		catch(Exception ex) { System.out.println("Exception:" + ex);}
	}//main():END
}//.java:END
