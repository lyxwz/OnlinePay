<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>付款失败页面</title>
		<style type="text/css">
					
			*{
				margin: 0px;
				padding: 0px;
			} 
			
			body {
				margin-top: 10%;
				font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
				font-size: 14px;
				line-height: 1.42857143;
				color: #333;
			}
			
			img {
				vertical-align: middle
			}
			
			.container {
				width: 45%;
				padding-right: 15px;
				padding-left: 15px;
				margin-right: auto;
				margin-left: auto;
			}

			.pay_info{
				width: 100%;
				height: 135px;
				border: 1px solid #555555;
			}

			.pay_info_lef{
				width: 50%;
				height: 100%;
				float: left;
				text-align: center;
				line-height: 133px;
			}
			
			.pay_info_right{
				width: 50%;
				height: 100%;
				float: right;
				text-align:left;
				line-height: 133px;
				font-size: 15px;
				font-weight: bold;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="pay_info">
				<div class="pay_info_lef">
					<img width="120px" height="120px" src="<%=basePath%>/imgs/fail.jpg" />
				</div>
				<div class="pay_info_right">
					<%=request.getAttribute("errorMsg") %>
				</div>
			</div>
		</div>
	</body>
</html>