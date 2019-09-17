<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="panel panel-default" style="width: 380px;margin: 0 auto;">
    <div class="panel-body">
        <ul class="list-group">
            <li class="list-group-item">
                <h3 style="margin: 0 auto;height: 38px;">后台管理系统登入</h3></li>
            <li class="list-group-item">
                <form id="login_from">
                    <div class="form-group" id="username_input">
                        <label for="usernameInput">账号:</label>
                        <input type="text" name="username" class="form-control" id="usernameInput" placeholder="请输入账号...">
                    </div>
                    <div class="form-group" id="password_input">
                        <label for="passwordInput">密码:</label>
                        <input type="password" name="password" class="form-control" id="passwordInput" placeholder="请输入密码...">
                    </div>
                </form>
                <button id="login_btn" class="btn btn-primary" style="float: right;width: 72px;">登入</button>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        document.title="后台管理系统登入";
    });

    $("#login_btn").click(function () {
        $.ajax({
            url:"${ctx}/login",
            type:"POST",
            data:$("#login_from").serialize(),
            success:function (result) {
                if(result.code == "200"){
                    window.location="${ctx}/company";
                }else{
                    alert("账户或者密码错误！");
                }
            }
        })
    });

</script>
