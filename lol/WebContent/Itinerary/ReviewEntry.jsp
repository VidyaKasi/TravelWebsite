<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>

<html>
<head>
<style>
#content{
margin-left:20px;
border-left:0px;
border-right:0px;
}

.row{
margin-left:0px;
margin-right:0px;
border-left:0px;
border-right:0px;


}

.container{
margin-left:0px;
margin-right:0px;
border-left:0px;
border-right:0px;


}
</style>
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

<script>
function counter(msg){
    document.getElementById('counter_div').innerHTML = 'Characters : ' + msg.value.length+'/50';
}
function validate()
{ 
 var packagerating = document.form.radioPackageRate.value;
 var foodrating = document.form.radioFoodRate.value;
 var hotelrating = document.form.radioHotelRate.value;
 var agentrating = document.form.radioAgentRate.value;
 var comment = document.form.comment.value;
 var errorMsg = "";
 
 if (packagerating=="" || packagerating==null){
	errorMsg += "Please select package rating.\n";
 }
 if (foodrating=="" || foodrating==null){
	errorMsg += "Please select food rating.\n";
 }
 if (hotelrating=="" || hotelrating==null){
	errorMsg += "Please select hotel rating.\n";
 }
 if (agentrating=="" || agentrating==null){
	errorMsg += "Please select tour guide rating.\n";
 } 
 if (comment=="" || comment==null){
	errorMsg += "Please enter comment.";
 }
 if(errorMsg != ""){
	alert(errorMsg);
	return false;
 }
}

</script>
<title>Review</title>
</head>
<body>
<div id="content">
	<%
		String packageid = request.getParameter("packageid");
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
		
		String countryName = "";
		String dateStart = "";
		String dateEnd = "";
		
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement prepStmt = null;
		try {
			session.setAttribute("package_id", packageid);
			
			connection = DBConnection.createConnection();
			String sql = "SELECT p.itinerary_id, p.cost, p.agent_id, i.visiting_locations,"
					+ "i.food_catered_id, i.itinerary_type_id, i.flight_id, i.hotel_id " + "FROM package_details p "
					+ "INNER JOIN itinerary_details i on p.itinerary_id = i.itinerary_id "
					+ "WHERE p.package_id = ?";

			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, packageid);
			resultSet = prepStmt.executeQuery();

			//resultSet = statement.executeQuery(sql);
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
			
			sql = "SELECT food_cuisine, food_vendor_name FROM Food_Details " +
					"WHERE food_catered_id = ? ";
			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, foodcaterid);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				foodCuisine = resultSet.getString("food_cuisine");
				foodVendorName = resultSet.getString("food_vendor_name");
			}

			sql = "SELECT agent_first_name, agent_last_name FROM agent_details " +
					"WHERE agent_id = ? ";
			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, agentid);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				agentFirstName = resultSet.getString("agent_first_name");
				agentLastName = resultSet.getString("agent_last_name");
			}
			
			sql = "SELECT Country_Name," +
			"DATE_FORMAT(Trip_Start_Date,'%d-%M-%Y') as Trip_Start_Date," +
			"DATE_FORMAT(Trip_End_Date,'%d-%M-%Y') as Trip_End_Date "+
			"FROM Country_Details " +
			"WHERE Itinerary_ID = ? ";
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
	<form name="form" action="../ReviewServlet" method="post" onsubmit="return validate()">
		<div class="row" style="margin-left:0px;margin-right:0px;">
		<h2>Welcome <%=session.getAttribute("Cust_Email") %><br/>
			Review
		</h2>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="font-weight-bold">
				Package ID : <%=packageid%>
				From: (<%=dateStart%> To <%=dateEnd%>)
			</div>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="font-weight-bold">
				Package:<%=countryName%> - <%=visitingLocations%>
			</div>
		</div>
		
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="col-md-6" style="background-color:#F55A66;color:white;">
				Rating : 
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="1"> 1 </label> 
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="2"> 2 </label> 
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="3"> 3 </label>
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="4"> 4 </label>
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="5"> 5 </label>
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="6"> 6 </label>
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="7"> 7 </label>
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="8"> 8 </label>
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="9"> 9 </label>
				<label class="radio-inline"><input type="radio" name="radioPackageRate" value="10"> 10 </label>
			</div>
		</div>

		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="font-weight-bold">
				Food :
				<%=foodCuisine%> - <%=foodVendorName%>
			</div>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="col-md-6" style="background-color:#F55A66;color:white;">
				Rating : 
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="1"> 1 </label> 
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="2"> 2 </label> 
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="3"> 3 </label>
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="4"> 4 </label> 
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="5"> 5 </label> 
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="6"> 6 </label>
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="7"> 7 </label> 
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="8"> 8 </label> 
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="9"> 9 </label>
				<label class="radio-inline"><input type="radio" name="radioFoodRate" value="10"> 10 </label> 
			</div>
		</div>
		
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="font-weight-bold">
				Hotel :
			</div>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="col-md-6" style="background-color:#F55A66;color:white;">
				Rating : 
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="1"> 1 </label> 
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="2"> 2 </label> 
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="3"> 3 </label>
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="4"> 4 </label> 
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="5"> 5 </label> 
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="6"> 6 </label>
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="7"> 7 </label> 
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="8"> 8 </label> 
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="9"> 9 </label>
				<label class="radio-inline"><input type="radio" name="radioHotelRate" value="10"> 10 </label> 
			</div>
		</div>
		
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="font-weight-bold">
				Tour Guide : <%=agentFirstName%> <%=agentLastName%>
			</div>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="col-md-6" style="background-color:#F55A66;color:white;">
				Rating : 
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="1"> 1 </label> 
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="2"> 2 </label> 
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="3"> 3 </label>
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="4"> 4 </label> 
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="5"> 5 </label> 
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="6"> 6 </label>
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="7"> 7 </label> 
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="8"> 8 </label> 
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="9"> 9 </label>
				<label class="radio-inline"><input type="radio" name="radioAgentRate" value="10"> 10 </label> 
			</div>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="font-weight-bold">
				Comments :
			</div>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<div class="col-md-12">
				<textarea name="comment" placeholder="Comments..." rows="2" cols="50" maxlength="50" onkeyup="counter(this);"></textarea>
			</div>
			<div id="counter_div" class="col-md-12">Characters : 0/50</div>
		</div>
		<div class="row" style="margin-left:0px;margin-right:0px;">
			<button type="submit" style="background-color:#F55A66;color:white;">Submit</button>
		</div>
	</div>
	
	</form>
</body>
</html>