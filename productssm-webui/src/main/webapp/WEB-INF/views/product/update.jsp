<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>编辑商品</title>
</head>
<body>
<h1>编辑商品</h1>
<form action="/product/updateProduct">
    <input type="hidden" name="id" value="${product.id}" /> <br>
    姓名：<input type="text" name="name" value="${product.name}" /><br>
    类型：<select id="pid" name="pid">
            <c:forEach items="${protype}" var="protype">
                <option value="${protype.pid}">${protype.tname}</option>
            </c:forEach>
        </select><br>
    价格：<input type="text" name="price" value="${product.price}" /><br>
    图片：<input type="text" name="picture" value="${product.picture}" /><br>
    <p>
        <input type="submit" value="更新"/>
    </p>
</form>
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
