<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>校园科研互助系统</title>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/js/jquery-3.1.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 编辑员工模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Update</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@shayz.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
                                Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> Female
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">Update changes</button>
            </div>
        </div>
    </div>
</div>

<!-- 新增员工模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@shayz.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">
                                Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> Female
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>校园科研互助系统</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <%--    ------------查找框--------------   --%>
        <div class="col-lg-4">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="输入科研人员id或科研人员姓名" id="search_emp">
                <span class="input-group-btn">
                        <%-- 查找按钮 --%>
                        <button class="btn btn-primary glyphicon glyphicon-search" type="button" id="search_btn">Search</button>
                    </span>
            </div><!-- /input-group -->
        </div><!-- /.col-lg-6 -->
        <div class="col-md-12">
            <table class="table table table-striped table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>

<script type="text/javascript">

    var totalRecord, currentPage;

    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result)
            }
        });
    }

    /**
     * 解析显示员工信息
     * */
    function build_emps_table(result) {

        $("#emps_table tbody").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></input></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var detailBtn = $("<button></button>").addClass("btn btn-default btn-sm detail_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-list"))
                .append("详情");
            detailBtn.attr("detail-id", item.empId);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            editBtn.attr("edit-id", item.empId);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            delBtn.attr("del-id", item.empId);

            var btnTd = $("<td></td>").append(detailBtn).append(" ").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    /**
     * 解析显示分页信息
     * @param result
     */
    function build_page_info(result) {

        $("#page_info_area").empty();

        $("#page_info_area").append("当前"
            + result.extend.pageInfo.pageNum
            + "第页,总"
            + result.extend.pageInfo.pages
            + "页,总共"
            + result.extend.pageInfo.total
            + "有条记录")
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    /**
     * 解析显示分页条
     * @param result
     */
    function build_page_nav(result) {

        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>")
            .append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>")
            .append($("<a></a>").append("&laquo;"));
        if (!result.extend.pageInfo.hasPreviousPage) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }


        var nextPageLi = $("<li></li>")
            .append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>")
            .append($("<a></a>").append("尾页").attr("href", "#"));
        if (!result.extend.pageInfo.hasNextPage) {
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>")
                .append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item)
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);

        $("#page_nav_area").append(navEle);
    }

    /**
     * 表单重置
     */
    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has_success");
        $(ele).find(".help-block").text("");
    }

    /**
     * 新增按钮点击事件
     */
    $("#emp_add_modal_btn").click(function () {

        reset_form("#empAddModal form");

        getDepts("#dept_add_select");

        $("#empAddModal").modal({
            backdrop: "static"
        });
    });

    function getDepts(ele) {

        $(ele).empty();

        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                //测试 console.log(result);

                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    /**
     * 校验
     * @returns {boolean}
     */
    function show_validate_msg(ele, status, msg) {

        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");

        if ("success" == status) {
            $(ele).parent().addClass("has-success");
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
        }
        $(ele).next("span").text(msg);
    }

    function validate_add_form() {

        var empName = $("#empName_add_input").val();
        var regName = /(^[A-Za-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error",
                "名字必须是2-5个中文或者6-16位英文数字组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }


        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱格式输入错误");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }

    $("#empName_add_input").change(function () {
        var empName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkuser",
            type: "POST",
            data: "empName=" + empName,
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_add_input", "success", "用户名可用");
                    $("#emp_save_btn").attr("ajax-va", "success");
                } else {
                    show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va", "error");
                }
            }
        });
    })

    /**
     * 新增模态框中保存按钮点击事件
     */
    $("#emp_save_btn").click(function () {

        if (!validate_add_form()) {
            return false;
        }

        if ($(this).attr("ajax-va") == "error") {
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                //alert(result.msg);
                if (result.code == 100) {
                    $("#empAddModal").modal('hide');

                    to_page(totalRecord);
                } else {
                    //console.log(result);
                    if (undefined != result.extend.errorFields.email) {
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });
    });




    /**
     * 编辑按钮点击事件
     */
    $(document).on("click", ".edit_btn", function () {

        getDepts("#dept_update_select");

        getEmp($(this).attr("edit-id"));

        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));

        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    });

    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                //console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#dept_update_select").val([empData.dId]);
            }
        });
    }

    /**
     * 删除按钮点击事件
     */
    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(1)").text();
        var empId = $(this).attr("del-id");
        if(confirm("确认删除["+empName+"]吗?")){
            $.ajax({
                url:"${APP_PATH}/emp/" + empId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    /**
     * 详情按钮事件
     */
    $(document).on("click", ".detail_btn", function () {
        var empId = $(this).attr("detail-id");
        var url = "${APP_PATH}/detail/" + empId;
        window.open(url);
    });

    /**
     * 编辑模态框更新按钮点击事件
     */
    $("#emp_update_btn").click(function () {
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式输入错误");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }

        $.ajax({
            url : "${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type : "PUT",
            data : $("#empUpdateModal form").serialize(),
            success : function(result) {
                if (result.code == 100) {
                    $("#empUpdateModal").modal("hide");
                    to_page(currentPage);
                } else {
                    alert("更新失败");
                }
            }
        });
    });

    /**
     * 全选checkbox
     */
    $("#check_all").click(function () {
        //prop获取dom原生属性，attr获取自定义属性的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    })
    $(document).on("click",".check_item",function(){
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    /**
     * 删除全部按钮点击事件
     */
    $("#emp_delete_all_btn").click(function(){
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function(){
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        del_idstr = del_idstr.substring(0,del_idstr.length-1);
        if(confirm("确认删除["+empNames+"]吗?")){
            $.ajax({
                url:"${APP_PATH}/emp/" + del_idstr,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    //为搜索按钮绑定单击事件
    $("#search_btn").click(function () {
        //清空tbody，如果不清空，当页面刷新的时候新的数据不会覆盖旧数据，造成页面混乱
        $("#emps_table tbody").empty();

        //将搜索框中的内容保存到searchContent中
        var searchContent = $("#search_emp").val();

        console.log(searchContent);

        $("#page_nav_area").empty();

        //如果输入框中的内容为空的话，用to_page回到原本显示的界面。
        if(searchContent == ""){
            to_page(1);
        }else{
            //如果不为空的话，发送ajax请求
            $.ajax({
                url:"${APP_PATH}/empSearch",
                type:"GET",
                data:"content=" + searchContent,
                success:function (res) {

                    //显示搜索到的员工
                    search_emps_table(res);
                    //显示搜索页面的分页信息
                    build_search_page_info(res);
                }
            });
        }
    })

    // 解析并显示查询到的员工数据
    function search_emps_table(res) {
        //清空table表格，如果不清空，当页面刷新的时候新的数据不会覆盖旧数据，造成页面混乱
        $("#emps_table tbody").empty();

        //将查找出来的员工数据保存在empSearched中
        var empSearched = res.extend.pageInfo.list;

        //如果empSearch中的数据为空的话，就提示未找到
        if(empSearched.length == 0){
            $("<h5></h5>").append("").append("NOT FOUND")
                .appendTo("#emps_table tbody");//将tr添加到tbody标签中
        }else {

            //遍历所有查询到的员工
            $.each(empSearched, function (i, val) {
                //在员工数据的最左边加上多选框
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");

                var empIdTd = $("<td></td>").append(empSearched[i].empId);
                var empNameTd = $("<td></td>").append(empSearched[i].empName);
                var genderTd = $("<td></td>").append(empSearched[i].gender == 'M' ? "男" : "女");
                var emailTd = $("<td></td>").append(empSearched[i].email);
                var deptNameTd = $("<td></td>").append(empSearched[i].department.deptName);

                var detailBtn = $("<button></button>").addClass("btn btn-default btn-sm detail_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-list"))
                    .append("详情");
                detailBtn.attr("detail-id", empSearched[i].empId);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
                editBtn.attr("edit-id", empSearched[i].empId);

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append("删除");
                delBtn.attr("del-id", empSearched[i].empId);

                var btnTd = $("<td></td>").append(detailBtn).append(" ").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>")
                    .append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            })
        }
    }

    // 解析并显示搜索页面的分页信息
    function build_search_page_info(res) {
        //清空分页文字信息，如果不清空，当页面刷新的时候新的数据不会覆盖旧数据，造成页面混乱
        $("#page_info_area").empty();

        $("#page_info_area").append("已查询到" + res.extend.pageInfo.total +"条记录。");

    }

</script>
</body>
</html>
