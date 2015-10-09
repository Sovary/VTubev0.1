<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		
		<c:set value="${listusers }" var="listusers"></c:set>
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Dashboard - Users</title>

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
						<c:if test="${infoAdmin.user_type==1 }">
							<li class="">
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
						<c:if test="${infoAdmin.user_type==1 }">
							<li class="">
								<a href="adduser">
									<i class="menu-icon fa fa-caret-right"></i>
									Create user
								</a>

								<b class="arrow"></b>
							</li>
						</c:if>

							<li class="active">
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
							<li class="active">User</li>
						</ul><!-- /.breadcrumb -->

					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						
						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									List all users
								</small>
							</h1>
						</div>
						<!-- /.page-header -->

						<!-- box-list-main-cate -->
						
						<div>
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="hidden-480">ID</th>
										
										<th class="hidden-480">
											<i class="ace-icon fa fa-image bigger-110 hidden-480"></i>
												Thumbnail
										</th>
															
										<th>
											<i class="ace-icon fa fa-paragraph bigger-110 hidden-480"></i>
												Username
										</th>
										
										<th>
											<i class="ace-icon fa fa-user-secret bigger-110 hidden-480"></i>
												Type
										</th>
	
										<th>
											<i class="ace-icon fa fa-exclamation-circle bigger-110 hidden-480"></i>
												Status
										</th>
															
										<c:if test="${infoAdmin.user_type==1 }">
											<th>
												<i class="ace-icon fa fa-clock-o bigger-110"></i>
												Action
											</th>
										</c:if>
									</tr>
								</thead>

								<tbody>
								<c:forEach var="item" items="${listusers }">
								
									<tr>
														
										<td class="hidden-480">
											<div class="text-center">
												${item.user_id }
											</div>
										</td>
										
										<td class="hidden-480">
											<div class="text-center">
												<img class="img-circle no-img-user" src="../../assets/avatars/${item.user_image }" width="35px">
											</div>
										</td>
													
										<td>
											
											<label class="label label-lg label-info arrowed-in-right arrowed tooltip-success" data-rel="tooltip" title="" data-original-title="${item.user_email }">${item.user_name }</label>
												
										</td>
										
										<td>
											<c:choose>
												<c:when test="${item.user_type==1 }">
													<div class="text-left text-uppercase">
														<label class="label label-lg label-purple">Admin</label>
													</div>
												</c:when>
												<c:when test="${item.user_type==2 }">
													<div class="text-left text-uppercase">
														<label class="label label-lg label-warning">Moderator</label>
													</div>
												</c:when>
												<c:otherwise>
													<div class="text-left text-uppercase">
														<label class="label label-lg label-inverse">User</label>
													</div>
												</c:otherwise>
											</c:choose>
										</td>
														
										<td>
											<div class="text-center">
												
												<c:choose>
													<c:when test="${infoAdmin.user_type==1 }">
														 <c:choose>
															<c:when test="${item.user_status==0 }">
																<button class="btn btn-minier btn-danger btn-status" value="${item.user_id }"><i class="fa fa-times-circle fa-2x"></i></button>
															</c:when>
															<c:otherwise>
																<button class="btn btn-minier btn-info btn-status" value="${item.user_id }"><i class="fa fa-check-circle fa-2x"></i></button>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
													
														 <c:choose>
															<c:when test="${item.user_status==0 }">
																<button class="btn btn-minier btn-danger btn-status" disabled="disabled" value="${item.user_id }"><i class="fa fa-times-circle fa-2x"></i></button>
															</c:when>
															<c:otherwise>
																<button class="btn btn-minier btn-info btn-status" disabled="disabled" value="${item.user_id }"><i class="fa fa-check-circle fa-2x"></i></button>
															</c:otherwise>
														</c:choose>
													
													</c:otherwise>
												</c:choose>
												
											</div>
										</td>
										<c:if test="${infoAdmin.user_type==1 }">

										<td>
											<div class="hidden-sm hidden-xs action-buttons">
																
												<div class="text-center">
													<div class="btn btn-xs btn-warning">
														<a class="white" href="updateuser?id=${item.user_id }">
															<i class="ace-icon fa fa-pencil bigger-130"></i>
														</a>
													</div>
												</div>
																
											</div>

											<div class="hidden-md hidden-lg">
												<div class="inline pos-rel">
													<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
														<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
													</button>

													<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	
														<li>
															<a href="updateuser?id=${item.user_id }" class="tooltip-success" data-rel="tooltip" title="Edit">
																<span class="green">
																	<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																</span>
															</a>
														</li>

													</ul>
													
												</div>
												
											</div>
											
										</td>
									</c:if>
									</tr>
									
								</c:forEach>
									
								</tbody>
								
							</table>
						</div>
						
						<!-- /.box-list-main-cate -->
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

		<!-- page specific plugin scripts -->
		<script src="../../assets/js/dataTables/jquery.dataTables.js"></script>
		<script src="../../assets/js/dataTables/jquery.dataTables.bootstrap.js"></script>
		
		<script src="../../assets/js/ace/elements.fileinput.js"></script>
		
		
		<!-- Require all pages -->
		
		<script src="../../assets/js/ace/elements.scroller.js"></script>
		<script src="../../assets/js/ace/ace.js"></script>
		<script src="../../assets/js/ace/ace.sidebar.js"></script>
		
		<!-- /.Require all pages -->


		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		var status=0;
			jQuery(function($) {
			
				$(".btn-status").on("click",function(){
					
					$(this).children().eq(0).toggleClass("fa fa-check-circle")
		   				   .toggleClass("fa fa-times-circle");
					
					$(this).toggleClass("btn btn-minier btn-danger")
						   .toggleClass("btn btn-minier btn-info");
				
				 	
				 	if($(this).children().eq(0).hasClass("fa-check-circle")){
						changeStatus($(this).val(), 1);
						
					}else{
						changeStatus($(this).val(), 0);
					} 
					  
				});
				
				function changeStatus(id,status){
					
					$.ajax({
						url:"changestatususer",
						method:"POST",
						data:{
							user_status:status,
							user_id:id
						},
						success:function(msg){
							if(msg=="denied"){
								swal("Denied !","You don't have permission to perform this action..!","error");
							}else if(msg=="success"){
								console.log("status user = "+msg);
							}else if(msg=="failed"){
								swal("Invalid !","This operation is rejected..!","error");
							}else{
								swal("Error !",msg,"error");
							}
						}
					});
				}
				
				//initiate dataTables plugin
				
				$('#dynamic-table').dataTable({});
				
				$('[data-rel=tooltip]').tooltip();
				
				$('.no-img-user').error(function(){
			        $(this).attr('src', '../../images/user-img/avatar.png');
				});
				
			});
		</script>
	</body>
</html>
