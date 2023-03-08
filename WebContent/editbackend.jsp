<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Connection.jsp"></jsp:include>

<sql:update dataSource="${db}" var="status" >
	UPDATE  emp_details SET name=?,email=?,pass=?,phone=?,address=? where id=?
	
	<sql:param value="${param.Name}"/>
	<sql:param value="${param.Email}"/>
	<sql:param value="${param.Password}"/>
	<sql:param value="${param.phone}"/>
	<sql:param value="${param.address}"/>
	<sql:param value="${param.id}"/>

</sql:update>

<c:if test="${status>0}">
<jsp:forward page="edit.jsp">
<jsp:param name="updatecount" value="${status}" />  
</jsp:forward>
</c:if>
</body>
