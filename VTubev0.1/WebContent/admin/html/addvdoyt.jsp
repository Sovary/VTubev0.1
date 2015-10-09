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
		
		<link rel="stylesheet" href="../../assets/css/chosen.css" />
		
		<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans' type='text/css'>
		<link rel="stylesheet" href="../../assets/css/youtube/upload_video.css" type="text/css">
		
		<!-- sweet alert -->
		<link rel="stylesheet" type="text/css" href="../../assets/css/sweetalert/sweetalert.css">
		 <script src="../../assets/js/sweetalert/sweetalert.min.js"></script>
		<!-- Require all pages -->
		<link rel="icon" href="../../assets/images/vtube.png" type="image/png" >
		<link rel="stylesheet" href="../../assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../../assets/css/font-awesome.css" />		
		<link rel="stylesheet" href="../../assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="../../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<!-- /.Require all pages -->
		
		<script src="../../assets/js/ace-extra.js"></script>
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

									Add main category
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
									Add sub category
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

					<li class="active">
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

							<li class="active">
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

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text"> Users </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="adduser">
									<i class="menu-icon fa fa-caret-right"></i>
									Add user
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
									Upload to YouTube
								</small>
							</h1>
						</div>
						<!-- /.page-header -->

						<!-- box-add-main-cate -->
						<div class="widget-box widget-color-blue2">

							<div class="widget-header">

								<h4 class="widget-title lighter smaller">
									
									<img class="img-circle" id="channel-thumbnail" width="35px">
									
									<span id="channel-name" class="label label-lg label-warning arrowed-in-right arrowed">Upload via Youtube</span>
									
									<span class="post-sign-in" style="float:right; margin-right:10px;">
									
										<button type="button" class="btn btn-xs btn-danger"  value="Logout" onclick="signOut()"> <i class="fa fa-sign-out"></i> logout</button>
										
									</span>
									
								</h4>

							</div>

							<div class="widget-body">
								<form class="form-horizontal" role="form">
									<div class="widget-main padding-8">
									
										<div class="pre-sign-in">
											<div class="form-group">
												<div class="col-sm-12">
												
													<span id="signinButton" class="pre-sign-in">
												      <span
												        class="g-signin"
												        data-callback="signinCallback"
												        data-clientid="158477219373-m4d4io4qbrslcijn1qcgbddss36f58pb.apps.googleusercontent.com"
												        data-cookiepolicy="single_host_origin"
												        data-scope="https://www.googleapis.com/auth/youtube.readonly https://www.googleapis.com/auth/youtube.upload">
												      </span>
												    </span>	
	
												</div>
											 	
											</div>
										</div>
										<!-- /.pre-sign-in /.after login invisible-->
										
										<div class="post-sign-in">
										
											<div class="form-group">
										
												<div class="col-sm-12">
		
													<label>
														<input id="video-status"  class="ace ace-switch ace-switch-6" type="checkbox">
														<span id="tooltips-status" class="lbl tooltip-error" data-rel="tooltip"  title="Status is Deactivated !"></span>
													</label>
	
												</div>
	
											</div>
											
											<div class="form-group">

												<div class="col-sm-12">
	
													<input type="text" id="title" placeholder="Video title" class="form-control">
	
												</div>
	
											</div>	
											
											<div class="form-group">
											
												<div class="col-sm-12">
												
													<textarea class="form-control limited" id="description" placeholder="Video Description"></textarea>
												
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
											
												<div class="col-sm-12">
													<label for="privacy-status">Privacy</label>
													<select class="form-control" id="privacy-status">
														<option>public</option>
														<option>unlisted</option>
														<option>private</option>
													</select>
													
												</div>
												
											</div>
											
											<div class="form-group">

												<div class="col-offset-11 col-sm-1">
	
													<input type="text" class="input-sm" id="order-number" data-placement="bottom" data-rel="tooltip" data-original-title="Ordering Number" />
													<div class="space-6"></div>
	
												</div>
	
											</div>
											
											<div class="form-group">

												<div class="col-sm-12">
													
													<input type="file" id="file" accept="video/*">
													
												</div>
	
											</div>
											
											<div class="form-group">
												
												<div class="col-sm-12">
												
													<button id="upload-yt-api" class="btn btn-info">
														<i class="ace-icon fa fa-check bigger-110"></i>
														Upload Video
														
													</button>
											
												</div>
											
											</div>
											
											<div class="during-upload">
											
        										<div class="progress pos-rel progress-striped active" id="progress-percent-num" >
        										
													<div class="progress-bar progress-bar-success" id="progress-precent"></div>
													
												</div>	
        											
												<span class="label label-lg label-success arrowed-in arrowed-in-right">
													<span id="bytes-transferred"></span> MB / <span id="total-bytes"></span> MB
												</span>
        										
											</div>
											
											<!--/. post-upload -->
											
											
										</div>
										<!-- /.post-sign-in -->
										
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
		
		<!-- Upload YT -->
	    <script src="http://apis.google.com/js/client:plusone.js"></script>
	  	<script src="../../assets/js/youtube/upload_video.js"></script>
	  	<script src="../../assets/js/youtube/cors_upload.js"></script>
	    
		

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		
		
		// Sign Out Google Plus
		 function signOut(){
		 var token=gapi.auth.getToken();
			if(token){
				var script=document.createElement("script");
				script.src="https://accounts.google.com/o/oauth2/revoke?token="+token.access_token;
				document.body.appendChild(script);
				document.body.removeChild(script);
				gapi.auth.setToken("");
				gapi.auth.signOut();
				location.reload();
			}
					   	
		 }
		
		jQuery(function($) {
				
			$('#order-number').ace_spinner({value:0,min:0,max:100,step:1, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
			$('[data-rel=tooltip]').tooltip();
				
		});
			
			
		</script>
		
	</body>
</html>
