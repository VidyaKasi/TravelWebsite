//RegisterDao.java
package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.text.SimpleDateFormat;  
import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;
 
public class RegisterDao {
 
 public String registerUser(RegisterBean registerBean)
 {

 String Cust_First_Name = registerBean.getCust_First_Name();
 String Cust_Second_Name = registerBean.getCust_Second_Name();
 String Cust_Email = registerBean.getCust_Email();
 String Cust_DOB = registerBean.getCust_DOB();
 String Country_Origin = registerBean.getCountry_Origin();
 String Cust_Password = registerBean.getCust_Password();
 String Cust_ID =  registerBean.getCust_ID()   ;


 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
 LocalDate Reg_Date = LocalDate.now();

 Connection con = null;
 PreparedStatement preparedStatement = null;
 
 try
 {
 con = DBConnection.createConnection();
 String query = "insert into customer_details(Cust_Password,Cust_First_Name,Cust_Second_Name,Cust_Email,Reg_Date,Cust_DOB , Country_Origin) values (?,?,?,?,?,?,?)"; //Insert user details into the table 'customer_details'
 preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
// preparedStatement.setString(1, Cust_ID);
 preparedStatement.setString(1, Cust_Password);
 preparedStatement.setString(2, Cust_First_Name);
 preparedStatement.setString(3, Cust_Second_Name);
 preparedStatement.setString(4, Cust_Email);
 preparedStatement.setObject(5, Reg_Date);
 preparedStatement.setString(6, Cust_DOB);
 preparedStatement.setString(7, Country_Origin);
 
 int i= preparedStatement.executeUpdate();
 
 if (i!=0)  //Just to ensure data has been inserted into the database
 return "SUCCESS"; 
 }
 catch(SQLException e)
 {
 e.printStackTrace();
 }
 return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
 }
}