<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Dashboard - Ace Admin</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		<!-- sweet alert -->
		<link rel="stylesheet" type="text/css" href="../assets/css/sweetalert/sweetalert.css">
		<script src="../assets/js/sweetalert/sweetalert.min.js"></script>
		
		<!-- Require all pages -->
		
		<link rel="stylesheet" href="../assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../assets/css/font-awesome.css" />		
		<link rel="stylesheet" href="../assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<!-- /.Require all pages -->
		<style type="text/css">
		.navbar{
			background:#43B8B9;
		}
		a{
			color:white;
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
						<a href="index.jsp">
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
								<a href="addmaincate.jsp">
									<i class="menu-icon fa fa-caret-right"></i>

									Add main category
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="listmaincate.jsp">
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
								<a href="addsubcate.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Add sub category
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="listsubcate.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									List sub categories
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="active">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-video-camera"></i>
							<span class="menu-text"> Video </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="addvdolink.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Add video by link
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="addvdoyt.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Upload to Youtube
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="listvdo.jsp">
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
							<li class="">
								<a href="addusers.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Add user
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="listusers.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									List all users
								</a>

								<b class="arrow"></b>
							</li>

						</ul>
					</li>

					<li class="">
						<a href="cmt.jsp">
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
							<li class="active">Video</li>
						</ul><!-- /.breadcrumb -->

					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						
						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									List all video
								</small>
							</h1>
						</div>
						<!-- /.page-header -->

						<!-- box-list-main-cate -->
						
						<div>
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Order</th>
														
										<th>
											<i class="ace-icon fa fa-paragraph bigger-110 hidden-480"></i>
												Video Title
										</th>
										
										<th class="hidden-480">
											<i class="ace-icon fa fa-star bigger-110 hidden-480"></i>
												Features
										</th>
	
										<th>
											<i class="ace-icon fa fa-exclamation-circle bigger-110 hidden-480"></i>
												Status
										</th>
														
										<th>
											<i class="ace-icon fa fa-clock-o bigger-110"></i>
												Action
										</th>
									</tr>
								</thead>

								<tbody>
							
									<tr>
														
										<td>
												3
										</td>
										
										<td>
										
											<div class="text-left">
											
													<a href="#"><span class="label label-lg label-inverse">Java- lesson 1 variable</span></a>
												
											</div>
											
										</td>
										
										<td class="hidden-480">
										
											<div class="text-center">
											
												<span class="label label-success">
													<span>123</span>
													<i class="ace-icon fa fa-eye bigger-130"></i>
												
												</span>
												
												<span class="label label-success">
													<span>33</span>
													<i class="ace-icon fa fa-thumbs-up bigger-130"></i>
												
												</span>
												
												<span class="label label-success">
													<span>33</span>
													<i class="ace-icon fa fa-thumbs-down bigger-130"></i>
												
												</span>
												
											</div>
											
										</td>
														
										<td>
										
											<div class="text-center">
											
												<button class="btn btn-minier btn-danger btn-status"><i class="fa fa-times-circle fa-2x"></i></button>
												
											</div>
											
										</td>

										<td>
											<div class="hidden-sm hidden-xs action-buttons">
																
											<div class="text-center">
												
												<div class="btn btn-xs btn-warning">
												
													<a class="white" href="updatevideo?id=">
													
														<i class="ace-icon fa fa-pencil bigger-130"></i>
														
													</a>
												
												</div>
												
												<div class="btn btn-xs btn-danger">
	
													<a class="white" href="#" onclick="delete_video(v_id)">
													
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
															<a href="updatevideo?id=" class="tooltip-success" data-rel="tooltip" title="Edit">
															
																<span class="green">
																
																	<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	
																</span>
																
															</a>
															
														</li>

														<li>
															<a href="#" onclick="delete_video(v_id)" class="tooltip-error" data-rel="tooltip" title="Delete">
															
																<span class="red">
																
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	
																</span>
																
															</a>
															
														</li>
														
													</ul>
													
												</div>
												
											</div>
											
										</td>
										
									</tr>
									
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
			window.jQuery || document.write("<script src='../assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="../assets/js/bootstrap.js"></script>

			<![endif]-->
		
		<!-- spinner number -->
		<script src="../assets/js/fuelux/fuelux.spinner.js"></script>
		<script src="../assets/js/ace/elements.fileinput.js"></script>
		<script src="../assets/js/ace/elements.spinner.js"></script>
		<!-- /.spinner number -->
	
		<!-- Require all pages -->
		
		<script src="../assets/js/ace/elements.scroller.js"></script>
		<script src="../assets/js/ace/ace.js"></script>
		<script src="../assets/js/ace/ace.sidebar.js"></script>
		
		<!-- /.Require all pages -->


		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		
		function delete_video(video_id){
			swal({   title: "Are you sure?",   
				 text: "You will not be able to recover this video!",   
				 type: "warning",   showCancelButton: true,   
				 confirmButtonColor: "#DD6B55",   
				 confirmButtonText: "Yes, delete it!",   
				 closeOnConfirm: false 
		    }, function(){   
		    	$.get("actiondeletecategory",{
					id : video_id
				},function(data){
			    	swal("Deleted!", "Video has been deleted..!.", "success"); 
					location.href="listcategory";
				});
		    });
		}
		
		
		
		
			jQuery(function($) {
				
				
				
				$(".btn-status").on("click",function(){
					
					$(this).children().eq(0).toggleClass("fa fa-check-circle")
		   				   .toggleClass("fa fa-times-circle");
					
					$(this).toggleClass("btn btn-minier btn-danger")
						   .toggleClass("btn btn-minier btn-info");
				
				 	
				 	if($(this).children().eq(0).hasClass("fa-check-circle")){
						alert("Act");
					}else{
						alert("Deact");
					} 
					  
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
				
				$('#spinner3').ace_spinner({value:0,min:0,max:100,step:1, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});


				
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.dataTable({});
				$('[data-rel=tooltip]').tooltip();
		

			});
		</script>
	</body>
</html>
