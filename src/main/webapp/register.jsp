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

   <script>
       let fun = ()=>{
    	   let id = document.getElementsByClassName("tf");
    	   name = id[0].value;
    	   localStorage.setItem("name",name);
    	   
       }

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
     
     <div class="main">
     
      <div class="nav">
      <a href="home.html"><h1>  Questions <i class="fa-solid fa-code" style="color:dodgerblue;"></i> </h1></a>
      <a href="register.jsp"><h1>  Register <i class="fa-solid fa-user" style="color:dodgerblue;"></i> </h1></a>
      </div>
      
      
      <form class="login" action="register.jsp" method="post" onsubmit="fun()">
      <h1>Register</h1>
      <input type="text" class="tf" name="username" placeholder="Username">
      <input type="mail" class="tf" name="mail" placeholder="Email">
      <input type="password" class="tf" name="password" placeholder="Password">
      <span>Have an account ? <a href="login2.jsp">Login Here</a></span>
      <input type="submit" class="submit">
      </form>
      </div>
      
      <%
         try{
        	 DBDemo.Connect();
        	 String name = request.getParameter("username");
        	 String mail = request.getParameter("mail");
        	 String password = request.getParameter("password");
        	 
        	 DBDemo.st.execute("insert into user values('"+mail+"','"+name+"','"+password+"',0,0,0,0);");
        	 response.sendRedirect("home.html");
         }
      catch(Exception e)
      {
    	  out.println(e);
      }
      
      %>
      
      
      
      
      
     
     <script src="https://kit.fontawesome.com/1ffc3d44d6.js" crossorigin="anonymous"></script>
     
</body>
</html>