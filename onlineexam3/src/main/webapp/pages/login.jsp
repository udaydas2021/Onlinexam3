<html>
<head>

<link href="/css/common.css" rel="stylesheet">

<style>
/*
.btn
{
			padding:15px 30px;
			background-color: yellow;
			color:red;
			font-size: 20px;
			
}
*/
		body
		{
			background-color:grey;
		}	
		
		#div2
		{
			text-align:center;
			margin-top:100px;
			border:2px solid blue;
			margin-left:300px;
			padding:30px;
			width:500px;
		}	

		
		.c1
		{
		
				border:2px solid black;
	border-radius:10px;
	padding:20px;
			
		}
</style>

</head>

<br><br>

<body>

<jsp:include page="menu.jsp"></jsp:include>
<div id="div2">
<form>
	
	<input size=45 name="username" type=text placeholder="enter username" class="c1" required><br><br>
	
	<input size=45 name="password" type=password placeholder="enter password" class="c1" required><br><br>
	
	<input type=submit value="login" formmethod="post" formaction="validate" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
	
	<input type=submit value="register" formaction="showregister" class="btn">
</form>

</div>

</body>
</html>

${message}