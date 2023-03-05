<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "staff" scope = "session" value = "${sessionScope.staff}"/>
<c:set var = "customer" scope = "session" value = "${sessionScope.customer}"/>
<div class="container mt-5 mb-5">
	<h2 class="ml-5">
		<a class="back-to-menu" href="/shopping/maintop10">Trang chủ</a> / ${billTitle}
	</h2>
	<div class="row mt-5 mb-3">
		<div class="col-6">
			<form class="form-inline">
				<div class="form-group mx-sm-3 mb-2">
					<input type="password" class="form-control" id="inputPassword2"
						placeholder="Tìm kiếm theo tên">
				</div>
				<button type="submit" class="btn btn-primary mb-2">Tìm</button>
			</form>
		</div>
		<div class="col-6">
			<div class="form-group w-50 ml-auto">
				<select class="form-control" id="exampleFormControlSelect1">
					<option>Tất cả</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
	</div>
	<div class="row">
		<table class="table table-hover ">
			<thead>
				<tr>
					<th scope="col">Mã đơn</th>
					<th scope="col">Ngày đặt</th>
					<th scope="col">Người đặt</th>
					<c:choose>
						<c:when test="${staff != null}">
							<th scope="col">Người duyệt</th>	
						</c:when>
					</c:choose>
					<th scope="col">Tổng tiền</th>
					<th scope="col">Khuyến mãi</th>
					<th scope="col">Tình trạng</th>
					<th scope="col">Chi tiết</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bill" items="${page.content}">
					<tr>
						<th scope="row">${bill.billID}</th>
						<td>${bill.billdate}</td>
						<td>${bill.customer.customerID}</td>
						<c:choose>
							<c:when test="${staff != null}">
								<td>${bill.staff != null ? bill.staff.staffID : 'Chưa có'}</td>	
							</c:when>
						</c:choose>
						<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${bill.totalPrice}"/>đ</td>
						<td>${bill.promotion != null ? bill.promotion.discount * 100 : 0}%</td>
						<td class="${bill.status.statusID == 0 ? 'text-danger':'text-success'} font-weight-bold">${bill.status.statusName}</td>
						<td>
							<a href="/shopping/history-bill-detail?billID=${bill.billID}&p=${page.number}&url=${urlbill}" class="btn btn-warning font-weight-bold"><i class="bi bi-pencil-fill"></i></a>
							<c:choose>
								<c:when test="${staff != null}">
									<a href="/shopping/history-bill-delete?billID=${bill.billID}&p=${page.number}" class="btn btn-danger font-weight-bold"><i class="bi bi-trash-fill"></i></a>	
								</c:when>
							</c:choose>
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="col-4">
			<span>Trang ${page.number + 1} trong tổng ${page.totalPages} trang</span>
		</div>
		<div class="col-8">
			<nav aria-label="Page navigation example ml-auto">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="/shopping/${urlbill}?p=0">Trang đầu</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="/shopping/${urlbill}?p=${page.number - 1 <= 0 ? 0 : page.number - 1}">Trang trước</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="/shopping/${urlbill}?p=${page.number + 1 >= page.totalPages - 1 ? page.totalPages - 1 : page.number + 1}">Trang sau</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="/shopping/${urlbill}?p=${page.totalPages}">Trang cuối</a>
					</li>

				</ul>
			</nav>
		</div>
	</div>
</div>