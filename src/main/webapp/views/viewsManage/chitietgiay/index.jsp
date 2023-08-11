<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .result {
            background-color: green;
            color: #fff;
            padding: 0px;
        }

        .row {
            display: flex;
        }
    </style>
</head>
<body>
<div class="col-10 offset-1 mt-3">
    <div>
        <c:if test="${ not empty sessionScope.message }">
            <div class="alert alert-success text-center">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>
    </div>
    <div class="col-4 offset-4 mt-4">
        <form action="/chi-tiet-giay/search" method="get">
            <div class="mt-2">
                <label>Tìm kiếm</label>
                <input name="keyword" class="form-control" type="text" placeholder="Tên hoặc mã"
                       aria-label="Tên hoặc mã">
            </div>
            <%--            <div class="mt-3">--%>
            <%--                <label>Loại khách hàng</label>--%>
            <%--                                <select name="loaiKH" class="form-select">--%>
            <%--                                    <c:forEach items="${listLKH}" var="kh">--%>
            <%--                                        <option value="${kh.id}">${kh.ten}</option>--%>
            <%--                                    </c:forEach>--%>
            <%--                                </select>--%>
            <%--            </div>--%>
            <div class="mt-3">
            </div>
        </form>

    </div>
    <div class="row">
        <div class="col-4">
            <button onclick="back()" type="submit" class="btn btn-dark">Back</button>
            </div>
        <div class="col-4">
            <button type="submit" class="btn btn-primary">Search</button>
            <a class="btn btn-success" href="/chi-tiet-giay/viewAdd">Add</a></div>
        <div class="col-4">
            <div class="row">
                <div class="col">
                    <div style="width:500px;" id="reader"></div>
                </div>
                <div class="col" style="padding:30px;">
                    <h4>SCAN RESULT</h4><br>
                    <div id="result">Result Here</div>
                </div>
            </div>
        </div>
    </div>
    <table class="table table-bordered bordered-dark mt-3 text-center" id="myTable">
        <thead class="bg-info">
        <tr>
            <td>STT</td>
            <td>Hình ảnh</td>
            <td>Tên giày</td>
            <td>Mã giày</td>
            <td>Giá Bán</td>
            <td>Size</td>
            <td>Số lượng tồn</td>
            <td>Trạng thái</td>
            <td colspan="2">Action</td>
        </tr>
        </thead>
        <tbdoy>
            <c:forEach items="${listCTGiay}" var="kh" varStatus="i">
                <tr>
                    <td>${i.index + 1}</td>
                    <td><img width="95px" height="100px" src="/img/imgsProducts/${kh.hinhAnh.urlImg0}"></td>
                    <td>${kh.giay.ten}</td>
                    <td>${kh.giay.ma}</td>
                        <%--                        <td>${kh.namBaoHanh}</td>--%>
                        <%--                        <td>${kh.namSanXuat}</td>--%>
                        <%--                        <td>${kh.trongLuong}</td>--%>
                        <%--                        <td>${kh.giaNhap}</td>--%>
                    <td>${kh.giaBan}</td>
                    <td>${kh.size.soSize}</td>
                    <td>${kh.soLuongTon}</td>
                    <td>
                        <c:if test="${kh.trangThai == 0}">Không hoạt động</c:if>
                        <c:if test="${kh.trangThai == 1}">Hoạt động</c:if></td>
                        <%--<td>${kh.chatLieuDeGiay.ten}</td>
                        <td>${kh.chatLieuThanGiay.ten}</td>
                        <td>${kh.hang.ten}</td>
                        <td>${kh.mauSac.ten}</td>
                        <td>${kh.size.soSize}</td>--%>
                    <td>
                            <%--                        <a onclick="xacNhan(event)" href="/chi-tiet-giay/delete/${kh.id}" class="btn btn-danger">Xoa</a>--%>
                        <a href="/chi-tiet-giay/viewUpdate/${kh.id}" class="btn btn-primary">Update</a>
                        <a href="/chi-tiet-giay/detail/${kh.id}" class="detail btn btn-warning">Detail</a>
                        <input type="hidden" id="id" value="/chi-tiet-giay/viewUpdate/${kh.id}">
                    </td>
                </tr>
            </c:forEach>
        </tbdoy>
    </table>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h3 align="center" class="card-title">${ctgiayDetail.giay.ten}</h3>
                <h6 align="center" class="card-subtitle">Mã: ${ctgiayDetail.giay.ma}</h6>
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-6">
                        <div class="white-box text-center"><img
                                src="/img/imgsProducts/${ctgiayDetail.hinhAnh.urlImg0}"
                                class="img-responsive"></div>
                        <br>
                        <div align="center">
                            <a href="/chi-tiet-giay/viewUpdate/${ctgiayDetail.id}" class="btn btn-warning">Update</a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-6">
                        <h4 class="box-title mt-5">Product description</h4>
                        <p>${ctgiayDetail.giay.moTa}</p>
                        <h2 class="mt-5">
                            ${ctgiayDetail.giaBan} VNĐ<small class="text-success"></small>
                        </h2>
                        <h3 class="box-title mt-5">General Info</h3>
                        <div class="table-responsive">
                            <table class="table table-striped table-product">
                                <tbody>
                                <tr>
                                    <td width="390">Hãng</td>
                                    <td>${ctgiayDetail.hang.ten}</td>
                                </tr>
                                <tr>
                                    <td>Màu Sắc</td>
                                    <td>${ctgiayDetail.mauSac.ten}</td>
                                </tr>
                                <tr>
                                    <td>Size</td>
                                    <td>${ctgiayDetail.size.soSize}</td>
                                </tr>
                                <tr>
                                    <td>Chất Liệu Thân Giày</td>
                                    <td>${ctgiayDetail.chatLieuThanGiay.ten}</td>
                                </tr>
                                <tr>
                                    <td>Chất Liệu Đế Giày</td>
                                    <td>${ctgiayDetail.chatLieuDeGiay.ten}</td>
                                </tr>
                                <tr>
                                    <td>Trọng Lượng</td>
                                    <td>${ctgiayDetail.trongLuong}</td>
                                </tr>
                                <tr>
                                    <td>Giá Nhập</td>
                                    <td>${ctgiayDetail.giaNhap}</td>
                                </tr>
                                <tr>
                                    <td>Năm Sản Xuất</td>
                                    <td>${ctgiayDetail.namSanXuat}</td>
                                </tr>
                                <tr>
                                    <td>Năm Bảo Hành</td>
                                    <td>${ctgiayDetail.namBaoHanh}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
<style>
    body {
        background-color: #edf1f5;
        margin-top: 20px;
    }

    .card {
        margin-bottom: 30px;
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid transparent;
        border-radius: 0;
    }

    .card .card-subtitle {
        font-weight: 300;
        margin-bottom: 10px;
        color: #8898aa;
    }

    .table-product.table-striped tbody tr:nth-of-type(odd) {
        background-color: #f3f8fa !important
    }

    .table-product td {
        border-top: 0px solid #dee2e6 !important;
        color: #728299 !important;
    }
</style>
</body>
<script src="/js/app.js"></script>
<script type="text/javascript">
    function onScanSuccess(qrCodeMessage) {
        document.getElementById('result').innerHTML = '<span class="result">' + qrCodeMessage + '</span>';
    }

    function onScanError(errorMessage) {
        //handle scan error
    }

    var html5QrcodeScanner = new Html5QrcodeScanner(
        "reader", {fps: 10, qrbox: 250});
    html5QrcodeScanner.render(onScanSuccess, onScanError);
</script>
<script>
    // $('#exampleModal').on('show.bs.modal', function (e) {
    //     var id = $(this).find('.modal-body').html(e.relatedTarget.id);
    // })
    $('.detail').click(function () {
        $(this).find('.modal-body').html(e.relatedTarget.id);
        $.ajax({
            content: 'text/html',
            type: 'GET',
            dataType: "json",
            url: '/chi-tiet-giay/detail',
            data: {
                id: id
            },
            success: function (data) {
                var html_detail = 'id:' + data.id + 'name:' + data.giay.ten
                $('#exampleModal .modal-body').append(html_detail)
                $('#exampleModal').modal('show')
            }
        });
    });
</script>
<script>
    function xacNhan(event) {
        var mes = confirm("Ban có chắc muốn xóa không");
        if (!mes) {
            event.preventDefault();
        }
    }
    function back(){
        window.history.back();
    }
</script>
</html>
