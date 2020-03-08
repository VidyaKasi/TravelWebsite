<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%@page import="com.mvc.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home Page</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="sample.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


	

<style>
*{
	padding:0;
	margin:0;
    -webkit-transition: 1s;
    transition: 1s;
}
.clrd-font{
	background: #FF512F;
	background: -webkit-linear-gradient(to right, #F09819, #FF512F);
	background: linear-gradient(to right, #F09819, #FF512F);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
.btn-primary {
	background-color:transparent;
	color: #fff;
	border: 2px solid #fff;
	font-size:20px;
	text-transform: uppercase;
	border-radius: 0px;	
}
.btn-primary:hover {
	background-color:transparent;
	border-color: #d6962c;
	color: #d6962c;
	border-radius: 20px;
}

.single_portfolio_text{
	display:inline-block;
	padding:0;
	position:relative;
	overflow:hidden;
}
.single_portfolio_text img{
	width:100%;
}

.single_portfolio_text:hover .portfolio_images_overlay{
	top:5%;
	left: 5%;
}

.portfolio_images_overlay{
	width: 90%;
	height: 90%;
	background: rgba(0, 0, 0, 0.8);
	padding: 20px;
	margin: 0 auto;
	top: -100%;
	left: 5%;
	position: absolute;
	transition:.6s;
	
}
.portfolio_images_overlay h6{
	text-transform: uppercase;
	color: #fff;
	font-size: 30px;
	font-weight: 900;
	border: 2px solid #fff;
	padding-top: 10px;
	padding-bottom: 10px;
}

.portfolio_images_overlay .product_price{
	font-size: 35px;
	color: #fff;
	font-weight:800;
	line-height:30px;
}
.portfolio_images_overlay .product_price i{
    margin-right: -10px;
}
.zoom{
	width: 200px;
    height: 200px;
    position: absolute;
    bottom: -100px;
    right: -100px;
    border-radius: 50%;

	background: #FF512F;
	background: -webkit-linear-gradient(to right, #F09819, #FF512F);
	background: linear-gradient(to right, #F09819, #FF512F);
    box-shadow:0px 0px 0px 10px rgba(0,0,0,0.5);
	opacity:0.9;
}
.zoom:before {
	content: "\f00e";
    font-family: FontAwesome;
    color: rgba(255, 255, 255, 0.5);
    font-size: 70px;
    padding-right: 20px;
    position: absolute;
    top: 10px;
    left: 30px;
}
@media (min-width:769px) and (max-width:991px) {
	.portfolio_images_overlay {
		padding: 0px;
	}
}
@media (max-width:768px) {
	.portfolio_images_overlay{
		padding: 170px 20px;
	}
}
@media (max-width:580px) {
	.portfolio_images_overlay{
		padding: 100px 20px;
	}
}
@media (max-width:480px) {
	.portfolio_images_overlay{
		padding: 40px 20px;
	}
}
@media (max-width:320px) {
	.portfolio_images_overlay{
		padding: 20px;
	}
}
input[type=button] {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=button]:hover {
	background-color: #45a049;
}
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100;
}

.carousel-control-prev {
	width: 50% height:50%
}

.carousel-control-next {
	width: 50% height:50%
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
  clear:none;
  
}

.div2 {
float:none;
clear:left;
  
}

.content{
margin-left:26px;
color:#F55A66;
}

</style>




</head>
<body>
	<br>
	<br>
	<br>
	<h1 style="color: black; background-color: white; text-align: center; color: #F55A66;">AtoZTourism.com</h1>
	<div style="text-align:right;color:#F55A66;"><a href="<%=request.getContextPath() %>/LogoutServlet">Logout</a></div>
	
	<br>
	<br>
	<ul class="nav nav-pills red" id="pills-tab" role="tablist">
		<li class="nav-item"><a class="nav-link active"
			id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
			aria-controls="pills-home" aria-selected="true">Home</a></li>
		<li class="nav-item"><a class="nav-link" id="pills-packages-tab"
			data-toggle="pill" href="#pills-packages" role="tab"
			aria-controls="#pills-packages" aria-selected="false">Packages</a></li>
		<li class="nav-item"><a class="nav-link" id="pills-reviews-tab"
			data-toggle="pill" href="#pills-reviews" role="tab"
			aria-controls="pills-reviews" aria-selected="false">Reviews</a></li>
		<li class="nav-item"><a class="nav-link" id="pills-gallery-tab"
			data-toggle="pill" href="#pills-gallery" role="tab"
			aria-controls="pills-gallery" aria-selected="false">Gallery</a></li>

	</ul>
	<div class="content">
	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
			aria-labelledby="pills-home-tab">

			<br> <br> <br> Welcome
			<%=session.getAttribute("fullname")%>
			<br> <br> <br> AtoZTourism.com is all you need when
			you need a perfect break for vacation. <br> Here is your map! <br>
			Click on the packages tab to check out our packages <br> Click
			on the review tab to add or read reviews <br> Click on gallery
			for the amazing pictures of our packs <br>






		</div>
		<div class="tab-pane fade" id="pills-packages" role="tabpanel"
			aria-labelledby="pills-packages-tab">
			<br> <br> Hey
			<%=session.getAttribute("fullname")%>
			! <br> <br> Click on the Package to select it<br>

			<%
				//String id = request.getParameter("userId");

				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
				PreparedStatement prepStmt = null;
			%>

			<%
				try {
					connection = DBConnection.createConnection();
					statement = connection.createStatement();
					String sql = "select Country_Name , Trip_Start_Date, Trip_End_Date, Itinerary_Type, Cost "
							+ "from Itinerary_Details a "
							+ "INNER JOIN Country_Details b on  a.Itinerary_ID = b.Itinerary_ID "
							+ "INNER JOIN Itinerary_Type_Details c on  c.Itinerary_Type_ID = a.Itinerary_Type_ID "
							+ "INNER JOIN Package_Details d on  d.Itinerary_ID = a.Itinerary_ID; ";

					resultSet = statement.executeQuery(sql);
					int recordindex = 1;
					int mon_val;
					String package_link;
					while (resultSet.next()) {
						resultSet.absolute(recordindex);
						String Country_Name = resultSet.getString("Country_Name");
						System.out.println(Country_Name);
						if (Country_Name.equals("New Zealand"))
							package_link = "/lol/Itinerary/NewZealand_Home.jsp";
						else if (Country_Name.equals("Denmark"))
							package_link = "/lol/Itinerary/Denmark_Home.jsp";
						else if (Country_Name.equals("Fiji"))
							package_link = "/lol/Itinerary/Fiji_Home.jsp";
						else if (Country_Name.equals("Maldives"))
							package_link = "/lol/Itinerary/Maldives_Home.jsp";
						else if (Country_Name.equals("Netherlands"))
							package_link = "/lol/Itinerary/Netherlands_Home.jsp";
						else {
							package_link = "/lol/Itinerary/Nopageselected.jsp";
						}
			%>



			<p>
				<br> <br> <a href="<%=package_link%>"> <%=resultSet.getString("Country_Name")%>
				</a>

			</p>

			<table class="table table-dark">
				<thead>
					<tr>
						<th scope="col">Trip Start Date</th>
						<th scope="col">Trip End Date</th>
						<th scope="col">Itinerary Type</th>
						<th scope="col">Cost</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row"><%=resultSet.getString("Trip_Start_Date")%></th>
						<td><%=resultSet.getString("Trip_End_Date")%></td>
						<td><%=resultSet.getString("Itinerary_Type")%></td>
						<td>$<%=resultSet.getString("Cost")%></td>
					</tr>
				</tbody>
			</table>


			<%
				recordindex++;
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			</table>





		</div>
		<div class="tab-pane fade" id="pills-reviews" role="tabpanel"
			aria-labelledby="pills-reviews-tab">

					<br><br>
					<h2>Our Reviews</h2>
					
				
				<%
					try {
						String custName = "";
						String comment = "";
						String visitingLocations = "";
						String itineraryType = "";
						String countryName = "";
						String packageRating = "";
                        String date ="";
						String packageid = "";

						connection = DBConnection.createConnection();

						String cust_email = (String) session.getAttribute("Cust_Email");

						String sql = "select p.package_id,cd.Country_Name,i.Visiting_Locations,p.date "
								+ "from customer_details c, purchase p, Itinerary_Details i,Country_details cd, Package_Details pd "
								+ "where c.cust_email = ? "
								+ "and c.cust_id = p.cust_id " 
								+ "and p.package_id=pd.package_id "
								+ "and pd.itinerary_id=i.itinerary_id " 
								+ "and i.itinerary_id=cd.itinerary_id";
						
						prepStmt = connection.prepareStatement(sql);
						prepStmt.setString(1, cust_email);
						resultSet = prepStmt.executeQuery();

						

						while (resultSet.next()) {
							packageid = resultSet.getString("package_id");
							countryName = resultSet.getString("Country_Name");
							visitingLocations = resultSet.getString("visiting_locations");
							date=resultSet.getString("date");
				%>
            You are able to review
				<a href="/lol/Itinerary/ReviewEntry.jsp?packageid=<%=packageid%>"><%=countryName%>
					- <%=visitingLocations%> purchased on <%=date %></a> <br />

				<%
					}
				%>
				<%
					sql = "select c.cust_first_name, f.additional_comments, i.visiting_locations, "
								+ "t.itinerary_type, cty.country_name, f.Package_Ratings "
								+ "from customer_details c, feedback_details f, package_details p, "
								+ "itinerary_details i, itinerary_type_details t, country_details cty "
								+ "where c.cust_id = f.cust_id " + "and f.package_id = p.package_id "
								+ "and p.itinerary_id = i.itinerary_id " + "and i.itinerary_type_id = t.itinerary_type_id "
								+ "and i.itinerary_id = cty.itinerary_id " + "order by i.visiting_locations";

						prepStmt = connection.prepareStatement(sql);
						resultSet = prepStmt.executeQuery();

						while (resultSet.next()) {
							custName = resultSet.getString("cust_first_name");
							comment = resultSet.getString("additional_comments");
							visitingLocations = resultSet.getString("visiting_locations");
							itineraryType = resultSet.getString("itinerary_type");
							countryName = resultSet.getString("country_name");
							packageRating = resultSet.getString("Package_Ratings");
				%>
				
				
        			<p class="p-3 mb-2 text-white" style="background-color:#F55A66;color:white">
                          
				
					<%=custName%>
					<%=packageRating%>/10<br> On
					<%=itineraryType%>
					in
					<%=countryName%>
					<%
						//= visitingLocations
					%>
					<br>
					<%=comment%>
					

				</p>

				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>




		</div>
		<div class="tab-pane fade" id="pills-gallery" role="tabpanel"
			aria-labelledby="pills-gallery-tab">
			<br>
			<!-- Page Content -->
<div class="container">

  <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Thumbnail Gallery</h1>

  <hr class="mt-2 mb-5" style="border-color:#F55A66">

  <div class="row text-center text-lg-left">

    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/NewZealand_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/pWkk7iiCoDM/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Denmark_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aob0ukAYfuI/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Fiji_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/EUfxH-pze7s/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Maldives_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/M185_qYH8vg/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Maldives_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/sesveuG_rNo/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/NewZealand_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/AvhMzHwiE_0/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Netherlands_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/2gYsZUmockw/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Maldives_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/EMSDtjVHdQ8/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Netherlands_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/8mUEy0ABdNE/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Netherlands_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/G9Rfc1qccH4/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Fiji_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aJeH0KcFkuc/400x300" alt="">
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="/lol/Itinerary/Denmark_Home.jsp" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/p2TQ-3Bh3Oo/400x300" alt="">
          </a>
    </div>
  </div>

</div>
<!-- /.container -->
				

							</div>
							</div>



</body>
</html>
<br>