<html>
<head>

	<style>
	
		ul
		{
			line-height: 30px;
			border:1px solid grey;
			width:50px;
			
		}
		
	</style>
</head>

<body onload="addListItems()">

<ul id="list1">
	<li>hello</li>
</ul>

</body>

<script>
	
		function addListItems()
		{

		//document.getElementById("list1").innerHTML="";

		var cars = [1,2,3,4];

		var text = "";
		var i;

		for (i = 0; i < cars.length; i++) 
		{
			function1(cars[i]);
	    
		}


		var allitems=document.getElementsByTagName("li")
		
		for(var i=0;i<allitems.length;i++)
		{
			allitems[i].addEventListener("click",function(){
						this.style.color="red";
						alert(this.innerHTML);
				});
		}
		
	}

		function function1(listText) {
		  var ul = document.getElementById("list1");
		  var li = document.createElement("li");
		  li.appendChild(document.createTextNode(listText));
		  ul.appendChild(li);
		}

		function display()
		{
			alert("clicked ");
		}
			
		
</script>
	

</html>