package sql.injection.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author hawley
 */
public class BankDatabase {

    String driver;
    String url;
    String username;
    String password;
    Statement dbStatement;
    ResultSet dbResultSet;
    Connection conn;
    
    public BankDatabase()
    {
       driver = "oracle.jdbc.driver.OracleDriver";
       url = "jdbc:oracle:thin:@localhost:1521/pdborcl";
       username = "bankInfo";
       password = "bankInfo";
       dbStatement = null;
       dbResultSet = null;
       conn = null;
    }
    public boolean openConnection()
    {
        try
	{
            conn = DriverManager.getConnection(url, username, password);
            return true;
	} catch (SQLException ex)
	{
            return false;
	}
    }
    public String getName(String accountNumber, String username, String password)
    {
      //good query - String query = "select password from accounts where accountnumber = 4007 and usernameaccounts = 'myUser'";
	//bad query - replace "myUser" with "dontKnow' or 1=1 Union select to_char(count(*)) from accounts --"
        //this now confirms that there is a table called accounts and that it has two records
        //next bad query - replace "myUser" with "dontKnow' union select accountnumber from accounts --"
        //now I know all account numbers in the entire table
        String dbUser = null;
        
        //get the password from the database, assuming the account number and username match
        String query = 
                "select username from accounts where accountnumber = " + accountNumber + " and username = '"
                + username + "' and password = '" + password + "'";
	System.out.println("Query: " + query);
	try
	{
            dbStatement = conn.createStatement();
            System.out.println("Statement created successfully.");
	} catch (SQLException ex)
	{
            System.out.println("Problems creating statement" + ex);
            dbUser = null;
	}
	try
	{
            dbResultSet = dbStatement.executeQuery(query);
            System.out.println("Query executed correctly.");
            dbUser = getResults(dbResultSet);
	} catch (SQLException ex)
	{
            System.out.println("Problems executing statement" + ex);
            dbUser = null;
	}
        if (dbUser.equals(null) || dbUser.equals(""))
        {
            return "Login Failed";
        }
        else
        {
            return "Welcome, " + dbUser + "!";
        }
       
    }
    public void closeDB()
    {
        try
	{
            dbStatement.close();
            System.out.println("Statement closed.");
	} catch (SQLException ex)
	{
            System.out.println("Problem closing statement.");
	}
	try
	{
            conn.close();
            System.out.println("Connection closed.");
	} catch (SQLException ex)
	{
            System.out.println("Problem closing connection.");
	}
    }
   
	public static String getResults(ResultSet dbrs)
	{
            int count = 0;
            String toReturn = "";
           
            try
            {
		while (dbrs.next())
		{
                    toReturn += dbrs.getString(1);
                    count++;
		}
            } catch (SQLException ex)
            {
		System.out.println("SQLException occurred while displaying results.\n" + ex);
                return "";
            }
            System.out.println();
            System.out.println(count + " records in result set");
            return toReturn;
	}
    
}
