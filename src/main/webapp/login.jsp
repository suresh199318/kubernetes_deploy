<%@ page import="java.sql.*"%>

<%
 String userName = request.getParameter("userName"); 
 
 String password = request.getParameter("password");  

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://test.crz3syadqqvr.us-east-1.rds.amazonaws.com:3306/test","admin","adminadmin");
//here sonoo is database name, root is username and password
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from USER where username='" + userName + "' and password='" + password + "'");
while(rs.next()){
System.out.println("Success");
con.close();
}catch(Exception e){ System.out.println(e);}
}

%>
