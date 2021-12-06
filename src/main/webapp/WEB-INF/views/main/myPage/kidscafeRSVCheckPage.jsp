<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KidsCafe Reservation Check Page</title>
</head>
<body>
	<div id="rsvlist">
			<table class="table" style="font-family: 'Noto Sans KR', sans-serif; font-size: 73%;  text-align: center;">
				<thead>
					<tr>
						<td style="vertical-align: middle;">STATE</td>
						<td style="vertical-align: middle;">RSV NUMBER</td>
						<td style="vertical-align: middle;">COMMENT</td>
						<td style="vertical-align: middle;">USER</td>
						<td style="vertical-align: middle;">TIME</td>
						<td style="vertical-align: middle;">COUNT(KIDS)</td>
					</tr>
				</thead>
				<tbody >
					<c:forEach items="${cafeRsvList}" var="rsv">
						<tr>
						<c:if test="${rsv.rsv_state == 0}">
							<td style="color : #007bff;  vertical-align: middle;" >예약중</td>
						</c:if>
						<c:if test="${rsv.rsv_state == 1}">
							<td style="font-weight: bold;  vertical-align: middle;">방문확정</td>
						</c:if>
						<c:if test="${rsv.rsv_state == 2}">
							<td style="text-decoration: line-through; vertical-align: middle;">예약취소</td>
						</c:if>
							<td style="vertical-align: middle;">${rsv.rsv_id}</td>
							<td style="vertical-align: middle;">${rsv.rsv_comment}</td>
							<td style="vertical-align: middle;">${rsv.user_name}</td>
							<td style="vertical-align: middle;">${rsv.s_time}</td>
							<td style="vertical-align: middle;">${rsv.count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>