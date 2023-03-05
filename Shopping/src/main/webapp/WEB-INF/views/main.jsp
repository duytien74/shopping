<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"">
<title>Shopping Spring Boot</title>   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/carousel.css">
    <link rel="stylesheet" href="/css/numberBox.css">

	<link rel="stylesheet" href="/css/template.css">
</head>
<script type="text/javascript">
	var message ='${param.message}';
	if(	message.length > 0 ){
		alert(message);
	}
	
	var notice ='${notice}';
	if(	notice.length > 0 ){
		alert(notice);
	}
	
	var openregister = '${openregister}';
	if(openregister.length > 0){
		$(window).on('load', function() {
	        $('#register').modal('show');
	    });
	}
	
	var openconfirm = '${openconfirm}';
	if(openconfirm.length > 0){
		$(window).on('load', function() {
	        $('#confirm').modal('show');
	    });
	}
	
	var openchangepass = '${openchangepass}';
	if(openchangepass.length > 0){
		$(window).on('load', function() {
	        $('#changePass').modal('show');
	    });
	}
	
	var openforgot = '${openforgot}';
	if(openforgot.length > 0){
		$(window).on('load', function() {
	        $('#forgotPass').modal('show');
	    });
	}
	
	var openbilldetail = '${openbilldetail}';
	if(openbilldetail.length > 0){
		$(window).on('load', function() {
	        $('#bill-detail').modal('show');
	    });
	}
	
	var openManageCS = '${openManageCS}';
	if(openManageCS.length > 0){
		$(window).on('load', function() {
	        $('#mnCustomer').modal('show');
	    });
	}
	
	var openManageST = '${openManageST}';
	if(openManageST.length > 0){
		$(window).on('load', function() {
	        $('#mnStaff').modal('show');
	    });
	}
	
	var openManageIT = '${openManageIT}';
	if(openManageIT.length > 0){
		$(window).on('load', function() {
	        $('#mnProduct').modal('show');
	    });
	}

</script>

<body>
	<header>
		<!-- Sidebar navigation -->
        <div id="overplay"></div>
        <jsp:include page="menu-left.jsp"></jsp:include>
        <jsp:include page="menu-right.jsp"></jsp:include>
        <jsp:include page="menu-main.jsp"></jsp:include>
	</header>
	<section class="position-trans">
			<jsp:include page="${views}"></jsp:include>
	</section>
	<section >
			<jsp:include page="footer.jsp"></jsp:include>
	</section>
	<jsp:include page="login.jsp"></jsp:include>
	<jsp:include page="register.jsp"></jsp:include>
	<jsp:include page="confirm.jsp"></jsp:include>
	<jsp:include page="modal-changepassword.jsp"></jsp:include>
	<jsp:include page="modal-profile.jsp"></jsp:include>
	<jsp:include page="modal-forgot.jsp"></jsp:include>
	<jsp:include page="modal-billdetail.jsp"></jsp:include>
	<jsp:include page="modal-manage-customer.jsp"></jsp:include>
	<jsp:include page="modal-manage-staff.jsp"></jsp:include>
	<jsp:include page="modal-manage-item.jsp"></jsp:include>
</body>
	<script type="text/javascript" src="/js/carousel.js"></script>
	<script type="text/javascript" src="/js/number.js"></script>
	<script type="text/javascript" src="/js/template.js"></script>
</html>