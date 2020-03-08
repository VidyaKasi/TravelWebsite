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
	
<title>Review</title>
</head>
<body>
	<div class="container">
		<div class="row">
		<br><br><br>
			<h2>Our Reviews</h2>
		</div>
<%
try {
	String custName = "";
	String comment = "";
	String visitingLocations = "";
	String itineraryType = "";
	String countryName = "";
	String packageRating="";
	
	Connection connection = null;
	ResultSet resultSet = null;
	PreparedStatement prepStmt = null;
	
	connection = DBConnection.createConnection();
	//statement = connection.createStatement();
	String sql = "select c.cust_first_name, f.additional_comments, i.visiting_locations, "
		+ "t.itinerary_type, cty.country_name, f.Package_Ratings "
		+ "from customer_details c, feedback_details f, package_details p, "
		+ "itinerary_details i, itinerary_type_details t, country_details cty "
		+ "where c.cust_id = f.cust_id "
		+ "and f.package_id = p.package_id "
		+ "and p.itinerary_id = i.itinerary_id "
		+ "and i.itinerary_type_id = t.itinerary_type_id "
		+ "and i.itinerary_id = cty.itinerary_id "
		+ "order by i.visiting_locations";

	prepStmt = connection.prepareStatement(sql);
	resultSet = prepStmt.executeQuery();

	while(resultSet.next()) {
		custName = resultSet.getString("cust_first_name");
		comment = resultSet.getString("additional_comments");
		visitingLocations = resultSet.getString("visiting_locations");
		itineraryType = resultSet.getString("itinerary_type");
		countryName = resultSet.getString("country_name");
		packageRating=resultSet.getString("Package_Ratings");
%>
	
			<p class="p-3 mb-2 bg-info text-white">
				<%= custName %>
				<%=packageRating %>/10<br>
				On <%= itineraryType %> in <%= countryName %> 
				<%//= visitingLocations %>
				<br>
				<%= comment %>
			
			</p>
		
<%	
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
	</div>
</body>
</html>