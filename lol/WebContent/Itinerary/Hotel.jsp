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




<%
try{
	//Getting a connection object for the tour schema db with the username and password
	connection=DriverManager.getConnection(connectionUrl+dbName,userId, password);
	statement=connection.createStatement();
	//String sql="Select Visiting_Locations from Itinerary_Details a "+
	//"INNER JOIN Country_Details b on  a.Itinerary_ID = b.Itinerary_ID";
	
	String sql="Select Hotel_Rooms,Hotel_Star from Itinerary_Details a "+
	"INNER JOIN Hotel_Details b on a.Hotel_ID = b.Hotel_ID "+
	"INNER JOIN country_details c on a.Itinerary_ID=c.Itinerary_ID "+
	"where country_name=" + "\"" + "New Zealand" + "\"";
	
	/*String sql="Select Flight_Company, Inflight_Meals from Itinerary_Details a "+
	"INNER JOIN Flight_Details b on  a.Flight_ID = b.Flight_ID "+
	"INNER JOIN country_details c on a.Itinerary_ID=c.Itinerary_ID "+
	"where Country_Name="+ "\"" + "New Zealand" + "\"";*/
	
	
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






<p> Hotel Rooms:<%=resultSet.getString("Hotel_Rooms") %>
<p> Stars:<%=resultSet.getString("Hotel_Star")%>
<br><br><br>

<%
recordindex++;
	}
} catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>