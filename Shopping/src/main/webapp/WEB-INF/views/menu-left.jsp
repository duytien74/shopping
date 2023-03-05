<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
		<div id="sidebar">
            <div class="search row">
                <input type="text" name="" id="" class="search-input" placeholder="Tìm kiếm">
                <button class="btn btn-danger" id="none">
                    <i class="bi bi-search"></i>
                </button>
            </div>
            <a href="/shopping/maintop10" class="sidebar-item ">
                <div >Trang chủ</div>
            </a>
            <a href="/shopping/all" class="sidebar-item ">
                <div >Tất cả</div>
            </a>
            <div >
            	<a class="nav-link dropdown-toggle sidebar-item" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Phân loại</a>
	            <div class="dropdown-menu">
	                <a class="dropdown-item" href="#">Bàn phím cơ</a>
	                <a class="dropdown-item" href="#">Bàn phím văn phòng</a>
	                <a class="dropdown-item" href="#">Bàn phím USB</a>
	                <a class="dropdown-item" href="#">Bàn phím không dây</a>
	            </div>
            </div>
            <div >
            	<a class="nav-link dropdown-toggle sidebar-item" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Hãng sản xuất</a>
	            <div class="dropdown-menu">
	                <a class="dropdown-item" href="#">Akko</a>
	                <a class="dropdown-item" href="#">Asus</a>
	                <a class="dropdown-item" href="#">Cooler Master</a>
	                <a class="dropdown-item" href="#">DeraU</a>
	            </div>
            </div>
            <div >
            	<a class="nav-link dropdown-toggle sidebar-item" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Quản lý</a>
	            <div class="dropdown-menu">
	                <a class="dropdown-item" href="/shopping/manage-user">Người dùng</a>
	                <a class="dropdown-item" href="/shopping/manage-item">Sản phẩm</a>
	                <a class="dropdown-item" href="#">Doanh thu</a>
	            </div>
            </div>
            <div>
            	<a class="nav-link dropdown-toggle sidebar-item" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Tài khoản</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Quên mật khẩu</a>
                            <a class="dropdown-item" href="#">Đổi mật khẩu</a>
                        </div>
            </div>
			<a id="cartButton2" style="color: rgba(56, 53, 53, 0.4);" class="sidebar-item sidebar-cover">
                <div >Giỏ hàng</div>
            </a>
        </div>
