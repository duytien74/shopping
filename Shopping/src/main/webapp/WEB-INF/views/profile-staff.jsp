<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
<form:form action="/shopping/update-staff" method="post" modelAttribute="pfStaff" class="row"
	enctype="multipart/form-data">
	<div class="col-5">
		<div class="text-center">
			<img src="/image/employee/${pfStaff.images}"
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
			<form:input type="text" path="staffID" readonly="true" class="form-control w-100" />
		</div>
		<div class="form-group">
			<label for="usr" class="font-weight-bold">Ngày sinh</label>
			<form:input type="date" path="dateofbirth" class="form-control w-100" />
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