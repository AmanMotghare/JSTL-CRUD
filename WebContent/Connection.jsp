<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<sql:setDataSource 
var="db" scope="session"
driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/projectjstl"
user="root"
password="abc123"/>

Connection Success
