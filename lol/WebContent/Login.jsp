<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
*:focus {
    outline: none;
}
#email, #password {
  outline: 0;
  border-width: 0 0 2px;
  border-color: #F55A66;
  width:450px;
  
 
}
#email:focus ,#password:focus {
  border-color: green;
}

.buttons{
align:center;
padding-left:600px;
padding-right:500px;
}


.form-content{
margin-left:center;
padding-left:550px;
padding-right:550px;
}

</style>


<script> 
function validate()
{ 
 var Cust_Email = document.form.Cust_Email.value; 
 var Cust_Password = document.form.Cust_Password.value;
 
 if (Cust_Email==null || Cust_Email=="")
 { 
 alert("Email cannot be blank"); 
 return false; 
 }
 else if(Cust_Password==null || Cust_Password=="")
 { 
 alert("Password cannot be blank"); 
 return false; 
 } 
}
</script> 
</head>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<body>
<br>
<h1 style="text-align:center;color: #F55A66;background-color:white;"> AtoZTourism.com </h1>

<br>
            

            <h5 style="text-align:center;color: #F55A66;">Sign up</h5><br>
            <div class="form-content">
            <form name="form" action="LoginServlet" method="post" onsubmit="return validate()">
                                <label  for="inputEmail" style="text-align:center;color: #F55A66;">Email address</label><br>
                <input  type="email" id="email" name="Cust_Email" ><br><br>

                <label for="inputPassword" style="text-align:center;color: #F55A66;">Password</label><br>

                <input  type="password" id="password" name="Cust_Password" style="color: #F55A66;">
              <br>
              <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
 : request.getAttribute("errMessage")%></span>
              <br><br><br>
                              <button class="btn btn-lg btn-primary btn-block text-uppercase"  type="submit" value="Login">Login</button>
             <input class="btn btn-lg btn-primary btn-block text-uppercase" type="reset" style="background-color:orange;color:white;" value="Reset">
              <input type="button" class="btn btn-lg btn-facebook btn-block text-uppercase"  style="background-color:green;color:white;" value="Register" onclick="document.forms[0].action = 'Register.jsp';this.form.submit();" ><i class="fab fa-facebook-f mr-2"></i></button>
              
  
  </div>
  
  
  </form>
</body>
</html>