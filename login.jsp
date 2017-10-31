<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="arkusz.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="container"><center>
  <img src="images\login-1280.png" class="img-rounded" alt="Cinque Terre">
  </center>
</div>

<%
  try {
            String connectionURL = "jdbc:mysql://localhost/wwwbaza";
            String message = "";
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "htmlStory", "");
            if(!connection.isClosed())
            message = "Successfully connected to " + "MySQL server using TCP/IP...";
            //      out.println("Successfully connected to " + "MySQL server using TCP/IP...");
             connection.close();
        }catch(Exception ex){
          //  message = ("Unable to connect to database");
            out.println("Unable to connect to database"+ex);
  }
%>

  <form method="post" action="waliduj.jsp">
        <div id="panel">
          <label for="useremail">Adres email użytkownika:</label>
          <input type="text" id="username" name="useremail">
          <label for="userpass">Hasło:</label>
          <p><a href="#">Zapomniałeś hasła?</a></p>
          <input type="password" id="password" name="userpass">
        <div id="lower">
          <input type="checkbox"><label class="check" for="checkbox">Zapamiętaj mnie!</label>
          <input type="submit" value="Login">
        </div>
        </div>
    </form>
</body
</html>
