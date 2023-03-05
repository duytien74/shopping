<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
    <!-- Chỉnh sửa -->
	<div class="modal fade bd-example-modal-lg" id="mnProduct" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h2 class="modal-title font-weight-bold" id="exampleModalLongTitle">Thông tin sản phẩm</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
                </div>
                <div class="model-body pt-5 pb-5">
                    <div class="container">
					<form:form action="/shopping/manage-update-item?p=${p}" method="post"
						modelAttribute="mnProduct" class="row"
						enctype="multipart/form-data">
						<div class="col-5">
							<div class="text-center">
								<img src="/image/product/${mnProduct.images}"
									class="avatar img-circle img-thumbnail" alt="avatar">
								<h6>Upload a different photo...</h6>
								<input type="file" name="image"
									class="text-center center-block file-upload">
							</div>

						</div>
						<div class="col-7">

							<div class="form-group">
								<label for="usr" class="font-weight-bold">Mã sản phẩm</label>
								<form:input type="text" readonly="${mnProduct.productID == null ? false : true}" path="productID"
									class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">Tên sản phẩm</label>
								<form:input type="text"  path="productName"
									class="form-control w-100" />
							</div>
							<div class="form-group">
								<label for="usr" class="font-weight-bold">Giá</label>
								<form:input type="text"  path="price"
									class="form-control w-100" />
							</div>
							<div class="form-group ${mnProduct.productID == null ? 'row' : ''}">
								<label for="colFormLabelLg"
										class="col-sm-12 col-form-label col-form-label-lg font-weight-bold">Loại</label>
									
								<c:choose>
									<c:when test="${mnProduct.productID == null}">
										<div class="col-sm-12 w-100">
											<form:select path="category" cssClass="w-50 p-2">
												<form:options items="${category}" itemValue="categoryID"
													itemLabel="categoryName"></form:options>
												<br>
											</form:select>
										</div>
									</c:when>
									<c:otherwise>
										<input type="text" readonly="readonly"  value="${mnProduct.category.categoryName}" class="form-control w-100" />
									</c:otherwise>
								</c:choose>
							</div>
							<div class="form-group ${mnProduct.productID == null ? 'row' : ''}">
								<label for="colFormLabelLg"
										class="col-sm-12 col-form-label col-form-label-lg font-weight-bold">Hãng</label>		
									<c:choose>
										<c:when test="${mnProduct.productID == null}">
											<div class="col-sm-12 w-100">
												<form:select path="manufacturer" cssClass="w-50 p-2">
													<form:options items="${manufacturer}"
														itemValue="manufacturerID" itemLabel="manufacturerName"></form:options>
													<br>
												</form:select>
											</div>
										</c:when>
										<c:otherwise>
											<input type="text" readonly="readonly"  value="${mnProduct.manufacturer.manufacturerName}" class="form-control w-100" />
										</c:otherwise>
									</c:choose>
							</div>

							<div class="form-group">
								<label for="usr" class="font-weight-bold">Ngày sản xuất</label>
								<form:input type="date" path="dateStart"
									class="form-control w-100" />
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