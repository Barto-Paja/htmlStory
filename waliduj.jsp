<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- Many thx for
*
https://gist.github.com/adidac/3205407
https://www.daniweb.com/programming/web-development/threads/243908/use-java-variable-in-sql-query
* --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String userpass = "";
String useremail= "";

userpass = request.getParameter("userpass");
out.println(userpass);
useremail = request.getParameter("useremail");
out.println(useremail);

String query = ("SELECT user_id FROM t_users WHERE useremail = '"+useremail+"' AND userpass = '"+userpass+"'");

Connection con;
Class.forName(com.mysql.jdbc.Driver.class.getName());
con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wwwbaza", "htmlStory", "");
// PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT user_id FROM t_users WHERE useremail =? AND" + "userpass =? ");
// preparedStatement.setString(1, useremail);
// preparedStatement.setString(2, userpass);
PreparedStatement ps=(PreparedStatement)con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
    out.println("Zalogowano pomyślnie!");

    String name = request.getParameter( "userenail" );
    session.setAttribute( "theName", rs.next() );

    String site = new String("shoshones.html");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);

}
else{
    out.println("Niepoprawny adres email lub hasło :(");
}
%>
</body>
</html>
