<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>添加商品</title>
</head>
<body>
<h1>添加商品</h1>
<form action="/product/addProduct">
    编号：<input type="text" name="id"><br>
    姓名：<input type="text" name="name"><br>
    类型：<select name="pid">
            <c:forEach items="${protype}" var="protype">
                <option value="${protype.pid}">${protype.tname}</option>
            </c:forEach>
        </select><br>
    价格：<input type="text" name="price"><br>
    图片：<input type="text" name="picture"><br>
    <p>
        <input type="submit" value="添加">
    </p>

</form>
</body>
</html>
