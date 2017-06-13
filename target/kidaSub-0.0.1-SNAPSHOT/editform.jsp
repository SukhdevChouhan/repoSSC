<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>
<%@page import="com.srccodes.service.*"%>

<%
String issue_id=request.getParameter("issue_id");
ServiceBean serviceBean=ServiceImpl.getRecordById(issue_id);
%>

<h1>Edit Task</h1>
<form action="edituser.jsp" method="post">
<input type="hidden" name="issue_id" value="<%=serviceBean.getIssue_id() %>"/>
<table>
<tr><td>Issue Id:</td><td><input type="text" name="issue_id" value="<%= serviceBean.getIssue_id()%>"/></td></tr>
<tr><td>Issue Name:</td><td><input type="text" name="getIssue_name" value="<%= serviceBean.getGetIssue_name() %>"/></td></tr>
<tr><td>Issue Report Date:</td><td><input type="text" name="issue_report_date" value="<%= serviceBean.getIssue_report_date()%>"/></td></tr>
<tr><td>Issue Update Date:</td><td><input type="text" name="issue_update_date" value="<%= serviceBean.getIssue_update_date()%>"/></td></tr>
<tr><td>Issue Heading:</td><td><input type="text" name="issue_heading" value="<%=serviceBean.getIssue_heading()%>"/></td></tr>
<tr><td>Issue Description:</td><td><input type="text" name="issue_description" value="<%=serviceBean.getIssue_description()%>"/></td></tr>
<tr><td>Issue Status:</td><td>
<select name="issue_status">
<option>active</option>
<option>completed</option>
<option>defer</option>
<option>working_as_designed</option>
<option>submitted</option>
<option>pause</option>
</select>
</td></tr>
<tr><td>Issue Linked with:</td><td><input type="text" name="issue_linked_with" value="<%=serviceBean.getIssue_linked_with() %>"/></td></tr>
<tr><td>Other information:</td><td><input type="text" name="issue_others" value="<%= serviceBean.getIssue_others() %>"/></td></tr>
<tr><td>Issue Closed Date:</td><td><input type="text" name="issue_closed" value="<%=serviceBean.getIssue_closed() %>"/></td></tr>
<tr><td>Issue Type:</td><td>
<select name="issue_type" style="width:155px">
<option>epic</option>
<option>story</option>
<option>sub_story</option>
<option>task</option>
<option>sub_task</option>
<option>bug</option>
</select>
</td></tr>
<tr><td colspan="2"><input type="submit" value="Edit User"/></td></tr>
</table>
</form>

</body>
</html>