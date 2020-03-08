package com.mvc.bean;
import java.sql.Date;

public class PurchaseBean {
	private int cust_id;
	private String package_id;
	private int total_pax;
	private int total_cost;
	private Date date;
	public int getCust_id() {
		return cust_id;
	}
	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}
	public String getPackage_id() {
		return package_id;
	}
	public void setPackage_id(String package_id) {
		this.package_id = package_id;
	}
	public int getTotal_pax() {
		return total_pax;
	}
	public void setTotal_pax(int total_pax) {
		this.total_pax = total_pax;
	}
	public int getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}
	public Date getDate()
	{
		return date;
	}
	public void setDate(Date date)
	{
		this.date=date;
	}

}
