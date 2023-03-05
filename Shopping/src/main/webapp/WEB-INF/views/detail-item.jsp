<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
    <div class="container">
            <div class="row">
                <div class="col-6">
                    <h5><a class="back-to-menu" href="/shopping/main">Trang chủ</a> / ${product.category.categoryName} ${product.productName}</h5>
                </div>
                <div class="col-6"></div>
            </div>
        </div>
        <div class="container-fluid item-detail font-weight-bold " style="color:rgb(80, 82, 77)">
            <div class="container pt-4 pb-5 text-white">
            	<div class="row">
            		 <h5 style="color:green;background:white;">${param.sussces}</h5>
            	</div>
                <div class="row">
		              <form action="/shopping/cart/add/${product.productID}" method="post" class="row w-100 h-100">
						<div class="col-4">
							<img src="/image/product/${product.images}" class="w-100 h-75"
								alt="">
						</div>
						<div class="col-8 pl-5">
							<div class="row w-100">
								<h2 class="w-100 ">${product.category.categoryName} ${product.productName}</h2>
							</div>
							<div class="row w-25 pt-3"
								style="border-top: 3px solid white !important;">
								<h4 class="w-100"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}"/>đ</h4>
							</div>
							<div class="row">
								<h5>Mã sản phẩm: ${product.productID}</h5>
							</div>
							<div class="row">
								<h5>Loại: ${product.category.categoryName}</h5>
							</div>
							<div class="row">
								<h5>Hãng: ${product.manufacturer.manufacturerName}</h5>
							</div>
							<div class="row ">
								<h5>Bảo hành: 24 tháng</h5>
							</div>
							<div class="row">
								<h5>Số lượng:</h5>
							</div>
							<div class="row  p-3">
								<div class="col-lg-5 ">
									<div class="buttons_added">
										<input class="minus is-form" type="button" value="-"> <input
											aria-label="quantity" class="input-qty text-center" 
											min="1" name="quantity" type="number" max="10000000000" value="1"> <input
											class="plus is-form" type="button" value="+">
									</div>
								</div>
								<div class="col-lg-7 ">
									<button class="btn btn-warning font-weight-bold">Thêm vào giỏ hàng</button>
								</div>
							</div>
							<div class="row pt-3"
								style="border-top: 3px solid white !important;">
								<p>Từ khóa: ${product.productName}</p>
							</div>
						</div>
					</form>
                </div>
                <div class="row w-100 mb-5">
                    <hr class="dark w-100 ml-5">
                </div>

                <div class="container">
                    <div class="row">
                        <h3>Sản phẩm tương tự</h3>
                    </div>
                    <div id="carouselExample" class="carousel slide" data-ride="carousel" data-interval="9000">
                        <div class="carousel-inner  row w-100 mx-auto" role="listbox">
                            <c:forEach var="sameproduct" items="${sameProduct}" varStatus="loop">
								<div class="carousel-item mb-5 col-md-3  ${loop.index == 0 ? 'active' : ''}">
	                                <a href="/shopping/detail?productid=${sameproduct.productID}">
	                                    <div class="card-flyer">
	                                        <div class="text-box">
	                                            <div class="image-box">
	                                                <img src="/image/product/${sameproduct.images}" alt="" />
	                                            </div>
	                                            <div class="text-container">
	                                                <p class="card-text type-name"><small class="text-muted">${sameproduct.category.categoryName}</small></p>
	                                                <p class="card-text ob-name font-weight-bold">${sameproduct.productName}</p>
	                                                <h5 class="card-text"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sameproduct.price}"/>đ</h5>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </a>
	                            </div>
							</c:forEach>
                            
                        </div>
                        <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next text-faded" href="#carouselExample" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

            </div>
        </div>
