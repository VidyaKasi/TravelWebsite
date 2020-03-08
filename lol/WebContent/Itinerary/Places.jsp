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


<p> Locations </p>

<%
try{
	//Getting a connection object for the tour schema db with the username and password
	connection=DriverManager.getConnection(connectionUrl+dbName,userId, password);
	statement=connection.createStatement();
	//String sql="Select Visiting_Locations from Itinerary_Details a "+
	//"INNER JOIN Country_Details b on  a.Itinerary_ID = b.Itinerary_ID";
	
	String sql="Select Visiting_Locations from Itinerary_Details a "+
	"INNER JOIN Country_Details b on  a.Itinerary_ID = b.Itinerary_ID "+
	"where Country_Name="+ "\"" + "New Zealand" + "\"";
	
	System.out.println(sql);
	
		
	resultSet = statement.executeQuery(sql);
    int recordindex=1;
	while(resultSet.next()){
	   int i=0;
		resultSet.absolute(recordindex);
		String s=resultSet.getString("Visiting_Locations");
		String[] result = s.split(",");

while(i<result.length){
		
%>




<%=result[i] %>
<br><br><br>

<%



i++;
	}

%>

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