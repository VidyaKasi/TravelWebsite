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

<script>
	function compute_price() {
		try {
			numpax = document.getElementById("numpax").value;
			if (checkpax(numpax)) {
				price = document.getElementById("price").value;
				totalprice = numpax * price;
				if (isNaN(totalprice) == true || totalprice < price) {
					document.getElementById('totalprice').innerHTML = '-'
					alert("Please enter number for person.");
					return false;
				}
				document.getElementById('totalprice').innerHTML = '$'
						+ totalprice;
				return true;
			}else{
				return false;
			}
		} catch (err) {
			document.getElementById('totalprice').innerHTML = '-';
		}
	}
	function checkpax(numpax) {
		if (numpax <= 0) {
			alert("Please enter number for person.");
			return false;
		}
		return true;
	}
</script>

<title>Purchase</title>
</head>

<body>
	<%
		String packageid = request.getParameter("packageid");
	 	session.setAttribute("packageid", packageid);
		String itineraryid = "";
		String cost = "";
		String visitingLocations = "";
		String countryName = "";
		String dateStart = "";
		String dateEnd = "";

		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement prepStmt = null;
		try {
			connection = DBConnection.createConnection();
			String sql = "SELECT p.itinerary_id, p.cost, i.visiting_locations " + "FROM package_details p "
					+ "INNER JOIN itinerary_details i on p.itinerary_id = i.itinerary_id "
					+ "WHERE p.package_id = ?";

			prepStmt = connection.prepareStatement(sql);
			prepStmt.setString(1, packageid);
			resultSet = prepStmt.executeQuery();
			if (resultSet.next()) {
				itineraryid = resultSet.getString("itinerary_id");
				cost = resultSet.getString("cost");
				visitingLocations = resultSet.getString("visiting_locations");
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
	<form name="form" action="../PurchaseServlet" method="post"
		onsubmit="return compute_price()">
		<div class="container">
			<div class="row">
				<h2>
					Welcome
					<%=session.getAttribute("fullname")%><br /> Purchase
				</h2>
			</div>
			<div class="row">
				<div class="font-weight-bold">
					Package ID :
					<%=packageid%>
					(<%=dateStart%>
					To
					<%=dateEnd%>)
				</div>
			</div>
			<div class="row">
				<div class="font-weight-bold">
					<%=countryName%>
					-
					<%=visitingLocations%>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">Price (per person):</div>
				<div class="col-md-6">
					<input type="hidden" id="price" name="price" value="<%=cost%>">
					$<%=cost%></div>
			</div>
			<div class="row">
				<div class="col-md-3">Number of person:</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="numpax" name="numpax"
						maxlength="2" size="2" onchange="compute_price()">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">Total Price:</div>
				<div id="totalprice" class="col-md-6"></div>
			</div>

			<div class="row">
				<button type="submit" class="btn btn-dark">Submit</button>
			</div>

		</div>
	</form>
</body>
</html>