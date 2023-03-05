<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>        
<div class="container-fluid p-5">
            <div class="row  bg-transparent">
                <h2 class=" pb-2">
                    <a href="/shopping/maintop10" class="text-danger">Trang chủ</a> / Giỏ hàng của bạn</h2>
            </div>
            <div class="row">
                <div class="col-7">
                    <jsp:include page="package-table.jsp"></jsp:include>
                </div>
                <div class="col-5" style="border-left: 1px solid rgb(189, 185, 185);">
                    <jsp:include page="package-infor.jsp"></jsp:include>
                </div>
            </div>
        </div>