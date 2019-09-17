<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>所有用户</title>
    <script src="<%=path %>/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="<%=path %>/static/bootstrap/js/bootstrap.js"></script>
    <link href="<%=path %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="Login.jsp"/>
<%--<jsp:include page="Register.jsp"/>--%>

</body>
</html>
