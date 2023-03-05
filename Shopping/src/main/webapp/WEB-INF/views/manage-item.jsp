<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<div class="container mt-5 mb-5">
            <h2 class="ml-5"><a class="back-to-menu" href="">Trang chủ</a> / Quản lý sản phẩm</h2>
            <div class="row mt-5">
                <a href="/shopping/manage-item-modal?p=${page.number}" class="btn btn-warning font-weight-bold pt-2 pb-2 ml-auto"><i class="bi bi-plus-circle-fill"></i> Thêm sản phẩm mới</a>
            </div>
            <div class="row mt-3 mb-3">
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
                            <th scope="col">Hãng</th>
                            <th scope="col">Loại</th>
                            <th scope="col">Ngày sản xuất</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pr" items="${page.content}">
                        	<tr>
	                            <th scope="row">${pr.productID}</th>
								<td style="width:250px;">
									<span><img src="/image/product/${pr.images}" class="w-25 h-25 rounded-circle" alt="Avatar"></span> 
									${pr.productName}
								</td>
								<td>${pr.price}</td>
								<td>${pr.category.categoryName}</td>
	                            <td>${pr.manufacturer.manufacturerName}</td>							
	                            <td>${pr.dateStart}</td>
	                            <td >
	                                <a href="/shopping/manage-item-modal?productID=${pr.productID}&p=${page.number}" class="btn btn-warning font-weight-bold"><i class="bi bi-pencil-fill"></i></a>
	                                <a href="/shopping/manage-item-delete?productID=${pr.productID}&p=${page.number}" class="btn btn-danger font-weight-bold"><i class="bi bi-trash-fill"></i></a>
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
                            <li class="page-item"><a class="page-link" href="/shopping/manage-item?p=0">Trang đầu</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-item?p=${page.number -1 <=0 ? 0 : page.number -1}">Trang trước</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-item?p=${page.number +1 >= page.totalPages -1 ? page.totalPages -1 : page.number +1}">Trang sau</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-item?p=${page.totalPages -1}">Trang cuối</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>    