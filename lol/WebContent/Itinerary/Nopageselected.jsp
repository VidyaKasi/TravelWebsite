<!DOCTYPE html>
<html>
<body>

<p><a id="myAnchor" href="ItinearyDetails.html">www.microsoft.com</a></p>

<p>Click the button to change the value of the href attribute of the link above to "www.cnn.com".</p>

<button onclick="myFunction(1)">Try it</button>

<p id="demo"></p>

<script>
function myFunction(recordindex) {
	if(recordindex==1)
		{
  document.getElementById("myAnchor").href = "Login.jsp";
  document.getElementById("demo").innerHTML = "The link above now goes to www.cnn.com.";
		}
	else{
		
		 document.getElementById("myAnchor").href = "justgo.html";
		 document.getElementById("demo").innerHTML = "The link is to you know what?!";
		
	}
}
</script>

</body>
</html>