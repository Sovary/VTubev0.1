<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		
		<c:set value="${requestScope.isCreate }" var="isCreate"></c:set>
		<c:set value="${requestScope.updatePassToFormAdminMainCate }" var="updatePassToFormAdminMainCate"></c:set>
		<c:if test="${updatePassToFormAdminMainCate.main_cate_id==0 }">
			<c:redirect url="listmaincate"></c:redirect>
		</c:if>
		
		
		<title>Dashboard - Main Category</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- Require all pages -->
		<link rel="icon" href="../../assets/images/vtube.png" type="image/png" >
		<link rel="stylesheet" href="../../assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../../assets/css/font-awesome.css" />		
		<link rel="stylesheet" href="../../assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="../../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<!-- /.Require all pages -->
		<!-- sweet alert -->
		<link rel="stylesheet" type="text/css" href="../../assets/css/sweetalert/sweetalert.css">
		<script src="../../assets/js/sweetalert/sweetalert.min.js"></script>
		<style type="text/css">
		.navbar{
			background:#43B8B9;
		}
		input[type=checkbox].ace.ace-switch.ace-switch-6:checked + .lbl::before{
			background-color: #31A7B1;
		}
		input[type=checkbox].ace.ace-switch.ace-switch-6 + .lbl::before{
			background-color: #C10F0F;
		}
		</style>
	</head>

	<body class="no-skin">
		<!-- add header -->
		<jsp:include page="/admin/include/header.jsp"></jsp:include>
		
		
		<div class="main-container" id="main-container">
		<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive sidebar-fixed sidebar-scroll">
				
				<ul class="nav nav-list">
					<li class="">
						<a href="dashboard">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>

						<b class="arrow"></b>
					</li>

					<li class="active">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-sitemap"></i>
							<span class="menu-text">
								Main Categories
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<c:if test="${infoAdmin.user_type==1 }">
							<li class="active">
								<a href="addmaincate">
									<i class="menu-icon fa fa-caret-right"></i>

									Create main category
								</a>

								<b class="arrow"></b>
							</li>
							
							</c:if>
							<li class="">
								<a href="listmaincate">
									<i class="menu-icon fa fa-caret-right"></i>
									List main categories
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> Sub Categories </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						<c:if test="${infoAdmin.user_type==1 }">
							<li class="">
								<a href="addsubcate">
									<i class="menu-icon fa fa-caret-right"></i>
									Create sub category
								</a>

								<b class="arrow"></b>
							</li>
						</c:if>

							<li class="">
								<a href="listsubcate">
									<i class="menu-icon fa fa-caret-right"></i>
									List sub categories
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-video-camera"></i>
							<span class="menu-text"> Video </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="addvdolink">
									<i class="menu-icon fa fa-caret-right"></i>
									Add video by link
								</a>

								<b class="arrow"></b>
							</li>
							<c:if test="${infoAdmin.user_type==1 }">

							<li class="">
								<a href="addvdoyt">
									<i class="menu-icon fa fa-caret-right"></i>
									Upload to Youtube
								</a>

								<b class="arrow"></b>
							</li>
							</c:if>

							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									List all video
								</a>

								<b class="arrow"></b>
							</li>

						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text"> Users </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						<c:if test="${infoAdmin.user_type==1 }">
							<li class="">
								<a href="adduser">
									<i class="menu-icon fa fa-caret-right"></i>
									Create user
								</a>

								<b class="arrow"></b>
							</li>
						</c:if>

							<li class="">
								<a href="listusers">
									<i class="menu-icon fa fa-caret-right"></i>
									List all users
								</a>

								<b class="arrow"></b>
							</li>

						</ul>
					</li>

					<li class="">
						<a href="cmt">
							<i class="menu-icon fa fa-comments"></i>

							<span class="menu-text">
								Comments

								<!-- #section:basics/sidebar.layout.badge -->
								<span class="badge badge-transparent tooltip-error" title="2 Important Events">
									<i class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
								</span>

								<!-- /section:basics/sidebar.layout.badge -->
							</span>
						</a>

						<b class="arrow"></b>
					</li>

				</ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>	
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
							<li class="active">Main Category</li>
						</ul><!-- /.breadcrumb -->

					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						
						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									<c:choose>
										<c:when test="${isCreate==0 }">
											Update main category
										</c:when>
										<c:otherwise>
											Create main category
										</c:otherwise>
									</c:choose>
									
								</small>
							</h1>
						</div>
						<!-- /.page-header -->
						
						<div class="alert alert-block alert-danger">
							<button type="button" class="close" data-dismiss="alert">
								<i class="ace-icon fa fa-times"></i>
							</button>

							<i class="ace-icon fa fa-exclamation-triangle red"></i>

							RECOMMENDATION 
							<strong class="red">
										Thumbnail
							</strong>,
									crop image as category thumbnail in <strong class="red">50px X 50px</strong> to suitable for display.
						</div>

						<!-- box-add-main-cate -->
						<div class="widget-box widget-color-blue2">

							<div class="widget-header">

								<c:choose>
									<c:when test="${isCreate==0 }">
										<h4 class="widget-title lighter smaller">Update main category</h4>
									</c:when>
									<c:otherwise>
										<h4 class="widget-title lighter smaller">Create main category</h4>
									</c:otherwise>
								
								</c:choose>

							</div>

							<div class="widget-body">

								<form class="form-horizontal" role="form">

									<div class="widget-main padding-8">
									
										<div class="form-group">
										
											<div class="col-sm-12">
	
													<label>
													<c:choose>
														<c:when test="${updatePassToFormAdminMainCate.main_cate_status==1 }">	
															<input id="category-status" class="ace ace-switch ace-switch-6" type="checkbox" checked>
															<span class="lbl tooltip-info" data-rel="tooltip"  title="Status is Active !" id="tooltips-status"></span>
														</c:when>
														<c:otherwise>
															<input id="category-status" class="ace ace-switch ace-switch-6" type="checkbox">
															<span class="lbl tooltip-error" data-rel="tooltip"  title="Status is Deactivated !" id="tooltips-status"></span>
														</c:otherwise>
													</c:choose>
													</label>

											</div>

										</div>

										<div class="form-group">

											<div class="col-sm-12">

												<input type="text"  placeholder="Main category title" class="form-control" id="title" value="${updatePassToFormAdminMainCate.main_cate_name }">

											</div>

										</div>	
										
										<div class="form-group">

											<div class="col-offset-11 col-sm-1">

												<input type="text" class="input-sm" id="order-number" data-placement="bottom" data-rel="tooltip" data-original-title="Ordering Number" value="${updatePassToFormAdminMainCate.main_cate_index }" />
												<div class="space-6"></div>
												
											</div>

										</div>	
											
										<div class="form-group">

											<div class="col-sm-12">

												<div class="space"></div>
												
												<input type="hidden" id="file" name="file" value="${updatePassToFormAdminMainCate.main_cate_image }">

												<input type="file" accept="image/*"/>

											</div>

										</div>	

										<div class="form-group">

											<div class="col-md-offset-10 col-md-2">
											
											<c:choose>
												<c:when test="${isCreate==0 }">			
													<button class="btn btn-info" type="button" id="update-main-cate" value="${updatePassToFormAdminMainCate.main_cate_id }">
														<i class="ace-icon fa fa-share-square-o bigger-110"></i>
														Update
													</button>
												</c:when>
												<c:otherwise>
													<button class="btn btn-info" type="button" id="create-main-cate">
														<i class="ace-icon fa fa-check bigger-110"></i>
														Create
													</button>
												</c:otherwise>
											</c:choose>

											</div>

										</div>

									</div>

								</form>
							</div>
						</div>
						<!-- /.box-add-main-cate -->
					</div>
				</div>
			
		</div><!-- /.main-container -->
		
		<!-- add footer -->
		<jsp:include page="/admin/include/footer.jsp"></jsp:include>
		
	</div><!-- /.main-container -->
		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='../../assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../../assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="../../assets/js/bootstrap.js"></script>
		
		<!-- spinner number -->
		<script src="../../assets/js/fuelux/fuelux.spinner.js"></script>
		<!-- use for drag drop file and spinner -->
		<script src="../../assets/js/ace/elements.fileinput.js"></script>
		<!-- /.use for drag drop file and spinner -->
		<script src="../../assets/js/ace/elements.spinner.js"></script>
		<!-- /.spinner number -->
		
		<!-- Require all pages -->
		
		<script src="../../assets/js/ace/elements.scroller.js"></script>
		<script src="../../assets/js/ace/ace.js"></script>
		<script src="../../assets/js/ace/ace.sidebar.js"></script>
		
		<!-- /.Require all pages -->

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		var check=0;
		var image_update="";
		
			jQuery(function($) {
				$("input[type=file]").on("change",function(){
					var file=$("input[type=file]")[0].files[0];
					var space=file.size/1048576;
					
					if(space>0.3){
						swal("Failed","Image file is more than 300KB","error");
						$("input[type=file]").val("");
					}
				});
				
				function uploadMainCateImage(){
					
					var data1=new FormData();
					data1.append("file",$("input[type=file]")[0].files[0]);
					
					$.ajax({
						url:"upload_main_cate_img",
						type:"POST",
						cache : false,
						contentType : false,
						processData : false,
						async: false,
						data : data1,
						success : function(status) {
							
						}
					});
				}
				
				$("#create-main-cate").click(function(){
				
					var image = $('input[type=file]').val().split('/').pop().split('\\').pop();
					if(image==""){
						image='default.jpg';
					}
					  $.ajax({
							url:"add_main_cate",
							type:"POST",
							
							data:{
								main_cate_name:$("#title").val(),
								main_cate_status:check,
								main_cate_image:image,
								main_cate_index:$("#order-number").val()
							},
							success:function(status){
								if(status=="success"){
									uploadMainCateImage();
									swal("Success","Create Main Category Done!","success");
									$("#title").val("");
									check=0;
									
									$("#order-number").val(0);
								}else{
									swal("Oops..!","Create Main Category Unsuccessfully !","error");
								}
							}
					});
					  
				});
				
				$("#update-main-cate").click(function(){
					
					if($('input[type=file]').val().split('/').pop().split('\\').pop()==""){
						image_update=$("#file").val();
					}else{
						image_update=$('input[type=file]').val().split('/').pop().split('\\').pop();
					}
						$.ajax({
							url:"update_main_cate",
							type:"POST",
							data:{
								main_cate_id:$(this).val(),
								main_cate_name:$("#title").val(),
								main_cate_status:check,
								main_cate_image:image_update,
								main_cate_index:$("#order-number").val()
							},
							success:function(status){
								if(status=="success"){
									uploadMainCateImage();
									swal({
										title:"Success",
										text:"Update Main Category Done!",
										type:"success",
										timer:1500,
										showConfirmButton:false
									},function(){
										$("#title").val("");
										check=0;
										$("#order-number").val(0);
										window.location.href="listmaincate";
									});
									
								}else{
									swal("Oops..!", "Update Category not successfully..! check your entry infomation", "error");
								}
							}
						});
				
				
				});
				
				$('input[type=file]').ace_file_input({
					style:'well',
					btn_choose:'Drop image here or click to choose',
					btn_change:null,
					no_icon:'ace-icon fa fa-image',
					droppable:true,
					maxFilesize: 0.1,
					thumbnail:'large'
				});
				
				$("#category-status").change(function() {
				    if(this.checked) {
				       check=1;
				       	$('.tooltip-inner').text('Status is Activated !');
				       	
				    	$('[data-rel=tooltip]#tooltips-status').attr({
				    		"data-original-title":"Status is Activated !",
				    		"class":"lbl tooltip-info"
				    	});
				    	
				    }else{
				    	check=0;
				    	$('.tooltip-inner').text('Status is Deactivated !');
				    	$('[data-rel=tooltip]#tooltips-status').attr({
				    		"data-original-title":"Status is Deactivated !",
				    		"class":"lbl tooltip-error"
				    	});
				    	
				    }
				});
				
				$('#order-number').ace_spinner({value:0,min:0,max:100,step:1, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});

				$('[data-rel=tooltip]').tooltip();
			
			  

			});
		</script>
		
	</body>
</html>
