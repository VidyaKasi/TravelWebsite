<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("userId");
String driverName ="com.mysql.jdbc.Driver";
String connectionUrl ="jdbc:mysql://localhost:3306/";
String dbName="tour_agency_schema";
String userId="root";
String password="";

try{
Class.forName(driverName);	
}catch(ClassNotFoundException e){
e.printStackTrace();	
}

Connection connection=null;
Statement statement=null;
ResultSet resultSet=null;

%>


<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
</tr>
<tr bgcolor="#A52A2A">
<td><b>Visiting locations</b></td>
</tr>

<%
try{
	//Getting a connection object for the tour schema db with the username and password
	connection=DriverManager.getConnection(connectionUrl+dbName,userId, password);
	statement=connection.createStatement();
	//String sql="Select Visiting_Locations from Itinerary_Details a "+
	//"INNER JOIN Country_Details b on  a.Itinerary_ID = b.Itinerary_ID";
	
	String sql="Select Food_Cuisine, Food_Vendor_Name from Itinerary_Details a "+
	"INNER JOIN food_details b on  a.Food_Catered_ID = b.Food_Catered_ID "+
	"INNER JOIN country_details c on a.Itinerary_ID=c.Itinerary_ID "+
	"where Country_Name="+ "\"" + "New Zealand" + "\"";
	
	/*String sql ="select Country_Name , Trip_Start_Date, Trip_End_Date, Itinerary_Type, Cost " + 
			"from Itinerary_Details a " +
			"INNER JOIN Country_Details b on  a.Itinerary_ID = b.Itinerary_ID " +
			"INNER JOIN Itinerary_Type_Details c on  c.Itinerary_Type_ID = a.Itinerary_Type_ID " +
			"INNER JOIN Package_Details d on  d.Itinerary_ID = a.Itinerary_ID; ";*/
	System.out.println(sql);
	
		
	resultSet = statement.executeQuery(sql);
    int recordindex=1;
	while(resultSet.next()){
	   int i=0;
		resultSet.absolute(recordindex);
		//String s=resultSet.getString("Food_Cuisine");
		//String[] result = s.split(",");

//while(i<result.length){
		
%>






<p> Food Cuisine:<%=resultSet.getString("Food_Cuisine") %></p>
<p> Food Vendor Name:<%=resultSet.getString("Food_Vendor_Name")%></p>
<br><br><br>

<%
recordindex++;
	}
} catch(Exception e)
{
	e.printStackTrace();
}
%>
</table>
</body>
</html>