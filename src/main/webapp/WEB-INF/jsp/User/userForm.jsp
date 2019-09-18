<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="panel panel-default" style="width: 380px;margin: 0 auto;margin-top: 100px">
    <div class="panel-body">
        <ul class="list-group">
            <li class="list-group-item">
                <h3 style="margin: 0 auto;height: 38px;">用户管理</h3></li>
            <li class="list-group-item">
                <form id="login_from">
                    <div class="form-group" id="username_input">
                        <label for="usernameInput">*账号:</label>
                        <input type="text" name="username" class="form-control" id="usernameInput" placeholder="请输入账号...">
                    </div>
                    <div class="form-group" id="password_input">
                        <label for="passwordInput">*密码:</label>
                        <input type="password" name="password" class="form-control" id="passwordInput">
                    </div>
                    <div class="form-group" id="passwordSure_input">
                        <label for="passwordSureInput">*重复密码:</label>
                        <input type="password" class="form-control" id="passwordSureInput">
                    </div>
                    <div class="form-group" id="name_input">
                        <label for="nameInput">姓名:</label>
                        <input type="text" name="name" class="form-control" id="nameInput">
                    </div>
                    <div class="form-group" id="privilege_input">
                        <label>权限:</label>
                        <div>
                            <input type="radio" value="1" checked="checked" name="privilege" >管理员
                            <input type="radio" value="2" name="privilege">普通用户
                        </div>

                    </div>

                    <div class="form-group" id="company_input">
                        <label for="nameInput">所属公司:</label>
                        <select name="company" id="companyId" style="width: 95%">
                            <option value="0">==请选择==</option>
                            <c:forEach items="${companies}" var="var" varStatus="vs">
                                <option value="${var.id}"> ${var.companyName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
                <button id="save_btn" class="btn btn-primary" style="float: right;width: 72px;margin-top: 20px">保存用户</button>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        document.title="后台管理系统注册";
    });

    $("#save_btn").click(function () {
        var data = $("#login_from").serialize();
        $.ajax({
            url:"${ctx}/register/save",
            type:"POST",
            data:data,
            success:function (result) {
                if(result.code=="200") {
                    alert("保存成功！");
                }
                else
                    alert("保存失败!");
            }
        })
    });


</script>