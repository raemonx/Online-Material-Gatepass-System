<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home Page</title>
</head>
<body style="background-color:rgb(247, 243, 202);">
 <center><h1 style="font-family:verdana;"><span style="color: #ff0000;"></span>GATE PASS GENERATION SYSTEM</h1></center>
 Welcome <span style="color: #ff6600;"><%=request.getAttribute("userName") %></span>, You have successfully logged in.
 <div style="text-align: right"><a href="LogoutServlet">Logout</a></div>
 
<form method="post" action="process.jsp">
<fieldset>
<strong><h2><legend align="top">Enter gatepass details:</legend></h2>
				<label for="mdesc">Material Description</label>
                <input type="text" name="mdesc" /> <br/>
                
                <label for="gatepass_type">Gatepass Type</label>
                <select id="gatepass_type" name="gatepass_type">
  						<option value="returnable">Returnable</option>
  						<option value="Non_returnable">Non-Returnable</option>
  						<option value="Modification">Modification</option>
  						<option value="Personal">Personal</option>
  						<option value="Commercial">Commercial</option>
				</select> <br/>
                
                <label for="purpose">Purpose</label>
                <select id="purpose" name="purpose">
  						<option value="Repair">Repair</option>
  						<option value="Request">Request</option>
  						<option value="Official">Official</option>
  						<option value="Security">Security</option>
  						
				</select> <br/>
                
                <label for="mbearer">Bearer Details</label>
                <input type="text" name="mbearer" /> <br/>
                
                
                <label for="issuer_name">Issuer Name</label>
                <input type="text" name="issuer_name" value="<%=request.getAttribute("userName") %>" /> <br/>
                
                <input type="submit" value="submit"></strong>
</fieldset>
</form>
 
</body>
</html>