<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
		<div id="sidebarright">
            <div class="container w-100 h-100 pl-3 pt-3" style="overflow-y: scroll;">
                <div class="row mt-3 justify-content-center">
                    <h2 class="text-center">Giỏ hàng</h2>
                </div>
				<c:choose>
					<c:when test="${sessionScope.countItem != 0}">
						<ul class="list-group  w-100">  
	                    <c:forEach var="cart" items="${sessionScope.cartItem}">
							<li class="list-group-item ">
	                        <div class="row">
	                            <div class="col-4">
	                                <img src="/image/product/${cart.images}" class="w-100 h-50">
	                            </div>
	                            <div class="col-6">
	                                <p>Bàn phím cơ ${cart.productName}</p>
	                                <span><span class="text-muted">${cart.quantity}</span> x <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.price}"/>đ</span>
	                            </div>
	                            <div class="col-2">
	                                <a href="/shopping/cart/remove/${cart.productID}" style="font-size:150%;"><i class="bi bi-x-circle-fill"></i></a>
	                            </div>
	                        </div>
	                    </li>
					</c:forEach>
                    
                	</ul>
                <div class="row justify-content-center mt-3">
                    <a href="/shopping/package-product" class="btn btn-primary pr-5 pl-5 text-uppercase font-weight-bold">
                    	Xem giỏ hàng
                   	</a>
                </div>
					</c:when>
					<c:otherwise>
							<h4 class="text-center">Chưa có sản phẩm nào</h4>
					</c:otherwise>
				</c:choose>
	</div>
        </div>