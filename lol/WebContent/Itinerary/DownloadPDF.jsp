<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script src="html2pdf.bundle.min.js"></script>
<script>
	function generatePDF() {
		// Choose the element that our invoice is rendered in.
		const
		element = document.getElementById("invoice");
		// Choose the element and save the PDF for our user.
		html2pdf().from(element).save();
	}
</script>
<title>PDF</title>
</head>
<body>
	<%
		String packageid = (String) session.getAttribute("packageid");			
		String custId = (String) session.getAttribute("custId");

		String totalpax = "";
		String totalcost = "";
		String fullname = "";

		String itineraryid = "";
		String cost = "";
		String agentid = "";
		String visitingLocations = "";

		String foodcaterid = "";
		String itinerarytypeid = "";
		String flightid = "";
		String hotelid = "";

		String foodCuisine = "";
		String foodVendorName = "";

		String agentFirstName = "";
		String agentLastName = "";

		String flightCompany = "";
		String flightMeals = "";
		String countryName = "";
		String dateStart = "";
		String dateEnd = "";

		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement prepStmt = null;
		try {

			connection = DBConnection.createConnection();
			String sql = "SELECT p.total_pax, p.total_cost, c.cust_first_name, c.cust_second_name "
					+ "FROM purchase p, customer_details c " + "WHERE p.package_id = ? " + "AND p.cust_id = ? "
					+ "AND p.cust_id = c.cust_id";
			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, packageid);
			prepStmt.setString(2, custId);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				totalpax = resultSet.getString("total_pax");
				totalcost = resultSet.getString("total_cost");
				fullname = resultSet.getString("cust_first_name");
				fullname = fullname + " " + resultSet.getString("cust_second_name");
			}

			sql = "SELECT p.itinerary_id, p.cost, p.agent_id, i.visiting_locations,"
					+ "i.food_catered_id, i.itinerary_type_id, i.flight_id, i.hotel_id " + "FROM package_details p "
					+ "INNER JOIN itinerary_details i on p.itinerary_id = i.itinerary_id "
					+ "WHERE p.package_id = ?";

			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, packageid);
			resultSet = prepStmt.executeQuery();

			if (resultSet.next()) {
				itineraryid = resultSet.getString("itinerary_id");
				cost = resultSet.getString("cost");
				agentid = resultSet.getString("agent_id");
				visitingLocations = resultSet.getString("visiting_locations");
				foodcaterid = resultSet.getString("food_catered_id");
				itinerarytypeid = resultSet.getString("itinerary_type_id");
				flightid = resultSet.getString("flight_id");
				hotelid = resultSet.getString("hotel_id");
			}

			sql = "SELECT food_cuisine, food_vendor_name FROM Food_Details " + "WHERE food_catered_id = ? ";
			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, foodcaterid);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				foodCuisine = resultSet.getString("food_cuisine");
				foodVendorName = resultSet.getString("food_vendor_name");
			}

			sql = "SELECT agent_first_name, agent_last_name FROM agent_details " + "WHERE agent_id = ? ";
			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, agentid);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				agentFirstName = resultSet.getString("agent_first_name");
				agentLastName = resultSet.getString("agent_last_name");
			}

			sql = "SELECT flight_company, inflight_meals FROM flight_details " + "WHERE flight_id = ? ";
			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, flightid);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				flightCompany = resultSet.getString("flight_company");
				flightMeals = resultSet.getString("inflight_meals");
			}

			sql = "SELECT Country_Name," + "DATE_FORMAT(Trip_Start_Date,'%d-%M-%Y') as Trip_Start_Date,"
					+ "DATE_FORMAT(Trip_End_Date,'%d-%M-%Y') as Trip_End_Date FROM Country_Details "
					+ "WHERE Itinerary_ID = ? ";
			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, itineraryid);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				countryName = resultSet.getString("Country_Name");
				dateStart = resultSet.getString("Trip_Start_Date");
				dateEnd = resultSet.getString("Trip_End_Date");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<button onclick="generatePDF()">Download as PDF</button>
	<div id="invoice">
		<div class="row">
			<div class="col-md-1">&nbsp;</div>
			<div class="col-md-3">&nbsp;</div>
			<div class="col-md-6">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Package Id</div>
			<div class="col-md-6"><%=packageid%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Location</div>
			<div class="col-md-6"><%=countryName%>
				-
				<%=visitingLocations%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Customer Name</div>
			<div class="col-md-6"><%=fullname%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Number of pax</div>
			<div class="col-md-6"><%=totalpax%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Total Price</div>
			<div class="col-md-6">$<%=totalcost%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Date</div>
			<div class="col-md-6"><%=dateStart%>
				To
				<%=dateEnd%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Airline</div>
			<div class="col-md-6"><%=flightCompany%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Inflight meals</div>
			<div class="col-md-6"><%=flightMeals%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Food</div>
			<div class="col-md-6"><%=foodCuisine%>
				food by
				<%=foodVendorName%></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">Tour Guide</div>
			<div class="col-md-6"><%=agentFirstName%>
				<%=agentLastName%></div>
		</div>

	</div>
	
<a href="/lol/Itinerary/Home.jsp">Go to Home</a>
</body>
</html>