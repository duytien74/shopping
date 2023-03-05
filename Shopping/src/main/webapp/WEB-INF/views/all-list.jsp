<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
	<div class="container mb-5">
            <div class="row">
                <div class="col-3">
                    <div class="row pt-5">
                        <h5 class="ml-5"><a class="back-to-menu" href="/shopping/maintop10">Trang chủ</a> / ${categoryTitle}</h5>
                    </div>
                </div>
                <div class="col-9">
                	<div class="row ">
                        <span class="text-muted mt-5">Trang ${page.number+1} trong tổng ${page.totalPages} trang</span>
                    </div>
                    <div class="row justify-content-center">
                        <c:forEach var="product" items="${itemCategory}">
							<div class="col-lg-4 col-xs-12 col-sm-6 col-md-3 ">
	                            <a href="/shopping/detail?productid=${product.productID}">
	                                <div class="card-flyer">
	                                    <div class="text-box">
	                                        <div class="image-box">
	                                            <img src="/image/product/${product.images}" alt="" />
	                                        </div>
	                                        <div class="text-container">
	                                            <p class="card-text type-name"><small class="text-muted">${product.category.categoryName}</small></p>
	                                            <p class="card-text ob-name font-weight-bold">${product.productName}</p>
	                                            <h5 class="card-text"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}"/>đ</h5>
	                                        </div>
	                                    </div>
	                                </div>
	                            </a>
	                        </div>
						</c:forEach>

                    </div>
                    <div class="row mt-5 justify-content-center">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item ">
                                    <a class="page-link" href="/shopping/${urlPaging}?p=0" tabindex="-1">Trang đầu</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="/shopping/${urlPaging}?p=${page.number -1 <= 0 ? 0 : page.number -1}">Trang trước</a></li>
                                <li class="page-item"><a class="page-link" href="/shopping/${urlPaging}?p=${page.number +1 >= page.totalPages -1 ? page.totalPages -1 : page.number +1}">Trang sau</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="/shopping/${urlPaging}?p=${page.totalPages -1}">Trang cuối</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>