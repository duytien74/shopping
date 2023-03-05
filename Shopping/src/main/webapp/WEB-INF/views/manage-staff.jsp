<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<div class="container mt-5 mb-5">
            <h2 class="ml-5"><a class="back-to-menu" href="">Trang chủ</a> / Quản lý nhân viên</h2>
            <div class="row mt-5">
                <a href="/shopping/manage-staff-modal?p=${page.number}" class="btn btn-warning font-weight-bold pt-2 pb-2 ml-auto"><i class="bi bi-plus-circle-fill"></i> Thêm nhân viên mới</a>
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
                            <th scope="col">Tên đăng nhập</th>
                            <th scope="col">Họ tên</th>
                            <th scope="col">Vai trò</th>
                            <th scope="col">SĐT</th>
                            <th scope="col">Email</th>
                            <th scope="col">Ngày sinh</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="staff" items="${page.content}">
                        	<tr>
	                            <th scope="row">${staff.staffID}</th>
								<td style="width:250px;">
									<span><img src="/image/employee/${staff.images}" class="w-25 h-25 rounded-circle" alt="Avatar"></span> 
									${staff.staffName}
								</td>
								<th scope="col">${staff.isadmin == false ? 'Nhân viên' : 'Quản trị viên'}</th>
								<td>${staff.phone}</td>
	                            <td>${staff.email}</td>
	                            <td>${staff.dateofbirth}</td>
	                            <td >
	                                <a href="/shopping/manage-staff-modal?staffID=${staff.staffID}&p=${page.number}" class="btn btn-warning font-weight-bold"><i class="bi bi-pencil-fill"></i></a>
	                                <a href="/shopping/manage-staff-delete?staffID=${staff.staffID}&p=${page.number}" class="btn btn-danger font-weight-bold"><i class="bi bi-trash-fill"></i></a>
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
                            <li class="page-item"><a class="page-link" href="/shopping/manage-staff?p=0">Trang đầu</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-staff?p=${page.number -1 <=0 ? 0 : page.number -1}">Trang trước</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-staff?p=${page.number +1 >= page.totalPages -1 ? page.totalPages -1 : page.number +1}">Trang sau</a></li>
                            <li class="page-item"><a class="page-link" href="/shopping/manage-staff?p=${page.totalPages -1}">Trang cuối</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>    