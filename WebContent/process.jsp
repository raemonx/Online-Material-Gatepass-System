<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String mdesc=request.getParameter("mdesc");
String mbearer=request.getParameter("mbearer");
String issuer_name=request.getParameter("issuer_name");
String gatepass_type=request.getParameter("gatepass_type");
String purpose=request.getParameter("purpose");



try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "password");
Statement st=conn.createStatement();


int i=st.executeUpdate("insert into gatepass(date_issued,mdesc,gatepasstype,purpose,mbearer,issuer_name)values(CURDATE(),'"+mdesc+"','"+gatepass_type+"','"+purpose+"','"+mbearer+"','"+issuer_name+"')");
out.println("Gatepass has been generated.");



}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<div style="text-align: right"><a href="LogoutServlet">Logout</a></div>
<h1 style="text-align: center;"><span style="background-color: #fff460; color: #ff6600;"><strong>MATERIAL GATEPASS</strong></span></h1>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://www.iocl.com/iocl-logo-types/logos/Thumbnail.jpg" alt="" width="100" height="100" /></p>
<p><strong></strong></p>
<table border="1" style="border-collapse: collapse; width: 100%;font-family:verdana;background-color: #f7f08a;">
<tbody>
<tr style="height: 21px;">
<td style="width: 50%; text-align: center; height: 21px;">Gatepass No:</td>
<td style="width: 50%; text-align: center; height: 21px;">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "password");
Statement st1 = conn.createStatement();
String sql = ("SELECT * FROM gatepass ORDER BY gatepass_no DESC LIMIT 1");
ResultSet rs = st1.executeQuery(sql);
if (rs.next()) {//get first result
    String gatepass_no=rs.getString(1);//coloumn 1
    out.println(gatepass_no);

} 
%>
</td>
</tr>
<tr style="height: 21px;">
<td style="width: 50%; text-align: center; height: 21px;">Date:</td>
<td style="width: 50%; text-align: center; height: 21px;">
<span id="datetime"></span>
<script>
var dt = new Date();
document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
</script>
</td>
</tr>
<tr style="height: 21px;">
<td style="width: 50%; text-align: center; height: 21px;">Description of Material:</td>
<td style="width: 50%; text-align: center; height: 21px;"><%=mdesc%></td>
</tr>
<tr style="height: 21px;">
<td style="width: 50%; text-align: center; height: 21px;">Gatepass Type:</td>
<td style="width: 50%; text-align: center; height: 21px;"><%=gatepass_type%></td>
</tr>
<tr style="height: 21px;">
<td style="width: 50%; text-align: center; height: 21px;">Purpose:</td>
<td style="width: 50%; text-align: center; height: 21px;"><%=purpose%></td>
</tr>
<tr style="height: 21px;">
<td style="width: 50%; text-align: center; height: 21px;">Material Bearer:</td>
<td style="width: 50%; text-align: center; height: 21px;"><%=mbearer%></td>
</tr>
<tr style="height: 21px;">
<td style="width: 50%; text-align: center; height: 21px;">Issued By:</td>
<td style="width: 50%; text-align: center; height: 21px;"><%=issuer_name%></td>
</tr>
</tbody>
</table>
<input type="button" value="Print this page" onClick="window.print()">