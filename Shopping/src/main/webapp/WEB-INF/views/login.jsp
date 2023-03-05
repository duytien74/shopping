<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- Login -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center" style="border-bottom: none !important;">
                    <h5 class="modal-title w-100 font-weight-bold text-uppercase" style="font-size: 30px;" id="exampleModalLabel">Đăng nhập</h5>
                    <button type="button" class="close" style="font-size:30px;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <form action="/shopping/login" method="post">
                        	<div class="form-group">
                            	<label for="usr" class="font-weight-bold">Tên đăng nhập</label>
                            	<input type="text" value="${username}" class="form-control lg-input pt-3 pb-3" name="username" placeholder="Nhập tài khoản" id="usr">
                        	</div>
	                        <div class="form-group">
	                            <label for="pwd" class="font-weight-bold">Mật khẩu</label>
	                            <input type="password" value="${password}" class="form-control lg-input pt-3 pb-3" name="password" placeholder="Nhập mật khẩu" id="pwd">
	                        </div>
	                        <div class="form-group">
                                <input type="checkbox" name="remember" value="yes" class="" placeholder="Nhập mật khẩu" id="rem">
                                <label for="pwd" class="font-weight-bold">Nhớ mật khẩu?</label>
                            </div>
                            <div class="row pt-3 pb-3">
	                            <a class="ml-auto mr-3" href="#forgotPass" data-toggle="modal">Quên mật khẩu?</a>
	                        </div>
	                        <div class="row pt-5 pb-5 justify-content-center">
	                            <button class="btn w-100 lg-btn text-white">Đăng nhập</button>
	                        </div>
                        
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <h6>Chưa có tài khoản?
                        <a href="${sessionScope.registerCustomer == null ? '#register' : '#confirm'}" data-toggle="modal">Đăng ký ngay</a>
                    </h6>
                </div>
            </div>
        </div>
    </div>
