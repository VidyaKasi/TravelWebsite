package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.mvc.bean.PurchaseBean;
import com.mvc.util.DBConnection;
import java.sql.Date;
public class PurchaseDao {
	public String addPurchase(PurchaseBean purchaseBean) {
		int custId = purchaseBean.getCust_id();
		String packageid = purchaseBean.getPackage_id();
		int numpax = purchaseBean.getTotal_pax();
		int cost = purchaseBean.getTotal_cost();
		Date date=purchaseBean.getDate();

		Connection con = DBConnection.createConnection();
		PreparedStatement preparedStatement = null;
		try {
			String query = "INSERT INTO Purchase " + "(Cust_ID,Package_ID,total_pax,total_cost,Date) " + " VALUES "
					+ " (?,?,?,?,?)";
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, custId);
			preparedStatement.setString(2, packageid);
			preparedStatement.setInt(3, numpax);
			preparedStatement.setInt(4, cost);
			preparedStatement.setDate(5, date);

			int i = preparedStatement.executeUpdate();

			if (i != 0) {
				return "SUCCESS";
			} else {
				return "FAIL";
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return "FAIL";
	}
}
