<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<header>
    <title>Loại khach hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</header>
<body>
<div class="container">
        <div class="col-6 offset-3 mt-3">
            <sf:form action="${action}" method="post" modelAttribute="loaiKhachHang">
                <div class="mt-3">
                    <label>Mã loại khách</label>
                    <sf:input path="ma" cssClass="form-control"/>
                    <sf:errors cssClass="text-danger" path="ma" element="span"/>
                    <span class="text-danger">${maTrung}</span>
                </div>
                <div class="mt-3">
                    <label>Tên loại khách</label>
                    <sf:input path="ten" cssClass="form-control"/>
                    <sf:errors cssClass="text-danger" path="ten" element="span"/>
                </div>
                <div class="mt-3">
                    <label>Số Điểm</label>
                    <sf:input path="soDiem" cssClass="form-control"/>
                    <sf:errors cssClass="text-danger" path="soDiem" element="span"/>
                </div>

                <div class="mt-3 offset-4">
                    <button type="submit" class="btn btn-success">Add</button>
                </div>
            </sf:form>
        </div>

</div>
</body>
</html>