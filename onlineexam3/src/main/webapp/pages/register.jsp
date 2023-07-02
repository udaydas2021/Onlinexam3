<head>
	<style>
	
		#div2
		{
			text-align:center;
			border:3px solid black;
			width:500px;
			margin:auto;
			padding-top:100px;
			padding-bottom:50px;
			box-sizing:border-box;
		}
		input
		{
			padding:15px;
		}
		
		input[type="submit"]
		{
			padding:15px 20px;
			color:red;
			background-color:yellow;
			border-radius:10%;
		}
	</style>
	
	<script>
			function change(input)
			{
		       input.style.color="white";
		       input.style.background="black";
	         }
   </script>
   
</head>

<body>

<jsp:include page="menu.jsp"></jsp:include>

<div id="div2">
<form>
	
	<input name="username" type=text placeholder="enter username" onfocus="change(this)"><br><br>
	
	<input name="password" type=password placeholder="enter password" onfocus="change(this)"><br><br>
	
	<input type="text" name="mobilenumber" placeholder="Enter mobilenumber" onfocus="change(this)"><br><br>
	
	<input type=email name="emailid" placeholder="Enter emailId" onfocus="change(this)"><br><br>
	
	<input type=date name="dateofbirth" placeholder="Enter DateOfBirth" onfocus="change(this)"><br><br>
	
		
	<input type=submit value="register" formaction="saveuserdata">
	
</form>
</div>
</body>