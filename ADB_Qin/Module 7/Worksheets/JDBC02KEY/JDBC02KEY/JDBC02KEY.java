import java.sql.*;

public class JDBC02KEY
{
  public static void main(String[] args)
  {
	 Connection conn = null;
	 String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	 try
	 {
		conn = DriverManager.getConnection(url, "scott", "tiger");
		System.out.println("Success!");
	 }
	 catch (SQLException ex)
	 {
		System.out.println("Problems getting a connection");
	 }
	 
	 try
	 {
		PreparedStatement updateZipCode =
		  conn.prepareStatement(
		  "update tblStudent set zip = ? where city = ?");
		System.out.println("PreparedStatement created");
		updateZipCode.setString(1,"55555");
		updateZipCode.setString(2, "Maryville");
		updateZipCode.executeUpdate();
		System.out.println("PreparedStatement executed");
	 }
	 catch(SQLException ex)
	 {
		System.out.println("Problems with PreparedStatement");
	 }
	 try
	 {
//		CallableStatement updateGpaStmt =
//		  conn.prepareCall("call update_gpa(944, 1.5)");
// OR
// If you want to use parameters
             CallableStatement updateGpaStmt =
                     conn.prepareCall("call update_gpa(?,?)");
             updateGpaStmt.setInt(1,944);
             updateGpaStmt.setDouble(2,1.5);
		System.out.println("CallableStatement created");
		updateGpaStmt.executeUpdate();
		System.out.println("CallableStatement executed");
	 }
	 catch(SQLException ex)
	 {
		System.out.println("Problems with CallableStatement");
	 }
	 
	 if(conn != null)
	 {
		try
		{
		  conn.close();
		  System.out.println("Connection closed");
		}
		catch (SQLException ex)
		{
		  System.out.println("Problems closing connection");
		}
	 }
  }
}
