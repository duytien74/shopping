<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Quên mật khẩu -->
    <div class="modal fade" id="forgotPass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center" style="border-bottom: none !important;">
                    <h5 class="modal-title w-100 font-weight-bold text-uppercase" style="font-size: 30px;" id="exampleModalLabel">Lấy lại mật khẩu</h5>
                    <button type="button" class="close" style="font-size:30px;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <form action="/shopping/forgot-password" method="post">
                            <div class="form-group">
                                <label for="usr" class="font-weight-bold">Email của bạn</label>
                                <input type="text" name="email" class="form-control lg-input pt-3 pb-3" placeholder="Nhập email của bạn" id="usr">
                            </div>

                            <div class="row pt-5 pb-5 justify-content-center">
                                <button class="btn btn-primary w-100 lg-btn">Xác nhận</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>