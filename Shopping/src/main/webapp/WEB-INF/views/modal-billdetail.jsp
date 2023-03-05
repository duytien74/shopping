<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal fade bd-example-modal-lg" id="bill-detail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel">Chi tiết đơn hàng</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                    	<div class="col-8">
                    		<h6 class="row w-100 ml-3">Người nhận: ${bill.customer.customerName}</h6>
		                    <h6 class="row w-100 ml-3">Số điện thoại: ${bill.customer.phone}</h6>
		                    <h6 class="row w-100 ml-3">Địa chỉ: ${bill.customer.addresss}</h6>
		                    <h6 class="row w-100 ml-3">Ngày đặt: ${bill.billdate}</h6>
		                    <h5 class="row w-100 ml-3">Tổng cộng:<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${bill.totalPrice}"/>đ</h5>
                    	</div>
                    	<div class="col-4">
                    		<c:choose>
								<c:when test="${staff != null && bill.status.statusID == 0}">
									<a href="/shopping/history-bill-update?billID=${bill.billID}&p=${p}" class="btn btn-danger text-white w-100 font-weight-bold pt-3 pb-3" >
										Duyệt hàng
									</a>	
								</c:when>
							</c:choose>
                    		
                    	</div>
                    </div>
                    
					<div class="mt-5 mb-5" style="height:300px;overflow-y: scroll;">
						<table class="table table-hover">
	                        <thead>
	                            <tr class="sticky-top bg-white">
	                                <th scope="col">Mã</th>
	                                <th scope="col">Tên</th>
	                                <th scope="col">Giá</th>
	                                <th scope="col">Số lượng</th>
	                                <th scope="col">Tổng cộng</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach var="billDetail" items="${listBillDetail}">
	                            	<tr>
		                                <th scope="row">${billDetail.product.productID}</th>
		                                <td>
		                                    <a href="#">
		                                    <div class="row">
		                                    	<div class="col-5">
		                                    		<img src="/image/product/${billDetail.product.images}" class="w-100 h-50" alt="Avatar">
		                                    	</div>
		                                    	<div class="col-7">
		                                    		${billDetail.product.category.categoryName} ${billDetail.product.productName}
		                                    	</div>
		                                    </div>
		                                    </a>
		                                </td>
		                                <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${billDetail.price}"/>đ</td>
		                                <td>${billDetail.quantity}</td>
		                                <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${billDetail.totalprice}"/>đ</td>
		                            </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
					</div>
                </div>
            </div>
        </div>
    </div>