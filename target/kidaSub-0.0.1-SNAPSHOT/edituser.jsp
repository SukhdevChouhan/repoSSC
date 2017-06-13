<%@page import="com.srccodes.service.ServiceImpl"%>
<jsp:useBean id="u" class="com.srccodes.service.ServiceBean"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=ServiceImpl.update(u);
response.sendRedirect("viewusers.jsp");
%>