<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var = "staff" scope = "session" value = "${sessionScope.staff}"/>
<c:set var = "customer" scope = "session" value = "${sessionScope.customer}"/>    
    <!-- Chỉnh sửa -->
	<div class="modal fade bd-example-modal-lg" id="profile" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h2 class="modal-title font-weight-bold" id="exampleModalLongTitle">Thông tin người dùng</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
                </div>
                <div class="model-body pt-5 pb-5">
                    <div class="container">
                        <c:choose>
							<c:when test="${staff != null}">
								<jsp:include page="profile-staff.jsp"></jsp:include>
							</c:when>
							<c:otherwise>
								<jsp:include page="profile-customer.jsp"></jsp:include>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
