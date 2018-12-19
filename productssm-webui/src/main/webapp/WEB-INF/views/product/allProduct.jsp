<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>商品列表</title>
    <link href="../../../CSS/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../../../JS/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../JS/bootstrap.min.js"></script>
</head>

<body>

<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>商品管理</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" href="/product/toAddProduct">新增</a>
        </div>
        <form>
            名称：<input type="text" name="name" placeholder="请输入搜索关键字" value="${name}"/>
            <button>搜索</button>
        </form>
    </div>
    <!-- 表格  -->
    <div class="row">
        <div class="col-md-12">
            <form action="/product/deletes" method="get">
                <table class="table table-hover">
                    <tr>
                        <th>选择</th>
                        <th>编号</th>
                        <th>名称</th>
                        <th>类型</th>
                        <th>图片</th>
                        <th>价格</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="products">
                        <tr>
                            <td><input type="checkbox" name="ids" value="${products.id}"></td>
                            <td>${products.id}</td>
                            <td>${products.name}</td>
                            <td>${products.protype.tname}</td>
                            <td><img src="../../../images/${products.picture}" style="width: 50px;height: 50px" alt=""></td>
                            <td>${products.price}</td>
                            <td>
                                <a type="button"  href="/product/getProduct?id=${products.id}" class="btn btn-info btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑</a>
                                <a type="button"  href="/product/delProduct?id=${products.id}" class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                    删除</a>
                                <a type="button"  href="/product/upPicture?id=${products.id}" class="btn btn-info btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    上传图片</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <button id="btndelids" class="btn btn-primary">删除选择项</button>
                <a type="button"  href="/product/pushxls" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    导出xls</a>
                <a type="button"  href="/product/pushcsv" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    导出csv</a>
            </form>
            <form action="/product/leads" method="post">
                <input type="file" name="files" id="files"/>
                <input type="submit" value="导入">
            </form>
        </div>
    </div>

    <hr style="height:1px;border:none;border-top:1px solid #ccc;" />
    <!-- 分页导航栏 -->

    <!-- 分页信息 -->
    <div class="row">
        <!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
        <div class="col-md-6">
            当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
        </div>

        <!-- 分页条 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="/product/productInfo?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="/product/productInfo?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">上一页</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li><a href="/product/productInfo?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="/product/productInfo?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">下一页</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="/product/productInfo?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    $("#btndelids").click(function () {
        var msg = "您真的确定要删除选择项吗？\n\n请确认！";
        if (confirm(msg)==true){
            return true;
        }else{
            return false;
        }
    })

</script>
</body>
</html>