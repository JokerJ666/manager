<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="panel panel-default" style="width: 380px;margin: 0 auto;">
    <div class="panel-body">
        <ul class="list-group">
            <li class="list-group-item">
                <h3 style="margin: 0 auto;height: 38px;">后台用户注册</h3></li>
            <li class="list-group-item">
                <form id="login_from">
                    <div class="form-group" id="username_input">
                        <label for="usernameInput">*账号:</label>
                        <input type="text" name="username" class="form-control" id="usernameInput" placeholder="请输入账号...">
                    </div>
                    <div class="form-group" id="password_input">
                        <label for="passwordInput">*密码:</label>
                        <input type="password" name="password" class="form-control" id="passwordInput" placeholder="请输入密码...">
                    </div>
                    <div class="form-group" id="passwordSure_input">
                        <label for="passwordSureInput">*重复密码:</label>
                        <input type="password" class="form-control" id="passwordSureInput" placeholder="请重复您的密码...">
                    </div>
                    <div class="form-group" id="name_input">
                        <label for="nameInput">你的名字是:</label>
                        <input type="text" name="name" class="form-control" id="nameInput" placeholder="请输入您的姓名！">
                    </div>
                    <div class="form-group" id="key_input">
                        <label for="keyInput">*注册密钥:</label>
                        <input type="password" name="key" class="form-control" id="keyInput" placeholder="只有内部人员才能注册！">
                    </div>
                </form>
                <button id="login_btn" class="btn btn-primary" style="float: right;width: 72px;">注册</button>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        document.title="后台管理系统注册";
    });

    $("#usernameInput").onblur(function () {
        var username = $(this).value();
        $.ajax({
            url:"${ctx}/login/register/username="+ username,
            type:"GET",
            success:function (result) {
                if(result.code == "100"){
                    $("#username_input").addClass("has-error");
                }else{
                    $("#username_input").removeClass("has-error");
                }
            }
        });
    });

    //确认密码相同
    $("#passwordSureInput").onblur(function () {
        if($("#passwordSureInput").value() != $("#passwordInput").value()){
            $("#passwordSure_input").addClass("has-error");
        }else{
            $("#passwordSure_input").removeClass("has-error");
        }
    });

    //验证注册密钥
    $("#keyInput").onblur(function () {
        SureKey();
    });

    function SureKey(){
        $.ajax({
            url:"${ctx}/login/register/key",
            type:"POST",
            data:{key:$("#keyInput").value()},
            success:function (result) {
                if(result.code == "100"){
                    $("#key_input").addClass("has-error");
                }else{
                    $("#key_input").removeClass("has-error");
                }
            }
        });
    }

    $("#login_btn").click(function () {
        $.ajax({
            url:"${ctx}/login/register/save",
            type:"POST",
            data:$("#login_from").serialize(),
            success:function (result) {
                if(result.code == "200"){
                    alert("注册成功");
                }else{
                    alert("注册失败");
                }
            }
        })
    })


</script>