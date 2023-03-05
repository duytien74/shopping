<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
    <!-- Chỉnh sửa -->
	<div class="modal fade bd-example-modal-lg" id="mnStaff" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h2 class="modal-title font-weight-bold" id="exampleModalLongTitle">Thông tin nhân viên </h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
                </div>
                <div class="model-body pt-5 pb-5">
                    <div class="container">
					<form:form action="/shopping/manage-update-staff" method="post"
						modelAttribute="mnStaff" class="row" enctype="multipart/form-data">
						<div class="col-5">
							<div class="text-center">
								<img src="/image/employee/${mnStaff.images}"
									class="avatar img-circle img-thumbnail" alt="avatar">
								<h6>Upload a different photo...</h6>
								<input type="file" name="image"
									class="text-center center-block file-upload">
							</div>

						</div>
						<div class="col-7">

							<div class="form-group">
								<label for="usr" class="font-weight-bold">Họ và tên</label>
								<form:input type="text" path="staffName"
									class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">Tên đăng nhập</label>
								<form:input type="text" path="staffID" readonly="${mnStaff.staffID == null ? false : true}"
									class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">Mật khẩu</label>
								<form:input type="text" path="pass"
									class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">Ngày sinh</label>
								<form:input type="date" path="dateofbirth"
									class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="colFormLabelLg" class="font-weight-bold">Giới
									tính:</label>
								<div class="col-sm-12 w-100">
									<form:radiobuttons path="gender" cssClass="mr-2 ml-2"
										items="${gender}" />
								</div>
							</div>
							<div class="form-group">
								<label for="colFormLabelLg" class="font-weight-bold">Vai trò:</label>
								<div class="col-sm-12 w-100">
									<form:radiobuttons path="isadmin" cssClass="mr-2 ml-2"
										items="${role}" />
								</div>
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">Email</label>
								<form:input type="text" path="email" class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">SĐT</label>
								<form:input type="text" path="phone" class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">Địa chỉ</label>
								<form:textarea path="addresss" class="form-control"></form:textarea>
							</div>

							<div class="form-group">
								<div class="row justify-content-center">
									<button class="btn btn-primary lg-btn w-75">Chỉnh sửa</button>
								</div>
							</div>

						</div>
					</form:form>
				</div>
                </div>
            </div>
        </div>
    </div>