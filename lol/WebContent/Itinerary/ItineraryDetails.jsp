<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%@page import="java.sql.*"%>

<!doctype html>
<head>

<title>Showing the itinerary details</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
			} else {
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

<style>
.pills-fly {
	background-image: "flight.png"
}

#row1col1, #row2col2 {
	margin: 20px;
}

.row {
	margin: 5px;
}

a.col-md-4 {
	padding-left: 2x;
	padding-right: 2px;
}

.billing {
	color: #F55A66;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link
.nav-link {
	background-color: #F55A66;
	color: white;
	margin-left: 20px;
}

.nav-link {
	background-color: white;
	color: #F55A66;
	margin-left: 20px;
}

.tab-pane fade show active {
	background-color: #F55A66;
	color: white;
	margin-left: 20px;
}

.rounded-circle {
	float: left;
}

.div1 {
	float: left;
	clear: none;
}

.div2 {
	float: none;
	clear: left;
}
</style>
<script>
	
</script>

</head>

<body>
	<div class="it_content">
		<%
			String id = request.getParameter("userId");
			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "tour_agency_schema";
			String userId = "root";
			String password = "";

			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
			PreparedStatement prepStmt = null;
			String ctyName = request.getParameter("cty");
			if (ctyName.equals("nz")) {
				ctyName = "New Zealand";
			} else if (ctyName.equals("nl")) {
				ctyName = "Netherlands";
			} else if (ctyName.equals("dk")) {
				ctyName = "Denmark";
			} else if (ctyName.equals("fj")) {
				ctyName = "Fiji";
			} else if (ctyName.equals("mv")) {
				ctyName = "Maldives";
			} else {
				ctyName = "Null";
			}
		%>
		<h1 style="color: #F55A66; text-align: center">
			Itinerary Details For
			<%=ctyName%></h1>
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<!-- Titles for the tab -->
			<li class="nav-item"><a class="nav-link active"
				id="pills-places-tab" data-toggle="pill" href="#pills-places"
				target="_self_" role="tab" aria-controls="pills-places"
				aria-selected="true"> Places</a></li>
			<li class="nav-item"><a class="nav-link" id="pills-dine-tab"
				data-toggle="pill" href="#pills-dine" role="tab"
				aria-controls="pills-dine" aria-selected="false"> Food</a></li>
			<li class="nav-item"><a class="nav-link" id="pills-fly-tab"
				data-toggle="pill" href="#pills-fly" role="tab"
				aria-controls="pills-fly" aria-selected="false"> Flight</a></li>
			<li class="nav-item"><a class="nav-link" id="pills-stay-tab"
				data-toggle="pill" href="#pills-stay" role="tab"
				aria-controls="pills-stay" aria-selected="false"> Hotel </a></li>

			<li class="nav-item"><a class="nav-link" id="pills-price-tab"
				data-toggle="pill" href="#pills-purchase" role="tab"
				aria-controls="pills-purchase" aria-selected="false"> Purchase </a>
			</li>
		</ul>
		<div class="tab-content" id="pills-tabContent">
			<!-- Contents of the tab goes here -->

			<div class="tab-pane fade show active" id="pills-places"
				role="tabpanel" aria-labelledby="pills-places-tab">


				<!-- Retrieving and showing the itinerary details for places -->
				<%
					try {
						//Getting a connection object for the tour schema db with the username and password
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						statement = connection.createStatement();

						String sql = "Select Visiting_Locations from Itinerary_Details a "
								+ "INNER JOIN Country_Details b on  a.Itinerary_ID = b.Itinerary_ID " + "where Country_Name="
								+ "\"" + ctyName + "\"";

						resultSet = statement.executeQuery(sql);
						int recordindex = 1;
						while (resultSet.next()) {
							int i = 0;
							resultSet.absolute(recordindex);
							String s = resultSet.getString("Visiting_Locations");
							//String[] result = s.split(",");

							//while(i<result.length){
				%>


				<p style="margin-left: 12px; padding: 16px; color: #F55A66">
					<%=s%>

					<!-- %=result[i] % -->
				</p>

				<%
					//i++;
							//}
				%>


				<%
					recordindex++;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>

				<div class="container" style="margin: 0px; padding: 0px;">
					<div class="row">
						<img
							src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(73).jpg"
							style="padding-left: 20px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img
							src="https://mdbootstrap.com/img/Photos/Vertical/mountain1.jpg"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img
							src="https://mdbootstrap.com/img/Photos/Vertical/mountain2.jpg"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded">
					</div>
					<div class="row">
						<img
							src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg"
							style="padding-left: 20px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img
							src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(18).jpg"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img
							src="https://mdbootstrap.com/img/Photos/Vertical/mountain3.jpg"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded">
					</div>
				</div>
				<p style="margin: 20px; padding: 12px; color: #F55A66;">
					<a href="/lol/googlemap.html">Look in the map</a>
				</p>
			</div>
			<div class="tab-pane fade" id="pills-dine" role="tabpanel"
				aria-labelledby="pills-dine-tab">
				<%
					try {
						//Getting a connection object for the tour schema db with the username and password
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						statement = connection.createStatement();

						String sql = "Select Food_Cuisine, Food_Vendor_Name from Itinerary_Details a "
								+ "INNER JOIN food_details b on  a.Food_Catered_ID = b.Food_Catered_ID "
								+ "INNER JOIN country_details c on a.Itinerary_ID=c.Itinerary_ID " + "where Country_Name="
								+ "\"" + ctyName + "\"";

						resultSet = statement.executeQuery(sql);
						int recordindex = 1;
						while (resultSet.next()) {
							int i = 0;
							resultSet.absolute(recordindex);
				%>





				<p class="itinerary_details"
					style="margin-left: 20px; color: #F55A66;">
					<%=resultSet.getString("Food_Cuisine")%>
					<%=resultSet.getString("Food_Vendor_Name")%>
				</p>


				<%
					recordindex++;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>

				<div class="container" style="margin: 0px; padding: 0px;">
					<div class="row">
						<img src="FoodImage1.jpg"
							style="padding-left: 18px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img src="FoodImage2.jpg"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img src="FoodImage3.jpg"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded">
					</div>
					<div class="row">
						<img src="cups.jpg"
							style="padding-left: 18px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img src="cake.png"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded"> <img src="pasta.jpg"
							style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
							class="img-fluid rounded">
					</div>
				</div>



			</div>
			<div class="tab-pane fade" id="pills-fly" role="tabpanel"
				aria-labelledby="pills-fly-tab">

				<%
					try {
						//Getting a connection object for the tour schema db with the username and password
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						statement = connection.createStatement();

					
								
								
								
								
						String sql = "Select Flight_Company, Inflight_Meals, starts_from, Dep_Time_Src, Arr_Time_Dest, Arr_Time_Src, Dep_Time_Dest, "
						+"DATE_FORMAT(c.Trip_Start_Date,'%d-%M-%Y') as Trip_Start_Date, "
								+ "DATE_FORMAT(c.Trip_End_Date,'%d-%M-%Y') as Trip_End_Date "
								
								+"from Itinerary_Details a "
								+ "INNER JOIN Flight_Details b on  a.Flight_ID = b.Flight_ID "
								+ "INNER JOIN country_details c on a.Itinerary_ID=c.Itinerary_ID " + "where Country_Name="
								+ "\"" + ctyName + "\"";
						System.out.println("Flight------\n"+sql);

						resultSet = statement.executeQuery(sql);
						int recordindex = 1;
						while (resultSet.next()) {
							int i = 0;
							resultSet.absolute(recordindex);
				%>




				<p class="itinerary_details"
					style="margin-left: 20px; color: #F55A66;">
				<div class="div1">
					<img src="flight -vector.jpg" class="rounded-circle"
						alt="Cinque Terre" width="10%" height="10%">
					<p style="margin-left: 20px; color: #F55A66;">

						<br> Airways:<%=resultSet.getString("Flight_Company")%><br>
						Meal Availability:<%=resultSet.getString("Inflight_Meals")%><br>
					</p>
					</div1>
					<div class="div2">
						<hr style="border-color: #F55A66;">
						<p style="margin-left: 20px; color: #F55A66;">
							From:<%=resultSet.getString("starts_from")%><br> To:<%=ctyName%><br>
							Departure Time:<%=resultSet.getString("Dep_Time_Src")%><br>
							Arrival Time:<%=resultSet.getString("Arr_Time_Dest")%><br>
							Date:<%=resultSet.getString("Trip_Start_Date")%><br>
							
							
						</p>
					</div>
					<hr style="border-color: #F55A66;">

					<p style="margin-left: 20px; color: #F55A66;">

						From:<%=ctyName%><br> To:<%=resultSet.getString("starts_from")%><br>
						Departure Time:<%=resultSet.getString("Dep_Time_Dest")%><br>
						Arrival Time:<%=resultSet.getString("Arr_Time_Src")%><br>
				         Date:<%=resultSet.getString("Trip_End_Date") %><br>
						
					</p>

					<hr style="border-color: #F55A66;">











					</p>

					<%
						recordindex++;
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</div>
			</div>
		<div class="tab-pane fade" id="pills-stay" role="tabpanel"
			aria-labelledby="pills-stay-tab">

			<%
				try {
					//Getting a connection object for the tour schema db with the username and password
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					statement = connection.createStatement();

					String sql = "Select Hotel_Name,Hotel_Rooms,Hotel_Star from Itinerary_Details a "
							+ "INNER JOIN Hotel_Details b on a.Hotel_ID = b.Hotel_ID "
							+ "INNER JOIN country_details c on a.Itinerary_ID=c.Itinerary_ID " + "where country_name="
							+ "\"" + ctyName + "\"";

					System.out.println(sql);

					resultSet = statement.executeQuery(sql);
					int recordindex = 1;
					while (resultSet.next()) {
						int i = 0;
						resultSet.absolute(recordindex);
			%>




			<p style="margin-left: 20px; padding: 16px; color: #F55A66">
				Hotel:<%=resultSet.getString("Hotel_Name")%><br> Number of
				Rooms:<%=resultSet.getString("Hotel_Rooms")%><br> Stars:<%=resultSet.getString("Hotel_Star")%><br>
			</p>
			<div class="container" style="margin: 0px; padding: 0px;">
				<div class="row">
					<img src="hotel-1.jpg"
						style="padding-left: 20px; padding-right: 2px; height: 200px; width: 200px;"
						class="img-fluid rounded"> <img src="hotel-2.jpg"
						style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
						class="img-fluid rounded"> <img src="hotel-3.jpg"
						style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
						class="img-fluid rounded">
				</div>
				<div class="row">
					<img src="hotels.jpg"
						style="padding-left: 20px; padding-right: 2px; height: 200px; width: 200px;"
						class="img-fluid rounded"> <img src="hotel-4.jpg"
						style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
						class="img-fluid rounded"> <img src="hotel-5.jpg"
						style="padding-left: 2px; padding-right: 2px; height: 200px; width: 200px;"
						class="img-fluid rounded">
				</div>


				<%
					recordindex++;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>



			</div>
		</div>
	
	<div class="tab-pane fade" id="pills-purchase" role="tabpanel"
		aria-labelledby="pills-purchase-tab">

		<%
			String packageid = "";
			String itineraryid = "";
			String cost = "";
			String visitingLocations = "";
			String countryName = "";
			String dateStart = "";
			String dateEnd = "";

			try {

				String sql = "SELECT p.package_id from package_details p, country_details c "
						+ "where p.itinerary_id = c.itinerary_id " + "and c.country_id = ? ";
				prepStmt = connection.prepareStatement(sql);

				prepStmt.setString(1, request.getParameter("cty"));
				resultSet = prepStmt.executeQuery();
				if (resultSet.next()) {
					packageid = resultSet.getString("package_id");
					session.setAttribute("packageid", packageid);
				}

				sql = "SELECT p.itinerary_id, p.cost, i.visiting_locations " + "FROM package_details p "
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
			<div class="billing">
				<h2 style="color: #F55A66; margin: 20px; padding: 16px;">
					Welcome
					<%=session.getAttribute("fullname")%>
				</h2>

				<p class="itinerary_details"
					style="color: #F55A66; margin: 20px; padding: 16px;">

					Find your package details below.<br> Package ID:<%=packageid%><br>
					From:<%=dateStart%><br> To:<%=dateEnd%><br> Destination:<%=countryName%><br>
					Places:<%=visitingLocations%><br> Price (per person): <input
						type="hidden" id="price" name="price" value="<%=cost%>"> $<%=cost%><br>
					Enter number of people: <input type="text" id="numpax"
						name="numpax" onchange="compute_price()"><br> 
						Total Price:<div id="totalprice"></div>
				<br>





				<button style="background-color: #F55A66; color: white">Buy</button>
			
			</div>
			
</div>
</div>
		</form>

	</div>
</body>
</html>