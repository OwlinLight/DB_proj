<%--
  Created by IntelliJ IDEA.
  User: Charlie
  Date: 2021/1/11
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Album example · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
    <script src="${APP_PATH}/static/dist/js/jquery.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <!-- Bootstrap core CSS -->
    <meta charset="UTF-8">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>校园科研互助系统</title>
    <link href="${APP_PATH}/static/Signin_files/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


</head>
<body>

<header>
    <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-md-7 py-4">
                    <h4 class="text-white">李伟</h4>
                    <p class="text-muted">李伟的个人信息</p>
                </div>
                <div class="col-sm-4 offset-md-1 py-4">
                    <h4 class="text-white">Contact</h4>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Follow on Twitter</a></li>
                        <li><a href="#" class="text-white">Like on Facebook</a></li>
                        <li><a href="#" class="text-white">Email me</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
                <strong> 科研人员详情页面</strong>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </div>
</header>

<main>
<div class="container">
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">

                <h1 class="fw-light" id = "name">姓名：</h1>
                <p class="lead text-muted" id = "email">邮箱号：</p>
                <p>
                    <a href="paper.jsp" class="btn btn-primary my-2">向他提问</a>
                    <a href="/index.jsp" class="btn btn-secondary my-2">回到人员查询页面</a>
                </p>
            </div>
        </div>
    </section>

    <div class="row">
        <%--    ------------查找框--------------   --%>
        <div class="col-md-12">
            <table class="table table table-striped table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>论文名</th>
                    <th>url</th>
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
</main>

<footer class="text-muted py-5">
    <div class="container">
        <p class="float-end mb-1">
            <a href="#">Back to top</a>
        </p>
        <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
        <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
    </div>
</footer>
<%--<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>

<script >

    //解析个人信息
    $(document).ready(function () {
        getAuthorInfo(${authorId});
    });



    function getAuthorInfo(authorId) {
        $.ajax({
            url: "${APP_PATH}/emp/"+authorId,
            type: "GET",
            success: function (result) {
                console.log(result);
                var emp = result.extend.emp;
                buildInfo(emp);
            }
        });
    }

    function buildInfo(emp){
        $('#name').append(emp.empName);
        $('#email').append(emp.email);
    }


    var totalRecord, currentPage;

    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/papers/${authorId}",
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
            var empIdTd = $("<td></td>").append(item.paperId);
            var empNameTd = $("<td></td>").append(item.paperName);
            var genderTd = $("<td></td>").append(item.url);
            var detailBtn = $("<button></button>").addClass("btn btn-default btn-sm detail_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-list"))
                .append("查看相关问题");
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

            var firstPageLi = $("<li></li>").addClass("page-item")
                .append($("<a></a>").addClass("page-link").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").addClass("page-item")
                .append($("<a></a>").addClass("page-link").append("&laquo;"));
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


            var nextPageLi = $("<li></li>").addClass("page-item")
                .append($("<a></a>").addClass("page-link").append("&raquo;"));
            var lastPageLi = $("<li></li>").addClass("page-item")
                .append($("<a></a>").addClass("page-link").append("尾页").attr("href", "#"));
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
                var numLi = $("<li></li>").addClass("page-item")
                    .append($("<a></a>").addClass("page-link").append(item));
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

</script>


</body>
</html>

