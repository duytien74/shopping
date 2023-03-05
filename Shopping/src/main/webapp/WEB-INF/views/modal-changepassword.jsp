<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <!-- Đổi password -->
    <div class="modal fade" id="changePass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center" style="border-bottom: none !important;">
                    <h5 class="modal-title w-100 font-weight-bold text-uppercase" style="font-size: 30px;" id="exampleModalLabel">Đổi mật khẩu</h5>
                    <button type="button" class="close" style="font-size:30px;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <form action="/shopping/change-password" method="post">
                            <div class="form-group">
                                <label for="usr" class="font-weight-bold">Mật khẩu hiện tại</label>
                                <input type="password" name="passnow" class="form-control lg-input pt-3 pb-3" placeholder="Nhập tài khoản" id="usr">
                            </div>
                            <div class="form-group">
                                <label for="pwd" class="font-weight-bold">Mật khẩu mới</label>
                                <input type="password" name="passnew" class="form-control lg-input pt-3 pb-3" placeholder="Nhập mật khẩu mới" id="pwd">
                            </div>
                            <div class="form-group">
                                <label for="pwd" class="font-weight-bold">Mật khẩu xác nhận</label>
                                <input type="password" name="passcon" class="form-control lg-input pt-3 pb-3" placeholder="Nhập mật khẩu xác nhận" id="pwd">
                            </div>
                            <div class="row pt-5 pb-5 justify-content-center">
                                <button class="btn btn-primary w-100 lg-btn">Xác nhận đổi</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>