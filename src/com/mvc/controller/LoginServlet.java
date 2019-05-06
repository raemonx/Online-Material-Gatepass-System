package com.mvc.controller;
 import java.io.IOException;
 import javax.servlet.ServletException;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 
import com.mvc.bean.LoginBean;
 import com.mvc.dao.LoginDao;
 
public class LoginServlet extends HttpServlet {
 
public LoginServlet() {
 }
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 

 
String userName = request.getParameter("username");
 String password = request.getParameter("password");
 
LoginBean loginBean = new LoginBean();  

loginBean.setUserName(userName); //setting the username and password through the loginBean object then only you can get it in future.
 loginBean.setPassword(password);
 
LoginDao loginDao = new LoginDao(); //creating object for LoginDao. This class contains main logic of the application.
 
String userValidate = loginDao.authenticateUser(loginBean); //Calling authenticateUser function
 
if(userValidate.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
 {
 request.setAttribute("userName", userName);  
 request.getRequestDispatcher("/Home.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
 }
 else
 {
 request.setAttribute("errMessage", userValidate); //If authenticateUser() function returns other than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
 request.getRequestDispatcher("/Login.jsp").forward(request, response);//forwarding the request
 }
 }
 
}