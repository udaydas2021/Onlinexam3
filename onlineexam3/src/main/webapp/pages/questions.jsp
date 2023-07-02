<html>
<head>

<link href="/css/common.css" rel="stylesheet">

</head>


<style>

    div
	{
		margin-left:300px;
	}
	
	textarea
	{
		border:none;
		font-size: 30px;
		color:white;
		background-color:black;
		padding-top:20px;
		box-sizing:border-box; 
	}
	
	body
		{
			background-color: grey;
			//background-image: url('images/1.jpg');
			//background-repeat:no-repeat;
			
		}
		
	#errorMessage
	{
		color:red;
		font-size: 30px;
		font-style: italic;
		margin-left:500px;
	}
	
	span
	{
		color:black;
		font-size: 20px;
		font-style: italic;
		
	}
	
	.b1
	{
			background-color: grey;
			padding :10px;
			font-size:15px;	  
	}

/*	
.btn
{
			padding:15px 30px;
			background-color: yellow;
			color:red;
			
}
	
*/
</style>
<script>

var xmlhttp;

function sendData()
{
	xmlhttp=new XMLHttpRequest();
	
	var qno=document.questionForm.qno.value;
	var submittedAnswer=document.questionForm.option.value;
	var question=document.questionForm.question.value;
	
	var data="qno="+qno+"&submittedAnswer="+submittedAnswer+"&question="+question;
	alert(data);
	xmlhttp.open("get","saveResponse?"+data);
	xmlhttp.send();
	
}

function getRemainingTime()
{
	xmlhttp=new XMLHttpRequest();

	xmlhttp.onload=showtime;
	
	xmlhttp.open("get","getRemainingTime",true);

	xmlhttp.send();
	
}

function showtime()
{
	var totalSeconds=xmlhttp.responseText;
	var min=Math.floor(totalSeconds/60).toString().padStart(2,'0');
	var sec=(totalSeconds-min*60).toString().padStart(2,'0');
	
	document.getElementById("show").value=min+":"+sec;

	if(xmlhttp.responseText=='0')
	{
		alert("time up .. ");
		location.href="endexam";
	}
}


function changeColor()
{
	var allAnswers=document.getElementsByTagName("span");
	var allRadioButtons=document.getElementsByName("option");	
	var previousAnswer=document.questionForm.previousAnswer.value;
	
	for(var i=0;i<allAnswers.length;i++)
	{
			if(allAnswers[i].innerText==previousAnswer)
			{
				allAnswers[i].style.color="red";
				allRadioButtons[i].checked=true;
			}
	}
}

setInterval(getRemainingTime,1000);

</script>

<!--  ${listOfQuestions} -->

<!-- var qno=document.questionForm.qno.value -->



<body onload="changeColor()">

welcome ${username}
<div>

<form name="questionForm">
		
	remaining time <input  style="border:none" type="text" id="show" value="" class="b1"><br><br>
		
	<input  style="border:none" type="text" name="qno" value="${question.qno}" class="b1"><br><br>
	
	<textarea  rows=3 cols=50 name="question" readonly> ${question.question} </textarea><br><br>
		
	<input  type="radio" name="option" value="${question.option1}" onclick="sendData()">  <span> ${question.option1} </span><br><br>
	
	<input  type="radio" name="option" value="${question.option2}" onclick="sendData()">  <span> ${question.option2} </span> <br><br>
		
	<input  type="radio" name="option" value="${question.option3}" onclick="sendData()"> <span> ${question.option3} </span> <br><br>
	
	<input  type="radio" name="option" value="${question.option4}" onclick="sendData()"> <span> ${question.option4} </span> <br><br>
		
	<input type="submit" value="next" formaction="next" class="btn" id="next">
	<input  type="submit" value="previous" formaction="previous" class="btn">
	<input  type="submit" value="end exam" formaction="endexam" class="btn">

<br><br>

<input  style="border:none;display:none" type="text" name="previousAnswer" value="${previousAnswer}"><br><br>

</form>
</div>
</body>

 <span id="errorMessage" class="b1"> ${message} </span><br>
