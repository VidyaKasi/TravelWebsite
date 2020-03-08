package com.mvc.bean;

public class PackageBean {
	private String package_id;
	private int package_pax;
	private int cost;
	private String itinerary_id;
	private String agent_id;
	public String getPackage_id() {
		return package_id;
	}
	public void setPackage_id(String package_id) {
		this.package_id = package_id;
	}
	public int getPackage_pax() {
		return package_pax;
	}
	public void setPackage_pax(int package_pax) {
		this.package_pax = package_pax;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getItinerary_id() {
		return itinerary_id;
	}
	public void setItinerary_id(String itinerary_id) {
		this.itinerary_id = itinerary_id;
	}
	public String getAgent_id() {
		return agent_id;
	}
	public void setAgent_id(String agent_id) {
		this.agent_id = agent_id;
	}

}
