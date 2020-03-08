package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.sql.Statement;
 import com.mvc.bean.LoginBean;
 import com.mvc.util.DBConnection;
 
 public class LoginDao {
 
	 public String authenticateUser(LoginBean loginBean)
 
	 {
 

		 String Cust_Email = loginBean.getCust_Email(); //Keeping user entered values in temporary variables.

		 String Cust_Password = loginBean.getCust_Password();
 

		 Connection con = null;
 
		 Statement statement = null;
 
		 ResultSet resultSet = null;
 

		 String userNameDB = "";
 
		 String passwordDB = "";
		 
		 String CustID_DB ="";
		 
		 String firstname="";
		 
		 String secondname="";
 

		 try
 
		 {
 
			 con = DBConnection.createConnection(); //establishing connection
 
			 statement = con.createStatement(); //Statement is used to write queries. Read more about it.
 
			 resultSet = statement.executeQuery("select Cust_Email,Cust_Password,Cust_ID,Cust_First_Name, Cust_Second_Name from Customer_Details"); //Here table name is users and userName,password are columns. fetching all the records and storing in a resultSet.
 

			 while(resultSet.next()) // Until next row is present otherwise it return false
 
			 {
  
				 userNameDB = resultSet.getString("Cust_Email"); //fetch the values present in database
  
				 passwordDB = resultSet.getString("Cust_Password");
				 
				 CustID_DB = resultSet.getString("Cust_ID");
				 
				 firstname = resultSet.getString("Cust_First_Name");
				 
				 secondname = resultSet.getString("Cust_Second_Name");
				 
				 loginBean.setFirstname(firstname);
				 
				 loginBean.setSecondname(secondname);
 
   
				 if(Cust_Email.equals(userNameDB) && Cust_Password.equals(passwordDB))
   
				 {
      
					 return "SUCCESS"; ////If the user entered values are already present in database, which means user has already registered so I will return SUCCESS message.
   
				 }

			 }
			}
 
			 catch(SQLException e)
 
			 {
 
				 e.printStackTrace();
 
			 }
 
			 return "Invalid user credentials"; // Just returning appropriate message otherwise
 
		 }
	 public String findCustIdByEmail(String email){
		 String cust_ID = "";
		 Connection con = null;
		 ResultSet resultSet = null;
		 PreparedStatement preparedStatement = null;
		 try
		 {
 			con = DBConnection.createConnection(); //establishing connection
 			String query = "SELECT Cust_ID FROM Customer_Details WHERE Cust_Email = ?";
 			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, email);
			resultSet = preparedStatement.executeQuery();
 			if(resultSet.next()){
 				cust_ID = resultSet.getString("Cust_ID");
 			}
		 }catch(SQLException e){
			e.printStackTrace();
		}
		return cust_ID;
	 }

 }
	 