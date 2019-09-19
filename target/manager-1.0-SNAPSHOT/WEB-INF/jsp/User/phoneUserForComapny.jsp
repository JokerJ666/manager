<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .pagination li{cursor: pointer;}

    .col-type {
        padding-top: 7px;
        margin-bottom: 0;
        text-align: right;
    }
</style>

<div class="modal fade" id="editPhoneUserModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改手机用户信息</h4>
            </div>
            <div class="modal-body">
                <form id="editPhoneUser_from" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="edit_note">备注:</label>
                        <div class="col-sm-8">
                            <input name="note" class="form-control" id="edit_note">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="edit_number">串号:</label>
                        <div class="col-sm-8">
                            <input name="userKey" class="form-control" id="edit_number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="edit_number">常用人姓名:</label>
                        <div class="col-sm-8">
                            <input name="usedName" class="form-control" id="edit_usedName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="save_editUser" data-dismiss="modal">保存用户</button>
            </div>
        </div>
    </div>
</div>


<%--添加用户模态框--%>
<div class="modal fade" id="addPhoneUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增用户</h4>
            </div>
            <div class="modal-body">
                <form id="addPhoneUser_from" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="Add_userKey">串号:</label>
                        <div class="col-sm-8">
                            <input name="userKey" class="form-control" id="Add_userKey">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="Add_userNote">备注:</label>
                        <div class="col-sm-8">
                            <input name="note" class="form-control" id="Add_userNote">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="savePhoneUser"  data-dismiss="modal">保存用户</button>
            </div>
        </div>
    </div>
</div>


<%--查看用户模态框--%>
<div class="modal fade" id="showPhoneUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">客户登入记录</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped" id="Log_UserLogin">
                    <thead>
                    <tr>
                        <td>操作时间</td>
                        <td>用户名</td>
                        <td>姓名</td>
                        <td>手机号码</td>
                        <td>所属分店</td>
                        <td>操作类型</td>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>



<div>
    <%--  操作行  --%>
    <div class="row">
        <div class="col-md-10"></div>
        <button type="button" class="btn btn-warning" id="addPhoneUser_btn">新增手机用户</button>
    </div>
    <%--  显示行  --%>
    <div class="row">
        <div id="UserList" class="col-md-12">
            <table class="table table-hover" id="Show_UserPhone_Table">
                <thead>
                <tr>
                    <td>编号</td>
                    <td>串号</td>
                    <td>状态</td>
                    <td>常用人姓名</td>
                    <td>备注</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--  分页行  --%>
    <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-2"></div>
        <div class="col-md-4" id="pageNav"></div>
    </div>
</div>


<script type="text/javascript">

    var nowPage;
    var lastPage;
    var pageSize;
    var pageTotal;

    $(function () {
        to_page(1);
    });

    //分页页面跳转
    function to_page(page) {
        nowPage=page;
        $.ajax({
            url:"${ctx}/phoneUser/forCompany?page="+page+"&id="+${id},
            type:"GET",
            success:function (result) {
                pageSize=result.map.pageInfo.size;
                pageTotal=result.map.pageInfo.total;
                lastPage=result.map.pageInfo.lastPage;
                console.log(result);
                buildPhoneUserTable(result);
                buildPhone_PageNav(result);
            }
        });
    }
    //创建用户列表
    function buildPhoneUserTable(result) {
        $("#Show_UserPhone_Table tbody").empty();
        var UserInfo = result.map.pageInfo.list;
        $.each(UserInfo,function (index,user) {
            var id=$("<td></td>").append(result.map.pageInfo.startRow+index);
            var userKey=$("<td></td>").append(user.userKey);
            var userNote=$("<td></td>").append(user.note);
            var permission=$("<td></td>").append(user.permission);
            var usedName=$("<td></td>").append(user.usedName);

            var showBtn=$("<button></button>").addClass("btn btn-info btn-sm show_btn").append("登入记录");
            showBtn.click(function () {
                showPhoneUserById(user.id);
            });

            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append("编辑");
            editBtn.click(function () {
                editPhoneUserById(user.id, user.userKey, user.note);
            });

            var chanePermissionBtn;
            if(user.permission == "正常"){
                chanePermissionBtn = $("<button></button>").addClass("btn btn-warning btn-sm chaneP_btn").append("冻结");
            }else{
                chanePermissionBtn = $("<button></button>").addClass("btn btn-success btn-sm chaneP_btn").append("启用");
            }
            chanePermissionBtn.click(function () {
                chancePhoneUserPermission(user.id,user.userKey,user.permission);
            });

            var deleteBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append("删除");
            deleteBtn.click(function () {
                deletePhoneUser(user.id,user.userKey);
            });
            var Btns=$("<td></td>").append(showBtn).append(editBtn).append(chanePermissionBtn).append(deleteBtn);
            $("<tr></tr>").append(id).append(userKey)
                .append(permission).append(usedName).append(userNote).append(Btns)
                .appendTo("#Show_UserPhone_Table tbody");
        })
    }

    //创建分页
    function buildPhone_PageNav(result) {
        $("#pageNav").empty();
        var pageInfo = result.map.pageInfo;

        var nav=$("<nav></nav>").attr("aria-label","Page navigation");
        var ul=$("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var perPageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            perPageLi.addClass("disabled");
        }else{
            firstPageLi.click(function () {
                to_page(1);
            });
            perPageLi.click(function () {
                to_page(pageInfo.prePage)
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if(pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                to_page(pageInfo.nextPage);
            });
            lastPageLi.click(function () {
                to_page(pageInfo.lastPage)
            });
        }
        ul.append(firstPageLi).append(perPageLi);

        $.each(pageInfo.navigatepageNums,function (index,item) {
            var numLi= $("<li></li>").append($("<a></a>").append(item));
            if(pageInfo.pageNum == item) numLi.addClass("active");
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        nav.append(ul).appendTo($("#pageNav"));
    }

    //修改用户状态
    function chancePhoneUserPermission(id,userKey,permission){
        var str="启动";
        if(permission=="正常"){
            str="冻结";
        }
        if(confirm("当前操作的用户为:【"+userKey+"】\n确认"+str+"该用户吗？")){
            $.ajax({
                url:"${ctx}/phoneUser/permissionChance",
                type:"POST",
                data:{id:id,userPermission:permission},
                success:function (result) {
                    to_page(nowPage);
                }
            })
        }

    }

    //查看用户模态框显示
    function showPhoneUserById(id) {
        getPhoneLoginLogs(id);
        $("#showPhoneUserModal").modal({
            backdrop:"static"
        });
    }

    //用户登陆记录
    function getPhoneLoginLogs(id) {
        $.ajax({
            url:"${ctx}/phoneUser/loginLog/id="+id,
            type:"GET",
            success:function (result) {
                buildUserLoginTable(result);
            }
        });
    }

    function deletePhoneUser(id,userKey) {
        if(confirm("当前操作的用户为:【"+userKey+"】\n确认删除吗？")){
            $.ajax({
                url:"${ctx}/phoneUser/delete/id="+id,
                type:"GET",
                success:function(result){
                    alert("删除成功！");
                    to_page(nowPage);
                }
            })
        }
    }

    $("#addPhoneUser_btn").click(function () {
        $("#addPhoneUserModal").modal({
            backdrop:"static"
        });
    });

    function editPhoneUserById(id, userKey, note) {
        $("#editPhoneUserModal").data("uid",id);
        $("#edit_note").val(note);
        $("#edit_number").val(userKey);
        $("#editPhoneUserModal").modal({
            backdrop:"static"
        });
    }

    $("#save_editUser").click(function () {
        var data = $("#editPhoneUser_from").serialize()+"&id="+$("#editPhoneUserModal").data("uid");
        $.ajax({
            url:"${ctx}/phoneUser/userChance",
            type:"POST",
            data:data,
            success:function (result) {
                if(result.code=="200")
                    alert("修改成功！");
                else
                    alert("修改失败！");
                to_page(nowPage);
            }
        })
    });

    $("#savePhoneUser").click(function () {
        var data = $("#addPhoneUser_from").serialize()+"&companyId="+${companyId};
        $.ajax({
            url:"${ctx}/phoneUser/save",
            type:"POST",
            data:data,
            success:function (result) {
                if(result.code=="200"){
                    alert("添加成功！");
                    $("#addPhoneUser_from input").each(function () {
                        $(this).val("");
                    });
                    if(pageTotal%pageSize === 0 )
                        nowPage=lastPage+1;
                    to_page(nowPage);
                }else{
                    alert("添加用户失败！");
                }
            }
        })
    });

    function buildUserLoginTable(result) {
        $("#Log_UserLogin tbody").empty();
        var logs = result.map.logs;
        $.each(logs,function (index,log) {
            var loginDate = $("<td></td>").append(getLocalTime(log.loginDate));
            var loginType = $("<td></td>").append(log.loginType);
            var username = $("<td></td>").append(log.username);
            var uName = $("<td></td>").append(log.uName);
            var phone = $("<td></td>").append(log.phone);
            var belong = $("<td></td>").append(log.belong);
            $("<tr></tr>").append(loginDate).append(username).append(uName).append(phone).append(belong).append(loginType)
                .appendTo("#Log_UserLogin tbody");
        })
    }

</script>