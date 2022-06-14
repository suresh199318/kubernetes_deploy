<%@ page import="java.sql.*"%>

<%
 String userName = request.getParameter("userName"); 
 
 String password = request.getParameter("password");  
 
Class.forName ("com.mysql.jdbc.Driver").newInstance (); 

        Connection con=DriverManager.getConnection("jdbc:mysql://test.crz3syadqqvr.us-east-1.rds.amazonaws.com:3306/test", "admin", "adminadmin");

        //Here we create our queryPreparedStatement 

     Statement stmt=con.prepareStatement("select * from USER where username='" + userName + "' and password='" + password + "';");

        ResultSet result = stmt.executeQuery();
        while(result.next()){ 
        System.out.println(result.getString("username") + " " +
            result.getString("password"));

%>
