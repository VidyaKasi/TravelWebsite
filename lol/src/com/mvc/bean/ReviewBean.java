package com.mvc.bean;

public class ReviewBean {
	private int package_rating;
	private int food_rating;
	private int hotel_rating;
	private int tour_guide_rating;
	private String comment;
	private int cust_id;
	private String package_id;
	public int getPackage_rating() {
		return package_rating;
	}
	public void setPackage_rating(int package_rating) {
		this.package_rating = package_rating;
	}
	public int getFood_rating() {
		return food_rating;
	}
	public void setFood_rating(int food_rating) {
		this.food_rating = food_rating;
	}
	public int getHotel_rating() {
		return hotel_rating;
	}
	public void setHotel_rating(int hotel_rating) {
		this.hotel_rating = hotel_rating;
	}
	public int getTour_guide_rating() {
		return tour_guide_rating;
	}
	public void setTour_guide_rating(int tour_guide_rating) {
		this.tour_guide_rating = tour_guide_rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
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


}
