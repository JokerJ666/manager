<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
    .pageNav ul li{cursor: pointer;}
    .workTime_btn button{width: 40px !important;}
</style>

<%--添加用户模态框--%>
<div class="modal fade" id="addCompanyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增公司</h4>
            </div>
            <div class="modal-body">
                <form id="addCompany_from" class="form-horizontal">
                    <div class="form-group" id="Add_form_companyName">
                        <label class="col-sm-3 control-label" for="Add_companyName">公司名称:</label>
                        <div class="col-sm-8">
                            <input name="companyName" class="form-control" maxlength="20" id="Add_companyName">
                        </div>
                    </div>
                    <div class="form-group" id="Add_form_companyCreditCode">
                        <label class="col-sm-3 control-label" for="Add_companyCreditCode">统一社会信用代码:</label>
                        <div class="col-sm-8">
                            <input name="companyCreditCode" class="form-control" maxlength="20" id="Add_companyCreditCode">
                        </div>
                    </div>
                    <div class="form-group" id="Add_form_address">
                        <label class="col-sm-3 control-label" for="Add_address">地址:</label>
                        <div class="col-sm-8">
                            <input name="address" class="form-control" maxlength="40" id="Add_address">
                        </div>
                    </div>
                    <div class="form-group" id="Add_form_managerName">
                        <label class="col-sm-3 control-label" for="Add_managerName">联系人姓名:</label>
                        <div class="col-sm-8">
                            <input name="managerName" class="form-control" maxlength="6" id="Add_managerName">
                        </div>
                    </div>
                    <div class="form-group" id="Add_form_managerPhone">
                        <label class="col-sm-3 control-label" for="Add_managerPhone">联系人手机:</label>
                        <div class="col-sm-8">
                            <input name="managerPhone" class="form-control" maxlength="11" id="Add_managerPhone">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveCompany_btn">保存用户</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <%--  标题行  --%>
    <div class="row">
        <div class="col-md-12">
            <h1 class="center-block">公司列表</h1>
        </div>
    </div>
    <%--  操作行  --%>
    <div class="row">
        <div class="row">
            <div class="col-md-4">
                <div class="input-group">
                    <div class="input-group-btn" id="search_type_div">
                        <button type="button" id="search_type_btn" class="btn btn-default dropdown-toggle" data-toggle="dropdown">公司名称
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">公司名称</a></li>
                            <li><a href="#">信用代码</a></li>
                        </ul>
                    </div>
                    <input type="text" class="form-control" id="search_name_input">
                    <span class="input-group-btn">
						<button class="btn btn-default" type="button" id="search_btn">
							搜索
						</button>
					</span>
                </div>
            </div>
            <button type="button" class="btn btn-warning" id="addCompany_btn">新增公司</button>
        </div>
    </div>
    <%--  显示行  --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="Show_Company_Table">
                <thead>
                <tr>
                    <td>编号</td>
                    <td>公司名称</td>
                    <td>统一社会信用代码</td>
                    <td>创建时间</td>
                    <td>剩余维护次数</td>
                    <td>服务到期时间</td>
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
        <div class="col-md-6">
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-4" id="pageNav">
        </div>
    </div>
</div>

<%--<button id="test">--%>
<%--    测试--%>
<%--</button>--%>

<%--<script type="text/javascript">--%>
<%--    $("#test").click(function () {--%>
<%--        $.ajax({--%>
<%--            url:"${ctx}/auth/logining",--%>
<%--            type:"POST",--%>
<%--            data:{IMEI:"789456",USERNAME:"zhang",PHONE:"123456",USERID:"测试",COMPANY:"公司",RIGHT:"1"},--%>
<%--            success:function (result) {--%>
<%--                if (result.code=="200")--%>
<%--                    alert("登入成功");--%>
<%--                else--%>
<%--                    alert("登入失败");--%>
<%--            }--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>

<script type="text/javascript">

    var nowPage;
    var defaultLastPage;

    $(function () {
        document.title="所有公司列表";
        $("#search_btn").data("search_type","0");
        to_page(1,"default");

        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, '#');
                window.history.forward(1);
            });
        }
        window.history.pushState('forward', null, '#');
        window.history.forward(1);
    });

    //分页页面跳转
    function to_defaultPage(page) {
        $.ajax({
            url:"${ctx}/company/listAll?page="+page,
            type:"GET",
            success:function (result) {
                defaultLastPage=result.map.pageInfo.lastPage;
                buildCompanyTable(result.map.pageInfo.list,result.map.pageInfo.startRow);
                buildCompany_PageNav(result,"default");
            }
        });
    }

    function to_SearchPage(page){
        $.ajax({
            url:"${ctx}/company/search?page="+page+"&searchType="+$("#search_btn").data("search_type")+"&searchContent="+$("#search_name_input").val(),
            type:"GET",
            success:function (result) {
                if(result.code=="200"){
                    buildCompanyTable(result.map.pageInfo.list,result.map.pageInfo.startRow);
                    buildCompany_PageNav(result,"Search");
                }else{
                    alert("未查询到相关公司");
                }
            }
        })
    }

    function to_page(page,type) {
        nowPage=page;
        if(type=="default"){
            to_defaultPage(page);
        }else{
            to_SearchPage(page);
        }
    }

    function buildCompanyTable(companyInfo,startRow){
        $("#Show_Company_Table tbody").empty();
        $.each(companyInfo,function (index,company) {
            var id=$("<td></td>").append(startRow+index);
            var companyName=$("<td></td>").append(company.companyName);
            var companyCreditCode=$("<td></td>").append(company.companyCreditCode);
            var createDate=$("<td></td>").append(getLocalTime(company.createDate));
            var maintainNum=$("<td></td>").append(company.maintainNum);
            var remainingTime=$("<td></td>").append(getLocalTime(company.remainingTime));
            var handleBtn=$("<button></button>").addClass("btn btn-warning btn-sm show_btn").append("管理");
            handleBtn.click(function () {
                handleCompanyById(company.id);
            });
            var deleteBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append("删除");
            deleteBtn.click(function () {
                deleteCompany(company.id,company.companyName);
            });

            var Btns=$("<td></td>").append(handleBtn).append(deleteBtn);
            $("<tr></tr>").append(id).append(companyName).append(companyCreditCode)
                .append(createDate).append(maintainNum).append(remainingTime).append(Btns)
                .appendTo("#Show_Company_Table tbody");
        })
    }

    function buildCompany_PageNav(result,type) {
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
                to_page(1,type);
            });
            perPageLi.click(function () {
                to_page(pageInfo.prePage,type);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if(pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                to_page(pageInfo.nextPage,type);
            });
            lastPageLi.click(function () {
                to_page(pageInfo.lastPage,type);
            });
        }
        ul.append(firstPageLi).append(perPageLi);

        $.each(pageInfo.navigatepageNums,function (index,item) {
            var numLi= $("<li></li>").append($("<a></a>").append(item));
            if(pageInfo.pageNum == item) numLi.addClass("active");
            numLi.click(function () {
                to_page(item,type);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        nav.append(ul).appendTo($("#pageNav"));
    }

    $("#addCompany_btn").click(function () {
        $("#addCompanyModal").modal({
            backdrop:"static"
        });
    });

    $("#Add_address").blur(function () {
        var regName = /^[\u2E80-\u9FFFa-zA-Z0-9]{2,40}$/;
        if(!regName.test($(this).val())){
            $("#Add_form_address").addClass("has-warning");
        }else{
            $("#Add_form_address").removeClass("has-warning");
        }
    });

    $("#Add_companyName").blur(function () {
       var regName = /^[\u2E80-\u9FFF]{2,20}$/;
       if(!regName.test($(this).val())){
           $("#Add_form_companyName").addClass("has-warning");
       }else{
           $("#Add_form_companyName").removeClass("has-warning");
       }
    });

    $("#Add_managerName").blur(function () {
        var regName = /^([\u2E80-\u9FFF]{2,6}$)|(^[a-zA-Z]{2,12}])/;
        if(!regName.test($(this).val())){
            $("#Add_form_managerName").addClass("has-warning");
        }else{
            $("#Add_form_managerName").removeClass("has-warning");
        }
    });

    $("#Add_managerPhone").blur(function () {
        var regName = /^[0-9]{11}$/;
        if(!regName.test($(this).val())){
            $("#Add_form_managerPhone").addClass("has-warning");
        }else{
            $("#Add_form_managerPhone").removeClass("has-warning");
        }
    });

    $("#Add_companyCreditCode").blur(function () {
        var regName = /^[A-Z0-9]{20}$/;
        if(!regName.test($(this).val())){
            $("#Add_form_companyCreditCode").addClass("has-warning");
        }else{
            $.ajax({
                url:"${ctx}/company/exist/companyCreditCode="+$("#Add_companyCreditCode").val(),
                type:"GET",
                success:function (result) {
                    if(result.code=="100"){
                        $("#Add_form_companyCreditCode").addClass("has-warning");
                    }else{
                        $("#Add_form_companyCreditCode").removeClass("has-warning");
                    }
                }
            })
        }
    });

    $("#saveCompany_btn").click(function () {
        $.ajax({
            url:"${ctx}/company/save",
            type:"POST",
            data:$("#addCompany_from").serialize(),
            success:function (result) {
                $("#addCompany_from input").each(function () {
                    $(this).val("");
                });
                $('#addCompanyModal').modal('hide');
                if (result.code=="200"){
                    alert("添加公司成功!");
                } else {
                    alert("添加公司失败!可能重复提交了，你看看列表里有没有！");
                }
                to_page(defaultLastPage,"default");
            }
        })
    });

    function handleCompanyById(id) {
        var url = "${ctx}/company/handel/id="+id;
        window.open(url, "_blank");
    }

    function deleteCompany(id,companyName) {
        if(confirm("确认删除【"+companyName+"】吗？")){
            $.ajax({
                url:"${ctx}/company/delete/"+id,
                type:"DELETE",
                success:function (result) {
                    if(result.code=="200"){
                        alert("删除成功！");
                        to_page(nowPage,"default");
                    }else{
                        alert("删除失败！\n该公司【"+companyName+"】还有用户存在！");
                    }
                }
            })
        }
    }

    $("#search_type_div li").click(function () {
        var span = $("<span></span>").addClass("caret");
        $("#search_btn").data("search_type",$(this).index());
        $("#search_type_btn").text($(this).text()).append(span);
    });

    $("#search_btn").click(function () {
        var content =$("#search_name_input").val();
        if(content==null){
            to_defaultPage(1);
        }else{
            to_SearchPage(1);
        }
    });

    function getLocalTime(nS) {
        if(nS==null)
            return;
        return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');
    }

</script>
