<%@page import="com.srccodes.service.ServiceImpl"%>
<jsp:useBean id="issue_id" class="com.srccodes.service.ServiceBean"></jsp:useBean>
<jsp:setProperty property="*" name="issue_id"/>

<%
int i=ServiceImpl.update(issue_id);
response.sendRedirect("viewusers.jsp");
%>