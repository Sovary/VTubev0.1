<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		
	
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Dashboard - Video</title>

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
		<!-- <script src="../../assets/js/ace-extra.js"></script> -->
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

					<li class="active">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-video-camera"></i>
							<span class="menu-text"> Video </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="active">
								<a href="addvdolink">						<i class="menu-icon fa fa-caret-right"></i>
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
								
											Add video by link
										
								</small>
							</h1>
						</div>
						<!-- /.page-header -->

						<!-- box-add-main-cate -->
						<div class="widget-box widget-color-blue2">

							<div class="widget-header">

								<h4 class="widget-title lighter smaller">
									
									
										Add video by link
										
								</h4>

							</div>

							<div class="widget-body">

								<form class="form-horizontal" role="form">

									<div class="widget-main padding-8">
									
										<div class="form-group">
										
											<div class="col-sm-12">
	
													<label>
													
															<input id="video-status" class="ace ace-switch ace-switch-6" type="checkbox">
															<span id ="tooltips-status" class="lbl tooltip-error" data-rel="tooltip"  title="Status is Deactivated !"></span>
														
													</label>

											</div>

										</div>

										<div class="form-group">

											<div class="col-sm-12">

												<input type="text" id="video-title" placeholder="Video Title" class="form-control" value="${updateVdo.video_title }">

											</div>

										</div>	
										
										<div class="form-group">
											
											<div class="col-sm-12">
											
												<textarea class="form-control limited" id="video-desc" placeholder="Video Description" ></textarea>
											
											</div>
											
										</div>
										
										<div class="form-group">

											<div class="col-sm-12">

												<input type="text" id="video-link" placeholder="" class="form-control" value="http://youtube.com/watch?v=${updateVdo.video_url }">

											</div>

										</div>
										
										<div class="form-group">
												
												<div class="col-sm-12">
												
													<select class="form-control" id="choose-main-category">
																											
													</select>
												
												</div>
											
										</div>
										
										<div class="form-group">
												
												<div class="col-sm-12">
												
													<select class="form-control" id="choose-category">
																										
													</select>
												
												</div>
											
										</div>
										
										<div class="form-group">

											<div class="col-offset-11 col-sm-1">

												<input type="text" class="input-sm" id="order-number" data-placement="bottom" data-rel="tooltip" data-original-title="Ordering Number" value="${updateVdo.video_index }"/>
												<div class="space-6"></div>

											</div>

										</div>	
										
										<div class="form-group">

											<div class="col-md-offset-10 col-md-2">

														<button class="btn btn-info" type="button" id="add-video-link">

															<i class="ace-icon fa fa-check bigger-110"></i>
															Add Video
		
														</button>
													
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
		var category_id=0;
			jQuery(function($) {
				
			
				 $("#add-video-link").on("click",function(){
					
					//alert(();
					 $.post("add_video_link",
						{
							video_title:$("#video-title").val(),
							video_description:$("#video-desc").val(),
							video_url:$("#video-link").val().slice(-11),
							video_status:check,
							category_id:category_id,
							video_index:$("#order-number").val(),
						
							
						},
						function(status){
							if(status=="success"){
								
								swal("Success","Add Video Done!","success");
								$("#video-title").val("");
								$("#video-desc").val("");
								$("#video-link").val("");
								$("#order-number").val(0);
								$("#choose-main-category option[value='']").attr("selected","selected");
								$("#choose-category").css("display","none");
							}else{
								swal("Oops..!","This operation is failed!","error");
							}
						
					}); 
					
				}); 
					
				
				
				//LIST OF COMBOX
			
				$("#choose-category").css("display","none");
				
				
				$("#choose-main-category").on("change",function(){
					if($(this).val()!=""){
						$("#choose-category").css("display","inline");
						$.ajax({
							url:"list_sub_of_main",
							method:"GET",
							data:{
								main_cate_id:$(this).val()
							},
							success:function(data){
								$("#choose-category").html(listSubOfMain(data));
							}
						});
					}else{
						$("#choose-category").css("display","none");
					}
				});
				
		
				
				
				function listSubOfMain(data){
					var opt="";
					opt+="<option value=''>---Choose Sub Category---</option>";
					for(var i=0;i<data.length;i++){
						
							opt+="<option value="+data[i].category_id+">"+data[i].category_name+"</option>";
						
						
					}
					return opt;
				}
				
				$.ajax({
					url:"list_main_cate_in_video",
					type:"GET",
					success:function(data){
						$("#choose-main-category").html(listMainCate(data));
					}
				});
				
				function listMainCate(data){
					var opt="";
					opt+="<option value=''>---Choose Main Category---</option>";
					for(var i=0;i<data.length;i++){
						
							opt+="<option value="+data[i].main_cate_id+">"+data[i].main_cate_name+"</option>";
						
						
					}
					return opt;
				}
				
				//.END LIST OF COMBOX
				
			
				 //script combobox select main category
				 
				$("#choose-category").on("change",function(){
					category_id=$('#choose-category option:selected').val();
				});
				  
				
				$("#video-status").change(function() {
				    if(this.checked) {
				       
				       	$('.tooltip-inner').text('Status is Activated !');
				       	
				    	$('[data-rel=tooltip]#tooltips-status').attr({
				    		"data-original-title":"Status is Activated !",
				    		"class":"lbl tooltip-info"
				    	});
				    	check=1;
				    }else{
				    	
				    	$('.tooltip-inner').text('Status is Deactivated !');
				    	$('[data-rel=tooltip]#tooltips-status').attr({
				    		"data-original-title":"Status is Deactivated !",
				    		"class":"lbl tooltip-error"
				    	});
				    	check=0;
				    }
				});
				
				
				$('#order-number').ace_spinner({value:0,min:0,max:100,step:1, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});

				$('[data-rel=tooltip]').tooltip();
				
				
			
			
				

			});
		
		</script>
		
	</body>
</html>
