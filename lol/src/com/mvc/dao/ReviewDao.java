package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.mvc.bean.ReviewBean;
import com.mvc.util.DBConnection;

public class ReviewDao {
	public String addReview(ReviewBean reviewBean) {
		int packageRating = reviewBean.getPackage_rating();
		int foodRating = reviewBean.getFood_rating();
		int hotelRating = reviewBean.getHotel_rating();
		int agentRating = reviewBean.getTour_guide_rating();
		String comment = reviewBean.getComment();
		int custId = reviewBean.getCust_id();
		String packageId = reviewBean.getPackage_id();

		 Connection con = DBConnection.createConnection();
		 PreparedStatement preparedStatement = null;
		 try
		 {
			 //update
			 String query = "UPDATE Feedback_Details "
			 		+ "SET Package_Ratings = ?, "
			 		+ "Food_Ratings = ?, "
			 		+ "Hotel_Ratings = ?, "
			 		+ " Tour_Guide_Ratings = ?, "
			 		+ " Additional_Comments = ? "
			 		+ " WHERE Cust_ID = ? "
			 		+ " AND Package_ID = ? ";
			 preparedStatement = con.prepareStatement(query);
			 preparedStatement.setInt(1, packageRating);
			 preparedStatement.setInt(2, foodRating);
			 preparedStatement.setInt(3, hotelRating);
			 preparedStatement.setInt(4, agentRating);
			 preparedStatement.setString(5, comment);
			 preparedStatement.setInt(6, custId);
			 preparedStatement.setString(7, packageId);
			 int i= preparedStatement.executeUpdate();
			 
			 if (i != 0){
				 return "SUCCESS"; 
			 }else{
				 query = "INSERT INTO Feedback_Details (Package_Ratings, Food_Ratings, Hotel_Ratings, Tour_Guide_Ratings, Additional_Comments, Cust_ID, Package_ID) "
					 		+ "VALUES (?,?,?,?,?,?,?)";
				 preparedStatement = con.prepareStatement(query);
				 preparedStatement.setInt(1, packageRating);
				 preparedStatement.setInt(2, foodRating);
				 preparedStatement.setInt(3, hotelRating);
				 preparedStatement.setInt(4, agentRating);
				 preparedStatement.setString(5, comment);
				 preparedStatement.setInt(6, custId);
				 preparedStatement.setString(7, packageId);
				 
				 i = preparedStatement.executeUpdate();
				 if (i != 0){
					 return "SUCCESS"; 
				 }
			 }
		 }catch (Exception ex){
			 System.out.println(ex.toString());
		 }
		 return "FAIL";
	}
}
