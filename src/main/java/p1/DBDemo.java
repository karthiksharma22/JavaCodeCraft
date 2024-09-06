package p1;
import java.sql.*;

public class DBDemo {

	public static Connection conn;
	public static Statement st;
	public static void Connect()
	{
		try{
    		 Class.forName("com.mysql.cj.jdbc.Driver");
    		 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttfinal","root","tiger");
    		 st = conn.createStatement(); 
    	 }
    	 catch(Exception e)
    	 {
    		 System.out.println(e);
    	 }
	}

}
