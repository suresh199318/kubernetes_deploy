
<%@ page import="java.sql.*" %>
<%
  // Read RDS connection information from the environment
String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");

  
  String jdbcUrl = "jdbc:mysql://test.crhgd1lt2mfi.us-east-2.rds.amazonaws.com:3306/test?user=admin&password=testtest";
  
  // Load the JDBC driver
  try {
    System.out.println("Loading driver...");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver loaded!");
  } catch (ClassNotFoundException e) {
    throw new RuntimeException("Cannot find the driver in the classpath!", e);
  }

  Connection conn = null;
  Statement setupStatement = null;
  Statement readStatement = null;
  ResultSet resultSet = null;
  String results = "";
  int numresults = 0;
  String statement = null;

  try {
    // Create connection to RDS DB instance
    conn = DriverManager.getConnection(jdbcUrl);
    
    // Create a table and write two rows
    setupStatement = conn.createStatement();

    String insertRow1 = "insert into USER(first_name, last_name, email, username, password) values ('" + firstName + "','"+ lastName + "','" + email + "','" + userName + "','" + password + "');";
    
    setupStatement.addBatch(insertRow1);
    setupStatement.executeBatch();
    setupStatement.close();
    
  } catch (SQLException ex) {
    // Handle any errors
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
  } finally {
    System.out.println("Closing the connection.");
    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
  }

  try {
    conn = DriverManager.getConnection(jdbcUrl);
    
    readStatement = conn.createStatement();
    resultSet = readStatement.executeQuery("SELECT username FROM USER;");

    resultSet.first();
    results = resultSet.getString("username");
    resultSet.next();
    results += ", " + resultSet.getString("username");
    
    resultSet.close();
    readStatement.close();
    conn.close();

  } catch (SQLException ex) {
    // Handle any errors
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
  } finally {
       System.out.println("Closing the connection.");
      if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
  }

%>
