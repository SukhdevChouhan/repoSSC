<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
</head>
<body>

	<%@page import="com.srccodes.service.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 	<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%> --%>
	<h1>Task List</h1>

	<%
		List<ServiceBean> list = ServiceImpl.getAllRecords();
		request.setAttribute("list", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Task ID</th>
			<th>Issue Name</th>
			<th>Report Date</th>
			<th>Updated</th>
			<th>Heading</th>
			<th>Description</th>
			<th>Status</th>
			<th>Linked with</th>
			<th>Other Details</th>
			<th>Closed date</th>
			<th>Type</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getIssue_id()}</td>
				<td>${u.getGetIssue_name()}</td>
				<td>${u.getIssue_report_date()}</td>
				<td>${u.getIssue_update_date()}</td>
				<td>${u.getIssue_heading()}</td>
				<td>${u.getIssue_description()}</td>
				<td>${u.getIssue_status()}</td>
				<td>${u.getIssue_linked_with()}</td>
				<td>${u.getIssue_others()}</td>
				<td>${u.getIssue_closed()}</td>
				<td>${u.getIssue_type())}</td>
				<td><a href="editform.jsp?id=${u.getIssue_id()}">Edit</a></td>
				<td><a href="deleteuser.jsp?id=${u.getIssue_id()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="adduserform.jsp">Add New Issue</a>

</body>
</html>