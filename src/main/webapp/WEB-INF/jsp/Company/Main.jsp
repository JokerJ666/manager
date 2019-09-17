<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <title id="title"></title>
    <script src="<%=path %>/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="<%=path %>/static/bootstrap/js/bootstrap.js"></script>
    <script src="<%=path %>/static/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=path %>/static/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="<%=path %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path %>/static/css/bootstrap-datetimepicker.css" rel="stylesheet">
</head>
<body>
<button id="logout">注销</button>
<script type="text/javascript">
    // $(function () {
    //     document.addEventListener("webkitvisibilitychange", onVisibilityChanged, false);
    // });

    $("#logout").click(function () {
        $.ajax({
            url:"${ctx}/logout",
            type:"GET",
            success:function (result) {
                if(result.code=="200"){
                    window.location = '${ctx}/login';
                }
            }
        })
    });

    <%--function onVisibilityChanged(event){--%>
    <%--    var hidden = event.target.webkitHidden;--%>
    <%--    console.log(Session.get("user"));--%>
    <%--    if(!hidden)--%>
    <%--        if (Session.get("user") === null)--%>
    <%--            window.location = '${ctx}/login';--%>
    <%--}--%>
</script>

<c:if test="${page=='company'}">
    <jsp:include page="ListCompany.jsp"/>
</c:if>
<c:if test="${page=='handel'}">
    <jsp:include page="HandelCompany.jsp"/>
</c:if>
</body>
</html>
