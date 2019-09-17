<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    .input_workTime{width: 55px;}
    #workday button{width: 48px !important;}
    .btn-danger-test {
        color: #fff;
        background-color: #d9534f;
        border-color: #d43f3a;
        margin-top: 5px;
        float: right;
    }

    .content {
        width: 100px;
    }
</style>


<div class="modal fade" id="ShowPhoneAdminUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">公司的管理员用户</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped" id="Show_PhoneAdminList">
                    <thead>
                    <tr>
                        <td>用户名</td>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="ToSavePhoneUserAdmin">添加管理员用户</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addPhoneAdminUserModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增手机管理员用户</h4>
            </div>
            <div class="modal-body">
                <form id="addPhoneAdminUser_from" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="Add_username">用户名:</label>
                        <div class="col-sm-8">
                            <input name="username" class="form-control" id="Add_username">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="savePhoneUserAdmin"  data-dismiss="modal">保存用户</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="panel panel-default">
        <div class="panel-body form-horizontal">
            <div class="row">
                <div class="col-md-5">
                    <label class="col-sm-4 control-label">公司名称:</label>
                    <div class="col-sm-8">
                        <p class="form-control-static" id="companyName"></p>
                    </div>
                </div>
                <div class="col-md-5">
                    <label class="col-sm-4 control-label">统一社会信用代码:</label>
                    <div class="col-sm-8">
                        <p class="form-control-static" id="companyCode"></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <label class="col-sm-4 control-label">联系人:</label>
                    <div class="col-sm-8">
                        <p class="form-control-static" id="managerName"></p>
                    </div>
                </div>
                <div class="col-md-5">
                    <label class="col-sm-4 control-label">联系电话:</label>
                    <div class="col-sm-8">
                        <p class="form-control-static" id="managerPhone"></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <label class="col-sm-4 control-label">地址:</label>
                    <div class="col-sm-8">
                        <p class="form-control-static" id="address"></p>
                    </div>
                </div>
                <div class="col-md-5">
                    <label class="col-sm-4 control-label">创建时间:</label>
                    <div class="col-sm-8">
                        <p class="form-control-static" id="companyCreateDate"></p>
                    </div>
                </div>
            </div>
            <%--丑我也没办法，，，老师要搞我  我也没办法--%>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <label class="col-sm-2 control-label">工作日:</label>
                        <div class="col-md-6" id="workday_button-group">
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="button" class="btn btn-sm btn-default">周日</button>
                                <button type="button" class="btn btn-sm btn-default">周一</button>
                                <button type="button" class="btn btn-sm btn-default">周二</button>
                                <button type="button" class="btn btn-sm btn-default">周三</button>
                                <button type="button" class="btn btn-sm btn-default">周四</button>
                                <button type="button" class="btn btn-sm btn-default">周五</button>
                                <button type="button" class="btn btn-sm btn-default">周六</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <form id="workTime_Form">
                                <label class="col-sm-2 control-label">工作时间段一:</label>
                                <div class="col-md-2">
                                    <input type="text" placeholder="00:00" class="datetimepicker input_workTime beginTime" name="begin1" autocomplete="off" >
                                    至
                                    <input type="text" placeholder="00:00" class="datetimepicker input_workTime endTime" name="end1" autocomplete="off" >
                                </div>
                                <label class="col-sm-2 control-label">工作时间段二:</label>
                                <div class="col-md-2">
                                    <input type="text" placeholder="00:00" class="datetimepicker input_workTime beginTime" name="begin2" autocomplete="off" >
                                    至
                                    <input type="text" placeholder="00:00" class="datetimepicker input_workTime endTime" name="end2" autocomplete="off" >
                                </div>
                                <label class="col-sm-2 control-label">工作时间段三:</label>
                                <div class="col-md-2">
                                    <input type="text" placeholder="00:00"  class="datetimepicker input_workTime beginTime" name="begin3" autocomplete="off" >
                                    至
                                    <input type="text" placeholder="00:00" class="datetimepicker input_workTime endTime" name="end3" autocomplete="off" >
                                </div>
                        </form>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-primary" id="save_workTime">保存工作时间设置</button>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-warning" id="Show_PhoneAdmin">公司的管理员用户</button>
                        </div>
                    </div>
                </div>
            </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <form id="maintain_Form">
                        <div class="col-md-5">
                            <label class="col-sm-5 control-label" for="remainingTime_input">维护时间:</label>
                            <div class="col-md-2">
                                <input type="text" placeholder="00:00" id="remainingTime_input" class="datetimepicker2" name="remainingTime" autocomplete="off" >
                            </div>
                        </div>
                        <div class="col-md-5">
                            <label class="col-sm-5 control-label" for="maintainNum_input">剩余维护次数:</label>
                            <div class="col-md-2">
                                <input type="text" name="maintainNum" autocomplete="off" id="maintainNum_input">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <label class="col-sm-5 control-label" for="cloudServerInformation_input">购买商业云价位:</label>
                        <div class="col-md-2">
                            <input type="text" name="cloudServerInformation" autocomplete="off" id="cloudServerInformation_input">
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label class="col-sm-5 control-label" for="amountPackage_input">套餐信息:</label>
                        <div class="col-md-2">
                            <input type="text" name="amountPackage" autocomplete="off" id="amountPackage_input">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary" id="save_maintain">保存维护设置</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div>
        <ul class="nav nav-tabs">
            <li role="presentation" class="active" id="Show_PhonePage"><a href="#">手机端</a></li>
        </ul>
    </div>

    <div class="panel panel-default" id="showPhoneList">
        <div class="panel-body" >
            <jsp:include page="../User/phoneUserForComapny.jsp"/>
        </div>
    </div>

</div>

<script type="text/javascript">

    $(function () {
        document.title="所有用户";
        ShowCompany();
    });

    function ShowCompany(){
        $.ajax({
            url:"${ctx}/company/getData/id="+${companyId},
            type:"GET",
            success:function (result) {
                var company = result.map.company;
                $("#companyName").text(company.companyName);
                $("#companyCode").text(company.companyCreditCode);
                $("#companyCreateDate").text(getLocalTime(company.createDate));
                $("#managerName").text(company.managerName);
                $("#managerPhone").text(company.managerPhone);
                $("#address").text(company.address);
                $("#remainingTime_input").val(company.remainingTime);
                $("#maintainNum_input").val(company.maintainNum);
                activeWorkday(company.workday);
                var beginTimeList = company.beginTime.split(",");
                var index = 0;
                $(".beginTime").each(function () {
                    var beginTime = "00:00";
                    if(index<beginTimeList.length)
                        beginTime=beginTimeList[index];
                    index++;
                    $(this).val(beginTime);
                });
                var endTimeList = company.endTime.split(",");
                index=0;
                $(".endTime").each(function () {
                    var endTime = "00:00";
                    if(index<endTimeList.length)
                        endTime=endTimeList[index];
                    index++;
                    $(this).val(endTime);
                })
            }
        })
    }

    $("#save_maintain").click(function () {
        var data = $("#maintain_Form").serialize()+"&id="+${companyId};
        console.log(data);
        $.ajax({
            url:"${ctx}/company/edit",
            type:"POST",
            data:data,
            success:function (result) {
                 if(result.code=="200")
                     alert("修改成功！");
                 else
                     alert("修改失败！");
            }
       })
    });

    function activeWorkday(workday) {
        if(workday==null||workday==="")
            return;
        var day = workday.split(",");
        var i=0;
        $("#workday_button-group button").each(function () {
            if(i<day.length && day[i]!=null && $(this).index()===Number(day[i])){
                i++;
                $(this).addClass("active");
            }
        })
    }

    function getLocalTime(nS) {
        if (nS===null)
            return;
        return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');
    }

    $(".datetimepicker").datetimepicker({
        format: 'hh:ii',
        language: 'zh-CN',
        autoclose: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        clearBtn:true,//清除按钮
        forceParse: 0
    });

    $(".datetimepicker2").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        autoclose: 1,
        startDate:new Date(),
        startView: 4,
        minView: 2,
        maxView: 4,
        clearBtn:true,//清除按钮
        forceParse: 0
    });

    $("#workday_button-group button").click(function () {
        if($(this).hasClass("active"))
            $(this).removeClass("active");
        else
            $(this).addClass("active");
    });

    function getWorkday(){
        var workday="";
        $("#workday_button-group button").each(function () {
            if($(this).hasClass("active")){
                workday+=$(this).index().toString()+",";
            }
        });
        if(workday.length>0)
            workday=workday.substr(0,workday.length-1);
        return workday;
    }

    $("#save_workTime").click(function () {
        var data = $("#workTime_Form").serialize()+"&workday="+getWorkday()+"&id="+${companyId};
        $.ajax({
            url:"${ctx}/company/saveWorkTime",
            type:"POST",
            data:data,
            success:function () {
                alert("修改成功！")
            }
        });
    });

    $("#ToSavePhoneUserAdmin").click(function () {
        $("#addPhoneAdminUserModal").modal({
            backdrop:"static"
        });
    });

    $("#Show_PhoneAdmin").click(function () {
        getPhoneAdminList();
        $("#ShowPhoneAdminUserModal").modal({
            backdrop:"static"
        });
    });

    $("#savePhoneUserAdmin").click(function () {
        var data = $("#addPhoneAdminUser_from").serialize()+"&companyId="+${companyId};
        $.ajax({
            url:"${ctx}/company/saveAdminUser",
            type:"POST",
            data:data,
            success:function (result) {
                if(result.code=="200") {
                    getPhoneAdminList();
                    alert("添加成功！");
                }else if (result.code=="4001") {
                    alert("添加失败！该公司下当前用户已经存在!");
                }
                else
                    alert("添加失败！管理员用户可能已经存在!");
                $("#addPhoneAdminUser_from input").each(function () {
                    $(this).val("");
                })
            }
        })
    });

    function getPhoneAdminList() {
        $.ajax({
            url:"${ctx}/company/phoneAdminList?companyId="+${companyId},
            type:"GET",
            success:function (result) {
                buildPhoneAdminUserListTable(result);
            }
        });
    }

    function buildPhoneAdminUserListTable(result) {
        $("#Show_PhoneAdminList tbody").empty();
        var users = result.map.AdminUserList;
        $.each(users,function (index,user) {
            var username = $("<td></td>").append(user.username);
            var deleteBtn=$("<button></button>").addClass("btn-danger-test").append("删除");
            deleteBtn.click(function () {
                deleteCompanyUser(user.id,user.userKey);
            });
            $("<tr></tr>").append(username).append(deleteBtn)
                .appendTo("#Show_PhoneAdminList tbody");
        })
    }

    function deleteCompanyUser(id,userKey) {
        if(confirm("当前操作的用户为:【"+userKey+"】\n确认删除吗？")){
            $.ajax({
                url:"${ctx}/company/deleteUser/id="+id,
                type:"GET",
                success:function(result){
                    getPhoneAdminList();
                    alert("删除成功！");
                    to_page(nowPage);
                }
            })
        }
    }

</script>
