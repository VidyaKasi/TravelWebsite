package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mvc.bean.PackageBean;
import com.mvc.util.DBConnection;

public class PackageDao {
	@SuppressWarnings("finally")
	public PackageBean getPackage(String packageId){
		 Connection con = DBConnection.createConnection();
		 PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
		 PackageBean packageBean = new PackageBean();
		 try
		 {
			 String query = "SELECT * from Package_Details "
			 		+ " WHERE Package_ID = ? ";
			 preparedStatement = con.prepareStatement(query);
			 preparedStatement.setString(1, packageId);
			 
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				packageBean.setPackage_pax(resultSet.getInt("Package_Pax"));
				packageBean.setCost(resultSet.getInt("cost"));
				packageBean.setItinerary_id(resultSet.getString("Package_Pax"));
				packageBean.setAgent_id(resultSet.getString("Agent_ID"));
			}
		 }catch (Exception ex){
			 System.out.println(ex.toString());
		 }finally{
			 return packageBean;
		 }
	}
}
