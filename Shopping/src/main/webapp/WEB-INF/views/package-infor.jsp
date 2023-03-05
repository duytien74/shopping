<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "staff" scope = "session" value = "${sessionScope.staff}"/>
<c:set var = "customer" scope = "session" value = "${sessionScope.customer}"/>
<c:set var="totalPrice" scope="request" value="${sessionScope.totalItem}" />
<c:set var="promotionCode" scope="request" value="${sessionScope.promotionCode}" />
<div class="container orderinfor  bg-white pt-3 pb-3 w-100 h-100 pl-3">
	<div class="row justify-content-center">
		<h2 class="text-center">Thông tin bắt buộc</h2>
	</div>
	<ul class="list-group  w-100">
		<c:choose>
			<c:when test="${staff == null && customer == null}">
				<a href="#exampleModal" data-toggle="modal">Vui lòng đăng nhập</a>
			</c:when>
			<c:otherwise>
				<li class="list-group-item">
					<div class="row">
						<div class="col-4">
							<div class="row">
								<span class="text-muted">Địa chỉ</span>
							</div>
						</div>
						<div class="col-8">
							<div class="row">
								<span class="ml-auto font-weight-bold">${staff != null ? staff.addresss : customer.addresss}&nbsp;&nbsp;</span> <a href="#profile"
									data-toggle="modal">Thay đổi</a>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="row">
						<div class="col-4">
							<div class="row">
								<span class="text-muted">Số điện thoại</span>
							</div>
						</div>
						<div class="col-8">
							<div class="row">
								<span class="ml-auto font-weight-bold">${staff != null ? staff.phone : customer.phone}&nbsp;&nbsp;</span>
								<a href="#profile" data-toggle="modal">Thay đổi</a>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="row">
						<div class="col-4">
							<div class="row">
								<span class="text-muted">Tên người nhận</span>
							</div>
						</div>
						<div class="col-8">
							<div class="row">
								<span class="ml-auto font-weight-bold">${staff != null ? staff.staffName : customer.customerName}&nbsp;&nbsp;</span> 
								<a href="#profile" data-toggle="modal">Thay
									đổi</a>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="row">
						<div class="col-4">
							<div class="row">
								<span class="text-muted">Phiếu giảm giá</span>
							</div>
						</div>
						<div class="col-8">
							<div class="row">
								<c:choose>
									<c:when test="${promotionCode != null}">
										<span class="ml-auto font-weight-bold">Đã giảm ${promotionCode.discount * 100}% tổng đơn hàng</span>
									</c:when>
									<c:otherwise>
										<a class="ml-auto" data-toggle="collapse" href="#boxdiscount"
										role="button" aria-expanded="false"
										aria-controls="collapseExample"> Bạn có mã giảm giá? </a>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
					<div class="row mt-2">
						<div class="collapse w-100" id="boxdiscount">
							<form action="/shopping/bill-promotion" method="post">
								<div class="form-group">
									<input type="text" value="${promotionCode.promotionID}" name="promotionCode"
										class="form-control w-100"
										placeholder="Nhập mã giảm giá của bạn">
								</div>
								<div class="form-group">
									<button class="btn btn-success ml-auto w-100 text-uppercase font-weight-bold">
									Áp dụng</button>
								</div>
							</form>
						</div>
					</div>
				</li>
			</c:otherwise>
		</c:choose>


	</ul>
	<div class="row ml-3  mt-2">
		
		<h4>Tổng tiền: 
		<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${promotionCode != null ? totalPrice - (totalPrice * promotionCode.discount) : totalPrice}"/>đ</h4>
	</div>
	<div class="row  mt-2 pl-3 pr-3">
		<form action="/shopping/bill-order" method="post" class="w-100">
			<button formaction="/shopping/bill-order" formmethod="post" class="btn btn-warning w-100 pr-5 pl-5 text-uppercase font-weight-bold">
				Đặt hàng</button>
		</form>
	</div>
</div>