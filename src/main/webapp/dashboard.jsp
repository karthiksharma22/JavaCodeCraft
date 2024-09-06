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
     <%!String username;int easy,medium,hard,total; %>
     <script>
         let fun = ()=>{
        	 let name = localStorage.getItem("name");
             let id = document.getElementById("hidden");
             id.value=name;
             
         }
         
      </script>
     <% username = request.getParameter("username"); %>
     <div class="main">
     
      <div class="nav">
      <a href="home.html"><h1>  Questions <i class="fa-solid fa-code" style="color:dodgerblue;"></i> </h1></a>
      <a href="dashboard.html"><h1>  DashBoard <i class="fa-solid fa-chart-line" style="color:dodgerblue;"></i> </h1></a>
      </div>
      
      
      <h1 class="pp"><%=username==null?"":username %> Analytics</h1>
      <form onSubmit="fun()" action="dashboard.jsp" method="post">
      <input type="hidden" name="username" value="" id="hidden">
      <input type="submit" value="Get Analysis"  
      style="margin-top:20px;
	  background-color:dodgerblue;
	  color:white;
	  padding:8px 10px;
	  border-radius:15px;
	  border:none;
	  cursor:pointer;" >
      </form>
      
      
      <div class="charts">
      <%
      try{
  		 DBDemo.Connect();
  		 ResultSet rs = DBDemo.st.executeQuery("select * from user where name = '"+username+"' ;");
  		 while(rs.next())
  		 {
  			total = rs.getInt(4);
  			easy = rs.getInt(5);
  			medium = rs.getInt(6);
  			hard = rs.getInt(7);
  		 }
  		 DBDemo.st.close();
  		 DBDemo.conn.close();
  	 }
  	 catch(Exception e)
  	 {
  		 out.println(e);
  	 }
      %>
        <h2>Number of Questions Solved in </h2> <br>
        <p> <span style="color:green;font-family:consolas;"> Easy </span>level difficulty : <%=easy %></p> <br>
        <p> <span style="color:orange;font-family:consolas;"> Medium </span>  level difficulty : <%=medium %></p> <br>
        <p> <span style="color:red;font-family:consolas;"> Hard </span> level difficulty : <%=hard %></p> <br>
        <h2>Total Number of Questions Solved :  <%=total %> </h2> <br>
      </div>
      
      <style>
      	.ranking{
			width:100%;
			
			margin-top:60px;
		}

		#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
  margin:auto;
  margin-top:20px;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}



#customers tr:hover {background-color: #ededed;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: dodgerblue;
  color: white;
}
      </style>
      
      <div class="ranking">
      
      <table id="customers">
      <tr>
      <th>Name</th>
      <th>Questions Solved</th>
      <th>Ranking</th>
      </tr>
      <%
      
      try{
   		 DBDemo.Connect();
   		 ResultSet rs = DBDemo.st.executeQuery("select name,questions,rank() over (order by questions desc) as rnk from user order by questions desc;");
   		 while(rs.next())
   		 {
   			out.println("<tr>");
   			out.println("<td>"+rs.getString(1)+"</td>");
   			out.println("<td>"+rs.getInt(2)+"</td>");
   			out.println("<td>"+rs.getInt(3)+"</td>");
   			out.println("</tr>");
   		 }
   		 DBDemo.st.close();
   		 DBDemo.conn.close();
   	 }
   	 catch(Exception e)
   	 {
   		 out.println(e);
   	 }
      
      %>
      
      </table>
      </div>

      
     </div>
     
     <script src="https://kit.fontawesome.com/1ffc3d44d6.js" crossorigin="anonymous"></script>
     
</body>
</html>