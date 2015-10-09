<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		
		<c:set value="${requestScope.listAdmins }" var="listadmin"></c:set>
		<c:set value="${requestScope.listVideoOverview }" var="listVideoOverview"></c:set>
		<c:set value="${requestScope.countUser }" var="countUser"></c:set>
		<c:set value="${requestScope.countVideo }" var ="countVideo"></c:set>
		<c:set value="${requestScope.countMainCate }" var ="countMainCate"></c:set>
		<c:set value="${requestScope.countSubCate }" var ="countSubCate"></c:set>
		<c:set value="${requestScope.countLike }" var ="countLike"></c:set>
		<c:set value="${requestScope.countUnlike }" var ="countUnlike"></c:set>
		<c:set value="${requestScope.countView }" var ="countView"></c:set>
		
		<c:choose>
			<c:when test="${infoAdmin.user_type==1 }">
				<title>Dashboard - Admin</title>
			</c:when>
			<c:otherwise>
				<title>Dashboard - Moderator</title>
			</c:otherwise>
		</c:choose>	
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- Require all pages -->
		<link rel="icon" href="../../assets/images/vtube.png" type="image/png" >
		<link rel="stylesheet" href="../../assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../../assets/css/font-awesome.css" />		
		<link rel="stylesheet" href="../../assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="../../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<!-- /.Require all pages -->


	
		<style type="text/css">
		.navbar{
			background:#43B8B9;
		}
		</style>
	</head>

	<body class="no-skin">
		<!--add header -->
		<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<div class="main-container" id="main-container">
		
			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive sidebar-fixed sidebar-scroll">
				
				<ul class="nav nav-list">
					<li class="active">
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
							<li class="active">Dashboard</li>
						</ul><!-- /.breadcrumb -->

					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						
						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>

									<i class="ace-icon fa fa-check green"></i>

									Welcome to
									<strong class="green">
										VTube
									</strong>,
	the first platform video tutorial sharing in Cambodia Language.
								</div>

								<div class="row">
									<div class="space-6"></div>

									<div class="col-sm-6 infobox-container">
										<!-- #section:pages/dashboard.infobox -->
										<div class="infobox infobox-green">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-users"></i>
											</div>
											
											<div class="infobox-data">
												<span class="infobox-data-number"><c:out value="${countUser }"></c:out></span>
												<span class="infobox-content">Users</span>
											</div>

											
										</div>

										<div class="infobox infobox-blue">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-video-camera"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><c:out value="${countVideo }"></c:out></span>
												<div class="infobox-content">Video</div>
											</div>

										</div>

										<div class="infobox infobox-purple">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-sitemap"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><c:out value="${countMainCate }"></c:out></span>
												<div class="infobox-content">Main Categories</div>
											</div>

										</div>

										<div class="infobox infobox-pink">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-list"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><c:out value="${countSubCate }"></c:out></span>
												<div class="infobox-content">Sub Categories</div>
											</div>
										</div>

										<!-- /section:pages/dashboard.infobox -->
										<div class="space-6"></div>

										<!-- #section:pages/dashboard.infobox.dark -->
										<div class="infobox infobox-blue infobox-small infobox-dark">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-thumbs-up"></i>
											</div>

											<div class="infobox-data">
												<div class="infobox-content">Like</div>
												<div class="infobox-content"><c:out value="${countLike }"></c:out></div>
											</div>
										</div>

										<div class="infobox infobox-red infobox-small infobox-dark">
											<!-- #section:pages/dashboard.infobox.sparkline -->
											<div class="infobox-icon">
												<i class="ace-icon fa fa-thumbs-down"></i>
											</div>

											<!-- /section:pages/dashboard.infobox.sparkline -->
											<div class="infobox-data">
												<div class="infobox-content">Dislike</div>
												<div class="infobox-content"><c:out value="${countUnlike }"></c:out></div>
											</div>
										</div>

										<div class="infobox infobox-green infobox-small infobox-dark">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-eye"></i>
											</div>

											<div class="infobox-data">
												<div class="infobox-content">Views</div>
												<div class="infobox-content"><c:out value="${countView }"></c:out></div>
											</div>
										</div>

										<!-- /section:pages/dashboard.infobox.dark -->
									</div>

									<div class="vspace-12-sm"></div>
									<div class="col-sm-5">
										<div class="widget-box">
											<div class="widget-header">
												<h4 class="widget-title lighter smaller">
													<i class="ace-icon fa fa-user blue"></i>
													Administrators
													
												</h4>
											</div>
											
 
											<div class="widget-body">
												<div class="widget-main no-padding">
													<!-- #section:pages/dashboard.conversations -->
													<div class="dialogs">
													  <c:forEach items="${listadmin }" var="item">
															<div class="itemdiv dialogdiv">
																<div class="user">
																	<img alt="Alexa's Avatar" src="../../assets/avatars/avatar1.png" />
																</div>
																<div class="body">
																	<div class="name">
																		<span class="label label-lg label-purple arrowed"><c:out value="${item.user_name }"></c:out></span>
																	</div>
																	<div class="text"><c:out value="${item.user_email }"></c:out></div>
																</div>
															</div>
													  </c:forEach>
											
													</div>
													
													<!-- /section:pages/dashboard.conversations -->
												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->

									
								</div><!-- /.row -->

								<!-- #section:custom/extra.hr -->
								<div class="hr hr32 hr-dotted"></div>

								<!-- /section:custom/extra.hr -->

								<div class="table-header">
									Top 10 video
								</div>

								<div class="row">
									<div class="col-xs-12">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th  class="hidden-480">ID</th>
													<th>
														<i class="ace-icon fa fa-paragraph bigger-110 hidden-480"></i>
														Title
													</th>
													<th class="hidden-480">
														<i class="ace-icon fa fa-list bigger-110 hidden-480"></i>	
														Category
													</th>

													<th>
														<i class="ace-icon fa fa-eye bigger-110 hidden-480"></i>
														View
													</th>
													<th>
														<i class="ace-icon fa fa-exclamation-circle bigger-110 hidden-480"></i>
													Status
													</th>

												</tr>
											</thead>

											<tbody>
											  <c:forEach items="${requestScope.listVideoOverview }" var="items">
												<tr class="">
													
													<td class="hidden-480">
														<c:out value="${items.video_id }"></c:out>
													</td>
													<td>
														
															<label class="label label-lg label-inverse" data-rel="tooltip" title="" data-original-title="Published on <c:out value="${items.video_date }"></c:out>">
																<c:out value="${items.video_title }"></c:out>
															</label>
														
													</td>
													<td class="hidden-480">
														<label class="label label-lg label-info">
															<c:out value="${items.video_category_name }"></c:out>
														</label>
													</td>
													<td><c:out value="${items.video_view }"></c:out></td>

													<td>
														<div class="text-center">
														<c:choose>
															<c:when test="${items.video_status==1 }">
																<label class="label label-success"><i class="fa fa-check-circle"></i> Active</label>
															</c:when>
															<c:otherwise>
																<label class="label label-danger"><i class="fa fa-times-circle"></i> Disable</label>
															</c:otherwise>
														</c:choose>
														</div>
													</td>
												</tr>
											  </c:forEach>
											</tbody>
										</table>
									</div><!-- /.span -->
								</div>




								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<!-- add footer -->
			<jsp:include page="/admin/include/footer.jsp"></jsp:include>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
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

		<!-- Require all pages -->
		
		<script src="../../assets/js/ace/elements.scroller.js"></script>
		<script src="../../assets/js/ace/ace.js"></script>
		<script src="../../assets/js/ace/ace.sidebar.js"></script>
		
		<!-- /.Require all pages -->
		
		
		<script type="text/javascript">
			jQuery(function($) {
				
				$('[data-rel=tooltip]').tooltip();
			});
		</script>
	</body>
</html>
