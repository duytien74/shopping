<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="container bg-white"
	style="height: 380px; overflow-y: scroll">
	<c:choose>
		<c:when test="${sessionScope.countItem != 0}">
			<table class="table table-hover ">
				<thead class="sticky-top bg-white">
					<tr class="text-center">
						<th scope="col"></th>
						<th scope="col">Tên</th>
						<th scope="col">Số lượng</th>
						<th scope="col">Giá</th>
						<th scope="col">Tổng</th>
					</tr>
				</thead>
				<tbody class="p-5">					
					<c:forEach var="cart" items="${sessionScope.cartItem}">
						<tr>
							<form action="">
								<td><a href="/shopping/package/remove/${cart.productID}"><i
										class=" bi bi-x-circle-fill"></i></a></td>
								<td><a href="#"><img src="/image/product/${cart.images}"
										class="w-25 h-25" alt="Avatar"> ${cart.productName}</a></td>
								<td><input type="number" class="text-center"
									value="${cart.quantity}"></td>
								<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.price}"/>đ</td>
								<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.price * cart.quantity}"/>đ</td>
							</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<h4 class="text-center">Chưa có sản phẩm nào</h4>
		</c:otherwise>
	</c:choose>
</div>
