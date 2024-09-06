<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ page import="java.sql.*" %>
<%@ page import="p1.DBDemo" %>
</head>
<body>
      <%
          try{
        	  String difficulty = request.getParameter("difficulty"); 
        	  String username = request.getParameter("username");
        	  
        	  DBDemo.Connect();
        	  boolean n = DBDemo.st.execute("update user set "+difficulty+" = "+difficulty+" + 1, questions = questions + 1 where name = '"+username+"';");
        	  if(!n)
        	  {
        		  response.sendRedirect("home.html");
        	  }
        	  else{
        		  out.println("Error in updating table");
        	  }
          }
          catch(Exception e)
      		{
        	  out.println(e);
      		}
          
      %>
</body>
</html>