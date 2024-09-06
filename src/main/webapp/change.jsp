<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ page import="p1.DBDemo" %>
</head>
<body>
    <% 
      try{
      DBDemo.Connect();
      String name = request.getParameter("username");
      String mail = request.getParameter("mail");
      String password = request.getParameter("password");
      String userorg = request.getParameter("userorg");
      out.println(userorg);
      
      }
      catch(Exception e)
    {
    	  out.println(e);
    }
      %>
</body>
</html>