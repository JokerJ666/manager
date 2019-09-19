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
<div style="width: 100%;height:60px;background-color: #EBEBEBFF" >
<ul id="userControl" class="nav pull-right">
<li id="userInfo" style="padding-top: 20px">
    <a data-toggle="dropdown" href="#" title="个人信息" class="user-style">您好, ${ sessionScope.user.name}&nbsp;<span id="notifyNum" class="label label-info hide"></span><span><a href="#" title="退出登录" id="logout" class="logout-type">退出</a></span>
    </a>
    <ul class="dropdown-menu">
        <%--<li><a href="${ctx}/userForm" target="mainFrame" id="personInfo"><i class="icon-user"></i>&nbsp; 个人信息</a></li>--%>
            <li><a href="${ctx}/userForm" target="mainFrame" id="personInfo"><i class="icon-user"></i>&nbsp; 个人信息</a></li>
        <li><a href="" target="mainFrame" id="updatePwd"><i class="icon-lock"></i>&nbsp;  修改密码</a></li>
    </ul>
</li>

</ul>
</div>
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
<style>
    .nav>li>a {
        position: relative;
        display: inline;
    }

    .user-style {
        color: #555555;
        line-height: 10px;
    }

    .logout-type {
        color: crimson;
    }
</style>

<c:if test="${page=='company'}">
    <jsp:include page="ListCompany.jsp"/>
</c:if>
<c:if test="${page=='handel'}">
    <jsp:include page="HandelCompany.jsp"/>
</c:if>
<c:if test="${page=='userForm'}">
    <jsp:include page="../User/userForm.jsp"/>
</c:if>
</body>
</html>
