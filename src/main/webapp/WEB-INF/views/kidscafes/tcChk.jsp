<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<span id ="tcRst"></span>
<script>

var dayOfWeek = ${dayOfWeek};
var max;
if (dayOfWeek == 7 || dayOfWeek == 6){
			max = ${schedule.s_hticket};
			}else{
			max = ${schedule.s_wticket};
			}
var count = ${rsvCount};
var rst = max - count;
document.getElementById("tcRst").innerHTML = rst;

</script>
</body>
</html>