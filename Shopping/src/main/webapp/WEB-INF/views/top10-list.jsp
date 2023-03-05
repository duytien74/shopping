<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 	<div class="container mb-5">
            <div class="row mt-5 mb-5">
				<div class="jumbotron jumbotron-fluid p-0">
					<div class="container-fluid pl-0 pr-0">
						<img src="/image/bp2.jpg" class="w-100 h-100" alt="" />
					</div>
				</div>
			</div>
            <div class="row">
                <h1 class="text-center w-100 title-top10">Top10 bán chạy</h1>
                <hr class="dark">
            </div>
            <hr class="dark w-25">
            <div class="row justify-content-center">   
				<c:forEach var="product" items="${item}">
						<div class="col-lg-3 col-xs-12 col-sm-6 col-md-3 ">
	                    <a href="/shopping/detail?productid=${product.group.productID}">
	                        <div class="card-flyer">
	                            <div class="text-box">
	                                <div class="image-box">
	                                    <img src="/image/product/${product.group.images}" alt="" />
	                                </div>
	                                <div class="text-container">
	                                    <p class="card-text type-name"><small class="text-muted">${product.group.category.categoryName}</small></p>
	                                    <p class="card-text ob-name font-weight-bold">${product.group.productName}</p>
	                                    <h5 class="card-text text-lowercase"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.group.price}"/>đ</h5>
	                                    <p class="card-text font-weight-bold text-success">Đã bán: ${product.count}</p>
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
				</c:forEach>
            </div>
        </div>   
