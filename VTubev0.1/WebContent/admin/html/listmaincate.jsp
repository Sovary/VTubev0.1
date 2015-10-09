<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<c:set value="${requestScope.listMainCateAdmin }" var="listMainCateAdmin"></c:set>
		
		<title>Dashboard -Main Category</title>

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
							<li class="">
								<a href="addmaincate">
									<i class="menu-icon fa fa-caret-right"></i>

									Create main category
								</a>

								<b class="arrow"></b>
							</li>
						</c:if>

							<li class="active">
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
									List main category
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

						<!-- box-list-main-cate -->
						
						<div>
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Order</th>
										
										<th class="hidden-480">
											<i class="ace-icon fa fa-image bigger-110 hidden-480"></i>
											Thumbnail
										</th>
															
										<th>
											<i class="ace-icon fa fa-paragraph bigger-110 hidden-480"></i>
												Main category name
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
								<c:forEach items="${listMainCateAdmin }" var="items">
									<tr>
														
										<td>
												
											<div class="text-center">
											  <c:out value="${items.main_cate_index }"></c:out>
											</div>
												 
										</td>
										
										<td class="hidden-480">
											
											<div class="text-center">
												<img class="img-resposive no-img-main-cate" src="../../images/category_images/${items.main_cate_image }" width="50px" height="50px">
											</div>
											
										</td>
													
										<td>
											<div class="text-left">
												<label class="label label-lg label-info"><c:out value="${items.main_cate_name }"></c:out> 
													<span class="badge badge-inverse tooltip-inverse" data-rel="tooltip" title="Sub categories">
														<c:out value="${items.main_countSub }"></c:out>
													</span>
												</label>
											</div>
										</td>
														
										<td>
											<div class="text-center">
											<c:if test="${items.main_cate_status==0 }">
												<button class="btn btn-minier btn-danger btn-status" value="<c:out value="${items.main_cate_id }"></c:out>"><i class="fa fa-times-circle fa-2x"></i></button>
											</c:if>
												
											<c:if test="${items.main_cate_status==1 }">
												<button class="btn btn-minier btn-info btn-status" value="<c:out value="${items.main_cate_id }"></c:out>"><i class="fa fa-check-circle fa-2x"></i></button>
											</c:if>	
												
											</div>
										</td>
										<c:if test="${infoAdmin.user_type==1 }">

										<td>
											<div class="hidden-sm hidden-xs action-buttons">
																
												<div class="text-center">
													<div class="btn btn-xs btn-warning" onclick="update_main_cate(<c:out value="${items.main_cate_id }"></c:out>)">
														<a class="white" href="updatemaincate?id=<c:out value="${items.main_cate_id }"></c:out>">
															<i class="ace-icon fa fa-pencil bigger-130"></i>
														</a>
														
													</div>
													
													<div class="btn btn-xs btn-danger">
		
														<a class="white" href="#" onclick="delete_category('<c:out value="${items.main_cate_id }"></c:out>','<c:out value="${items.main_cate_image }"></c:out>')">
															<i class="ace-icon fa fa-trash-o bigger-130"></i>
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
															<a href="updatemaincate?id=<c:out value="${items.main_cate_id }"></c:out>" class="tooltip-success" data-rel="tooltip" title="Edit">
																<span class="green">
																	<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																</span>
															</a>
														</li>

														<li>
															<a href="#" onclick="delete_category(<c:out value="${items.main_cate_id }"></c:out>,<c:out value="${items.main_cate_image }"></c:out>)" class="tooltip-error" data-rel="tooltip" title="Delete">
																<span class="red">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
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
		
		function delete_category(main_cate_id,main_cate_image){
			
			swal({   title: "Are you sure?",   
				 text: "You will not be able to recover this category!",   
				 type: "warning",   showCancelButton: true,   
				 confirmButtonColor: "#DD6B55",   
				 confirmButtonText: "Yes, delete it!",   
				 closeOnConfirm: false 
		    }, function(){    
		    	
		    	$.get("deletemaincategory",{
		    			main_cate_id : main_cate_id,
		    			main_cate_image:main_cate_image	
		    	},function(status){
					alert(status);
					if(status=="success"){
						swal({
							title:"Delete..!", 
							text:"Category has been deleted..!", 
							type:"success",
							showConfirmButton: false,
							timer:1500
							
						},function(){
							location.href="listmaincate";
						});	
			    	
					}else if(status=="failed"){
						swal({
							title:"Failed..!", 
							text:"This operation is rejected..!", 
							type:"error"
						});	
					}else if(status=="denied"){
						swal({
							title:"Denied..!", 
							text:"You don't have permission with this action..!", 
							type:"warning"
						});		
					}else{
						swal({
							title:"Oops..!", 
							text:"Cannot delete this, You only can disable this category unless delete all sub categories under this category..!", 
							type:"error"
						});	
					}
					
				});
		     }); 
			
		}
		
		function update_main_cate(id){
			location.href="updatemaincate?id="+id;
		}
		
			jQuery(function($) {
				
				
				var check=0;
			
				$(".btn-status").on("click",function(){
					$(this).children().eq(0).toggleClass("fa fa-check-circle")
  				  	 .toggleClass("fa fa-times-circle");
			
					$(this).toggleClass("btn btn-minier btn-danger")
				   	.toggleClass("btn btn-minier btn-info");
		
		 			if($(this).children().eq(0).hasClass("fa-check-circle")){check=1;}else{check=0;} 
				 	
				 	$.ajax({
						url:"check_main_status",
						type:"GET",
						data:{
							main_cate_id:$(this).val(),
							main_cate_status:check
						},
						success:function(status){
							if(status=="success"){
								console.log("change status maincate success");
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
					thumbnail:'large'
				});
				
				//initiate dataTables plugin
				
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.dataTable({});
				
				$('[data-rel=tooltip]').tooltip();
				$('.no-img-main-cate').error(function(){
			        $(this).attr('src', '../../images/category_images/default.jpg');
				});
			});
		</script>
	</body>
</html>
