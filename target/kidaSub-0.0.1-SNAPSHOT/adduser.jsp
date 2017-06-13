<%@page import="com.srccodes.service.ServiceImpl"%>
<jsp:useBean id="u" class="com.srccodes.service.ServiceBean"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=ServiceImpl.save(u);
if(i>0){
response.sendRedirect("adduser-success.jsp");
}else{
response.sendRedirect("adduser-error.jsp");
}
%>