<head>

<script>
             
var images = ["Image1","Image2","Image3","Image4"];

var currentIndex = -1;
 
function changeImage() {

	var img = document.getElementById("i1");
	 

    currentIndex++;

    if (currentIndex == images.length)
        currentIndex = 0;
     
   
    img.src = "images/"+images[currentIndex] + ".jpg";
}

setInterval(changeImage,3000);

</script>

<style>

body
{
	background-color: pink;
}

table,th,td
{
	border : 1px solid green;
	//border-collapse:collapse;
	
}

td
{
	color:blue;
	
}

th
{
	color:red;
}

th,td
{
	padding:10px;
	text-align:center;
}

table
{
	margin-left : 300px;
}

div
{
	text-align:center;
}

img
{
	border-radius:70%;
}

h1
{
	color:green;
}

</style>

</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<br><br>
<h1> your score is ${finalscore}</h1>
<br><br>
<table>
		<tr>
			<th>qno</th>
			<th>question</th>
			<th>submittedAnswer</th>
			<th>OriginalAnswer</th>
		</tr>
		
		<c:forEach var="answer" items="${allAnswers}">
			
				<tr>
						<td>${answer.qno}</td>
						<td>${answer.question}</td>
						<td>${answer.submittedAnswer}</td>
						<td>${answer.originalAnswer}</td>
				</tr>
					
		</c:forEach>
		
</table>


<h1>Want to attempt exam again?</h1>

<a href="/" style="text-decoration:none;font-size:30px;">Go to Login</a>
 <!-- 
 href attribute needs url 
text-decoration's none value remove underline from link
 -->

<div>
	<img src="images/Image4.jpg" width=300 height=300 id="i1">
</div>