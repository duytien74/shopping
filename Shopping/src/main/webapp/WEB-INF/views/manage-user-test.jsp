<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <div class="container mb-5">
            <div class="row mt-5">
                <div class="col-5">
                    <div class="card tk-card">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-lg-5 text-center">
                                    <h1 class="bi bi-person-circle img-icon" style="color:darkslateblue"></h1>
                                </div>
                                <div class="col-lg-7 mt-lg-4">
                                    <h2 class="card-title">500</h2>
                                    <h5 class="card-subtitle mb-2 text-muted">Tổng người dùng</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <div class="col-5">
                    <div class="card tk-card">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-lg-5 text-center">
                                    <h1 class="bi bi-person-check-fill img-icon" style="color:rgb(147, 147, 13)"></h1>
                                </div>
                                <div class="col-lg-7 mt-lg-4">
                                    <h2 class="card-title">5</h2>
                                    <h5 class="card-subtitle mb-2 text-muted">Tổng quản trị viên</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container pt-5" style="border-top: 3px solid black;">
            <div class="table-responsive mt-0 mb-0">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2 class="text-uppercase font-weight-bold">Quản lí người dùng</h2>
                            </div>
                            <div class="col-sm-7">
                                <div class="row">
                                    <button class="btn btn-warning ml-auto text-uppercase font-weight-bold" data-toggle="modal" data-target="#fixUser"><i class="bi bi-plus-circle-fill"></i>Thêm người dùng mới</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Họ và tên</th>
                                <th>Mã đăng nhập</th>
                                <th>Email</th>
                                <th>SĐT</th>
                                <th>Chỉnh sửa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a href="#"><img src="/image/me.jpg" class="avatar" alt="Avatar"> Nguyễn Lê Duy Tiến</a>
                                </td>
                                <td>tien123</td>
                                <td>tiennldps16590@fpt.edu.vn</td>
                                <td>0974483670</td>
                                <td>
                                    <a href="#fixUser" data-toggle="modal" class="settings" title="Settings" data-toggle="tooltip"><i class="bi bi-pen-fill"></i></a>
                                    <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="bi bi-trash-fill"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a href="#"><img src="/image/me.jpg" class="avatar" alt="Avatar"> Nguyễn Lê Duy Tiến</a>
                                </td>
                                <td>tien123</td>
                                <td>tiennldps16590@fpt.edu.vn</td>
                                <td>0974483670</td>
                                <td>
                                    <a href="#fixUser" data-toggle="modal" class="settings" title="Settings" data-toggle="tooltip"><i class="bi bi-pen-fill"></i></a>
                                    <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="bi bi-trash-fill"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a href="#"><img src="/image/me.jpg" class="avatar" alt="Avatar"> Nguyễn Lê Duy Tiến</a>
                                </td>
                                <td>tien123</td>
                                <td>tiennldps16590@fpt.edu.vn</td>
                                <td>0974483670</td>
                                <td>
                                    <a href="#fixUser" data-toggle="modal" class="settings" title="Settings" data-toggle="tooltip"><i class="bi bi-pen-fill"></i></a>
                                    <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="bi bi-trash-fill"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a href="#"><img src="/image/me.jpg" class="avatar" alt="Avatar"> Nguyễn Lê Duy Tiến</a>
                                </td>
                                <td>tien123</td>
                                <td>tiennldps16590@fpt.edu.vn</td>
                                <td>0974483670</td>
                                <td>
                                    <a href="#fixUser" data-toggle="modal" class="settings" title="Settings" data-toggle="tooltip"><i class="bi bi-pen-fill"></i></a>
                                    <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="bi bi-trash-fill"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a href="#"><img src="/image/me.jpg" class="avatar" alt="Avatar"> Nguyễn Lê Duy Tiến</a>
                                </td>
                                <td>tien123</td>
                                <td>tiennldps16590@fpt.edu.vn</td>
                                <td>0974483670</td>
                                <td>
                                    <a href="#fixUser" data-toggle="modal" class="settings" title="Settings" data-toggle="tooltip"><i class="bi bi-pen-fill"></i></a>
                                    <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="bi bi-trash-fill"></i></a>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Trang trước</a></li>
                            <li class="page-item"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item active"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Trang sau</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

	<jsp:include page="modal-user.jsp"></jsp:include>


        