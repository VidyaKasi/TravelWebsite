package servlets;

//RegisterServlet.java

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;

import java.util.UUID;

public class RegisterServlet extends HttpServlet {

public RegisterServlet() {
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Copying all the input parameters in to local variables

String Cust_Email = request.getParameter("Cust_Email");
String Cust_Second_Name = request.getParameter("Cust_Second_Name");
String Cust_First_Name = request.getParameter("Cust_First_Name");
String Cust_Password = request.getParameter("Cust_Password");
String Cust_DOB = request.getParameter("Cust_DOB");
String Country_Origin = request.getParameter("Country_Origin");


RegisterBean registerBean = new RegisterBean();
//Using Java Beans - An easiest way to play with group of related data
//String uniqueID = UUID.randomUUID().toString();
String userID = Cust_Email;
registerBean.setCust_ID(userID);
registerBean.setCust_Password(Cust_Password);
registerBean.setCust_First_Name(Cust_First_Name);
registerBean.setCust_Second_Name(Cust_Second_Name);
registerBean.setCust_Email(Cust_Email); 
registerBean.setCust_DOB(Cust_DOB); 
registerBean.setCountry_Origin(Country_Origin); 





RegisterDao registerDao = new RegisterDao();

//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String userRegistered = registerDao.registerUser(registerBean);

if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
request.getRequestDispatcher("/Itinerary/Success3.jsp").forward(request, response);
}
else   //On Failure, display a meaningful message to the User.
{
request.setAttribute("errMessage", userRegistered);
request.getRequestDispatcher("/Register.jsp").forward(request, response);
}
}
}