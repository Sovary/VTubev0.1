<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<c:set value="${updateUserToForm }" var="updateUserToForm"></c:set>
		<c:set value="${isCreate }" var="isCreate"></c:set>
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Dashboard - User</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		<link rel="stylesheet" href="../../assets/css/chosen.css" />
		

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

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-sitemap"></i>
							<span class="menu-text">
								Main Categories
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="addmaincate">
									<i class="menu-icon fa fa-caret-right"></i>

									Create main category
								</a>

								<b class="arrow"></b>
							</li>

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
							<li class="">
								<a href="addsubcate">
									<i class="menu-icon fa fa-caret-right"></i>
									Create sub category
								</a>

								<b class="arrow"></b>
							</li>

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
									Create video by link
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="addvdoyt">
									<i class="menu-icon fa fa-caret-right"></i>
									Upload to Youtube
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="listvdo">
									<i class="menu-icon fa fa-caret-right"></i>
									List all video
								</a>

								<b class="arrow"></b>
							</li>

						</ul>
					</li>

					<li class="active">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text"> Users </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="active">
								<a href="adduser">
									<i class="menu-icon fa fa-caret-right"></i>
									Create user
								</a>

								<b class="arrow"></b>
							</li>

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
							<li class="active">Users</li>
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
										Update
										</c:when>
										<c:otherwise>
										Create
										</c:otherwise>
									</c:choose>
								</small>
							</h1>
						</div>
						<!-- /.page-header -->

						<!-- box-add-main-cate -->
						<div class="widget-box widget-color-blue2">

							<div class="widget-header">

								<h4 class="widget-title lighter smaller">
									<c:choose>
										<c:when test="${isCreate==0 }">
										Update user
										</c:when>
										<c:otherwise>
										Create user
										</c:otherwise>
									</c:choose>
								</h4>

							</div>

							<div class="widget-body">

								<form class="form-horizontal" id="form-user">

									<div class="widget-main padding-8">
									
									
										<div class="form-group">
										
											<div class="col-sm-12">
	
													<label>
													<c:choose>
														<c:when test="${updateUserToForm.user_status==1 }">
														<input id="user-status" name="user-status" class="ace ace-switch ace-switch-6" value="1" type="checkbox" checked>
														<span class="lbl tooltip-info" data-rel="tooltip"  title="Status is Active !" id="tooltips-status"></span>
														</c:when>
														<c:otherwise>
														<input id="user-status" name="user-status" class="ace ace-switch ace-switch-6" value="0" type="checkbox">
														<span class="lbl tooltip-error" data-rel="tooltip"  title="Status is Deactivated !" id="tooltips-status"></span>
														</c:otherwise>
														
													</c:choose>
														
													</label>

											</div>

										</div>
										
										<div class="form-group">
										
											<div class="col-sm-12">
	
													<div class="radio">
													<c:choose>
														<c:when test="${updateUserToForm.user_gender==2 }">
														
														<label>
															<input name="gender" type="radio" value="1"  class="ace input-lg">
															<span class="lbl bigger-120"> Male</span>
														</label>
														
														<label>
															<input name="gender" type="radio" value="2" checked="checked" class="ace input-lg">
															<span class="lbl bigger-120"> Female</span>
														</label>
														
														</c:when>
														<c:otherwise>
														
														<label>
															<input name="gender" type="radio" value="1" checked="checked" class="ace input-lg">
															<span class="lbl bigger-120"> Male</span>
														</label>
														
														<label>
															<input name="gender" type="radio" value="2"  class="ace input-lg">
															<span class="lbl bigger-120"> Female</span>
														</label>
														
														</c:otherwise>
													
													</c:choose>
														
														
													</div>

											</div>

										</div>
										
										<div class="form-group">

											<div class="col-sm-12">

												<input type="text" id="user-name" placeholder="Username" class="form-control" value="${updateUserToForm.user_name }">

											</div>

										</div>
										
										<div class="form-group">

											<div class="col-sm-12">

												<c:choose>
													<c:when test="${isCreate==0 }">
														<input type="text" placeholder="Email" class="form-control" value="${updateUserToForm.user_email }" disabled>
													</c:when>
													<c:otherwise>
														<input type="text" id="email" placeholder="Email" class="form-control">
													</c:otherwise>
												</c:choose>

											</div>

										</div>
										
										<div class="form-group has-error">

											<div class="col-sm-12">

												<input type="password" id="password" placeholder="Password" class="form-control" value="${updateUserToForm.user_password }">

											</div>

										</div>
										
										<div class="form-group has-error">

											<div class="col-sm-12">

												<input type="password" id="confirm-password" placeholder="Confrim password" class="form-control" value="${updateUserToForm.user_password }">
												
												<span class="help-inline">
													
													<span class="middle text-danger"><i class="fa fa-close"></i> Not match password</span>
													
												</span>

											</div>

										</div>
										
										<div class="form-group">
										
											<div class="col-sm-12">
	
													<div class="radio">
													<c:choose>
														
															<c:when test="${updateUserToForm.user_type==1 }">
															<label>
																<input name="user-type" type="radio" value="1" checked class="ace input-lg user-type">
																<span class="lbl bigger-120"> Admin</span>
															</label>
															<label>
																<input name="user-type" type="radio" value="2" class="ace input-lg user-type">
																<span class="lbl bigger-120"> Moderator</span>
															</label>
															<label>
																<input name="user-type" type="radio" value="3" class="ace input-lg user-type">
																<span class="lbl bigger-120"> User</span>
															</label>
															</c:when>
															<c:when test="${updateUserToForm.user_type==2 }">
															<label>
																<input name="user-type" type="radio" value="1"  class="ace input-lg user-type">
																<span class="lbl bigger-120"> Admin</span>
															</label>
															<label>
																<input name="user-type" type="radio" value="2" checked class="ace input-lg user-type">
																<span class="lbl bigger-120"> Moderator</span>
															</label>
															<label>
																<input name="user-type" type="radio" value="3" class="ace input-lg user-type">
																<span class="lbl bigger-120"> User</span>
															</label>
															</c:when>
															<c:otherwise>
															<label>
																<input name="user-type" type="radio" value="1"  class="ace input-lg user-type">
																<span class="lbl bigger-120"> Admin</span>
															</label>
															<label>
																<input name="user-type" type="radio" value="2" class="ace input-lg user-type">
																<span class="lbl bigger-120"> Moderator</span>
															</label>
															<label>
																<input name="user-type" type="radio" value="3" checked class="ace input-lg user-type">
																<span class="lbl bigger-120"> User</span>
															</label>
															</c:otherwise>
														
														
													</c:choose>	
													</div>

											</div>

										</div>
										
										<div class="form-group">

											<div class="col-md-offset-9 col-md-3">

												<c:choose>
													<c:when test="${isCreate==0 }">
													
													<button class="btn btn-info" type="button" id="update-user" value="${updateUserToForm.user_id }">

														<i class="ace-icon fa fa-plus-circle bigger-110"></i>
														Update Account
	
													</button>
													
													</c:when>
													<c:otherwise>
													
													<button class="btn btn-info" type="button" id="create-user">

														<i class="ace-icon fa fa-plus-circle bigger-110"></i>
														Create New Account
	
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

		<!-- ace scripts -->
		<script src="../../assets/js/ace/elements.fileinput.js"></script>
		<script src="../../assets/js/chosen.jquery.js"></script>
		
		
		<!-- Require all pages -->
		
		<script src="../../assets/js/ace/elements.scroller.js"></script>
		<script src="../../assets/js/ace/ace.js"></script>
		<script src="../../assets/js/ace/ace.sidebar.js"></script>
		
		<!-- /.Require all pages -->

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		var usertype=3;
		var userstatus=0;
		var usergender=1;
		
			jQuery(function($) {
				
				
				$("#create-user").on("click",function(){
					
					$.ajax({
						url:"createuser",
						method:"GET",
						data:{
						user_name:$("#user-name").val(),
						user_email:$("#email").val(),
						user_password:$("#password").val(),
						user_image:"default.jpg",
						user_gender:usergender,
						user_status:userstatus,
						user_type:usertype,
						},
						success:function(status){
							
							if(status=="success"){
								$("#user-name").val("");
								$("#email").val("");
								$("#password").val("");
								
								swal("Created User","Done! user is created!","success");
								
							}else if(status=="exist"){
								swal("Invalid","It seems exiting email","error");
							}else{
								swal("Oops..!","This operation is rejected !","error");
							}
						}
						
					});
					
				});
				
				$("#update-user").on("click",function(){
				
					if ($('input[name=user-status]:checked').length > 0) {
   						userstatus=1;
					}else{
						userstatus=0;
					}
					
					/* if ($('input[name=user-type]:checked').length > 0) {
						usertype=1;
					}else{
						usertype=0;
					} */
					if ($('input[name=user-gender]:checked').length > 0) {
						usergender=1;
					}else{
						usergender=0;
					}
					
					  $.ajax({
						url:"update_user_admin",
						type:"POST",
						data:{
							user_id:$(this).val(),
							user_name:$("#user-name").val(),
							user_password:$("#password").val(),
							user_type:$('input[name=user-type]:checked').val(),
							user_status:userstatus,
							user_gender:usergender
						},
						success:function(msg){
							alert(msg);
						}
					}); 
				});
				
				 //script combobox select main category
				 
				$("input[name=user-type]").on("change",function(){
				  	
					usertype=$("input[name=user-type]:checked").val();
					
			    });
				 
				
				$("input[name=gender]").on("click",function(){
				  	
					usergender=$("input[name=gender]:checked").val();
					
			    });
					
				 $("#user-status").on("change",function() {
				    if(this.checked) {
				       userstatus=1;
				       	$('.tooltip-inner').text('Status is Activated !');
				       	
				    	$('[data-rel=tooltip]').attr({
				    		"data-original-title":"Status is Activated !",
				    		"class":"lbl tooltip-info"
				    	});
				    	
				    }else{
				    	userstatus=0;
				    	$('.tooltip-inner').text('Status is Deactivated !');
				    	$('[data-rel=tooltip]').attr({
				    		"data-original-title":"Status is Deactivated !",
				    		"class":"lbl tooltip-error"
				    	});
				    	
				    }
				}); 
				
				$('[data-rel=tooltip]').tooltip();
			
			 

			});
		</script>
		
	</body>
</html>
