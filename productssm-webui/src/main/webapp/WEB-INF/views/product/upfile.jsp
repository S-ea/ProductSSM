<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link href="../../../CSS/main.css" type="text/css" rel="stylesheet" />
    <title>上传图片</title>
</head>
<body>
<div class="main">
    <h2 class="title">
        <span>上传图片</span>
    </h2>
    <form action="<c:url value="/product/upPictureSave/${product.id}" />" method="post"
          enctype="multipart/form-data">
        <fieldset>
            <legend>商品</legend>
            <input type="hidden" name="id" value="${product.id}" /> <br>
            <p>
                姓名：<input type="text" name="name" value="${product.name}" /><br>
            </p>
            <p>
                类型：<select id="pid" name="pid">
                        <c:forEach items="${protype}" var="protype">
                            <option value="${protype.pid}">${protype.tname}</option>
                        </c:forEach>
                      </select><br>
            </p>
            <p>
                价格：<input type="text" name="price" value="${product.price}" /><br>
            </p>
            <p>
                图片：<input type="file" name="picFile" />
            </p>

            <p>
                <input type="submit" value="上传" class="btn out">

            </p>
        </fieldset>
    </form>
    <p style="color: red">${message}</p>
    <p>
        <a href="<c:url value="/product/productInfo" />" class="abtn out">返回列表</a>
    </p>
</div>
<script type="text/javascript" src="../../../JS/jquery-1.10.2.min.js"></script>
<script>
    function selectoption(){
        var num = ${product.pid};               //获取input中输入的数字
        var numbers = $("#pid").find("option"); //获取select下拉框的所有值
        for (var j = 1; j < numbers.length; j++) {
            if ($(numbers[j]).val() == num) {
                $(numbers[j]).attr("selected", "selected");
            }
        }
    }
    selectoption();
</script>
</body>
</html>
