<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- form xác nhận -->
    <div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center" style="border-bottom: none !important;">
                    <h5 class="modal-title w-100 font-weight-bold text-uppercase" style="font-size: 30px;" id="exampleModalLabel">Xác nhận đăng ký</h5>
                    <button type="button" class="close" style="font-size:30px;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <form action="/shopping/confirm" method="post">
                            <div class="form-group">
                                <label for="usr" class="font-weight-bold">Mã xác thực</label>
                                <input type="text" name="userCode" class="form-control lg-input pt-3 pb-3" placeholder="Nhập mã xác thực" id="usr">
                            </div>

                            <div class="row pt-5 pb-5 justify-content-center">
                                <div class="col-6">
                                	<button class="btn btn-primary w-100 lg-btn">Xác nhận</button>
                                </div>
                                <div class="col-6">
                                	<button class="btn btn-primary cf-btn w-100 " formaction="/shopping/disconfirm" formmethod="post">Hủy bỏ</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>