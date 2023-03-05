<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var = "staff" scope = "session" value = "${sessionScope.staff}"/>
<c:set var = "customer" scope = "session" value = "${sessionScope.customer}"/>        
		<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color:rgb(0,191,255);">
			<c:choose>
				<c:when test="${staff == null}">
				<button class="navbar-toggler" id="menuside1">
					<span class="navbar-toggler-icon"></span>
				</button>
		</c:when>
			</c:choose>
            
            <a class="navbar-brand" href="/shopping/main"><img src="/image/logo.jpg" width="70" height="70" alt="" class="rounded-circle"></a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav nav-uppercase mr-auto mt-2 mt-lg-0 mainMenu ">
                    <li class="nav-item">
                        <button class="btn btn-primary" style="background-color:rgb(0,191,255);" id="menuside2">
                            <i class="bi bi-list"  ></i>
                        </button>
                    </li>
                    <c:choose>
						<c:when test="${staff == null}">
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/shopping/maintop10">Trang chủ <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link text-white" href="/shopping/all">Tất cả</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Phân loại</a>
                        <div class="dropdown-menu">
                            <c:forEach var="category" items="${categoryMenu}">
								<a class="dropdown-item" href="/shopping/category/${category.categoryID}">${category.categoryName}</a>
							</c:forEach>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hãng sản xuất</a>
                        <div class="dropdown-menu">
                            <c:forEach var="manufacturer" items="${manufacturerMenu}">
								<a class="dropdown-item" href="/shopping/manufacturer/${manufacturer.manufacturerID}">${manufacturer.manufacturerName}</a>
							</c:forEach>
                        </div>
                    </li>
                    </c:when>
                    </c:choose>
                    <c:choose>
						<c:when test="${staff != null}">
							<li class="nav-item dropdown">
		                        <a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Quản lý</a>
		                        <div class="dropdown-menu">
		                        	<a class="dropdown-item" href="/shopping/history-bill-staff">Đơn hàng</a>
		                        	<a class="dropdown-item" href="/shopping/manage-item">Sản phẩm</a>
		                            <a class="dropdown-item" href="/shopping/manage-customer">Khách hàng</a>
		                            <c:choose>
										<c:when test="${staff.isadmin == true}">
											<a class="dropdown-item" href="/shopping/manage-staff">Nhân viên</a>		                            
		                            		<a class="dropdown-item" href="/shopping/manage-money">Doanh thu</a>
										</c:when>
		                            </c:choose>
		                        </div>
		                    </li>
						</c:when>
					</c:choose>
                </ul>
                
                 
                <ul class="navbar-nav nav-uppercase mr-auto mt-2 mt-lg-0 mainMenu ">
					<c:choose>
					<c:when test="${staff == null && customer == null}">
						<li class="nav-item ">
                        	<a class="nav-link text-white dn" href="#exampleModal" data-toggle="modal">Đăng nhập </a>
                    	</li>
                    	<li class="nav-item ">
                        	<a class="nav-link text-white dn" href="${sessionScope.registerCustomer == null ? '#register' : '#confirm'}" data-toggle="modal">Đăng kí</a>
                    	</li>
					</c:when>
					<c:otherwise>
							<li class="nav-item dropdown">
                        		<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        			<i class="bi bi-person-lines-fill"></i> ${staff != null ? staff.staffName : customer.customerName}
                        		</a>
		                        <div class="dropdown-menu">
		                            <a class="dropdown-item" href="#profile" data-toggle="modal">Cập nhật hồ sơ</a>
		                            <a class="dropdown-item" href="#changePass" data-toggle="modal">Đổi mật khẩu</a>
		                            <c:choose>
										<c:when test="${staff == null}">
		                            <a class="dropdown-item" href="/shopping/history-bill-customer">Lịch sử đặt hàng</a>
		                            	</c:when>
		                            </c:choose>	
		                            <a class="dropdown-item" href="/shopping/logout">Đăng xuất</a>
		                        </div>
                    		</li>
					</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staff == null}">
							<li class="nav-item ">
		                        <button class="btn btn-info font-weight-bold text-white btn-cart" id="cartButton" style="background-color:rgb(0,191,255)">
		                    	Giỏ hàng&nbsp;/&nbsp;<i class="bi bi-cart4"><span class="badge badge-warning">${sessionScope.countItem}</span></i>
		                		</button>
		                    </li>
						</c:when>
					</c:choose>
					 
                </ul>
            </div>
        </nav>