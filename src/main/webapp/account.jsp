<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JavaCodeCraft</title>
<link rel="stylesheet" href="home.css">
<link rel="icon" href="https://png.pngtree.com/png-clipart/20210523/original/pngtree-letter-j-logo-png-png-image_6317441.jpg">
<%@ page import="java.sql.*" %>
<%@ page import="p1.DBDemo" %>
</head>
<body>
     <%! String username; %>
     <script>
         let fun = ()=>{
        	 let name = localStorage.getItem("name");
             let id = document.getElementById("hidden");
             id.value=name;  
         }
       <% username = request.getParameter("username"); %> 
      </script>
      <style>
	   .login{
	   background-color:#ededed;
	   width:40%;
	   margin:auto;
	   margin-top:140px;
	   padding:20px 0px;
	   display:flex;
	   flex-direction:column;
	   justify-content:center;
	   align-items:center;
	   gap:20px;
	   border-radius:20px;
	   box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
	   
	   }
	   
	   .submit{
	   background-color:dodgerblue;
	   color:white;
	   border-radius:10px;
	   padding:4px 13px;
	   border:none;
	   cursor:pointer;
	   }
	   
	   
	   .tf{
	   outline:none;
	   padding:5px 10px;
	   border-radius:8px;
	   border:none;
	   width:60%;
	   font-size:17px;
	   }
	   
	   span a{
	   color:dodgerblue;
	   }
	   
	   
	   
	</style>
      <% username = request.getParameter("username"); %>
     <div class="main">
     
      <div class="nav">
      <a href="home.html"><h1>  Questions <i class="fa-solid fa-code" style="color:dodgerblue;"></i> </h1></a>
      <a href="account.jsp"><h1>  Account <i class="fa-solid fa-user" style="color:dodgerblue;"></i> </h1></a>
      </div>
      
      <h1 class="pp"><%=username==null?"":username %> Account </h1>
      <form onsubmit="fun()" action="account.jsp" method="post">
      <input type="hidden" name="username" value="" id="hidden">
      <input type="submit" value="Get Account"  
      style="margin-top:20px;
	  background-color:dodgerblue;
	  color:white;
	  padding:8px 10px;
	  border-radius:15px;
	  border:none;
	  cursor:pointer;" >
      </form>
      
      
      
      
      <form class="login" action="change.jsp" method="post">
      <h1>Account Details</h1>
      <%
          
          try{
        	  DBDemo.Connect();
        	  ResultSet rs = DBDemo.st.executeQuery("select mail,name,password from user where name='"+username+"';");
        	  while(rs.next())
        	  {
        		  out.println("<input type=\"hidden\"  name=\"userorg\" value="+username+">");
        		  out.println("<input type=\"text\" class=\"tf\" name=\"username\" placeholder="+username+">");
        		  out.println("<input type=\"text\" class=\"tf\" name=\"mail\" placeholder="+rs.getString(1)+">");
        		  out.println("<input type=\"text\" class=\"tf\" name=\"password\" placeholder="+rs.getString(3)+">");
        	  }
        		  
          }
      catch(Exception e)
      {
    	  out.println(e);
      }
      %>
      <input type="submit" value="Change Account" class="submit">
      
      </form>
      
      </div>
      
      
     
     <script src="https://kit.fontawesome.com/1ffc3d44d6.js" crossorigin="anonymous"></script>
     
</body>
</html>