<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
		<div class="container mt-5 mb-5">
            <h2 class="ml-5"><a class="back-to-menu" href="">Trang chủ</a> / Thống kê doanh thu</h2>
            <div class="row mb-3 mt-5">
                <div class="col-5">
                    <div class="card tk-card">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-lg-5 text-center">
                                    <h1 class="bi bi-cash-coin img-icon" style="color:darkslateblue"></h1>
                                </div>
                                <div class="col-lg-7 mt-lg-4">
                                    <h2 class="card-title"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${total}"/>đ</h2>
                                    <h5 class="card-subtitle mb-2 text-muted">Tổng doanh thu</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row mt-5 mb-3">
                <div class="col-6">
                    <form class="form-inline">
                        <div class="form-group mx-sm-3 mb-2">
                            <input type="password" class="form-control" id="inputPassword2" placeholder="Tìm kiếm theo tên">
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
                            <th scope="col">Mã</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Bán được</th>
                            <th scope="col">Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pr" items="${page.content}">
                        	<tr>
	                            <th scope="row">${pr.group.productID}</th>
								<td style="width:250px;">
									<span><img src="/image/product/${pr.group.images}" class="w-25 h-25 rounded-circle" alt="Avatar"></span> 
									${pr.group.productName}
								</td>
								<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${pr.group.price}"/>đ</td>
								<td>${pr.count}</td>
	                            <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${pr.total}"/>đ</td>							
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
                            <li class="page-item"><a class="page-link" href="/shopping/manage-money?p=0">Trang đầu</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-money?p=${page.number -1 <=0 ? 0 : page.number -1}">Trang trước</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-money?p=${page.number +1 >= page.totalPages -1 ? page.totalPages -1 : page.number +1}">Trang sau</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-money?p=${page.totalPages -1}">Trang cuối</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>    