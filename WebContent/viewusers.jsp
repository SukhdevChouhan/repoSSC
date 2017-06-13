<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
</head>
<body>

	<%@page import="com.srccodes.service.*,java.util.*"%>
<%-- 	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
	 <%@page import ="java.util.Enumeration"%>
	<h1>Task List</h1>

	<%
		Enumeration<ServiceBean> list = ServiceImpl.getAllRecords();
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
		<%
			Enumeration<ServiceBean> itr = (Enumeration) request.getAttribute("list");
			while (itr.hasMoreElements()) {
				ServiceBean details = (ServiceBean) itr.nextElement();
		%>


		<tr>
			<td><%=details.getIssue_id() %></td>
			<td><%=details.getGetIssue_name()%></td>
			<td><%=details.getIssue_report_date()%></td>
			<td><%=details.getIssue_update_date()%></td>
			<td><%=details.getIssue_heading()%></td>
			<td><%=details.getIssue_description()%></td>
			<td><%=details.getIssue_status()%></td>
			<td><%=details.getIssue_linked_with()%></td>
			<td><%=details.getIssue_others()%></td>
			<td><%=details.getIssue_closed()%></td>
			<td><%=details.getIssue_type()%></td>
			<td><a href="editform.jsp?issue_id=<%=details.getIssue_id() %>">Edit</a></td>
			<td><a href="deleteuser.jsp?issue_id=<%=details.getIssue_id() %>">Delete</a></td>
		</tr>

		<%
			}
		%>
	</table>
	<br />
	<a href="adduserform.jsp">Add New Issue</a>

</body>
</html>