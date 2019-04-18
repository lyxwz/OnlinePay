<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<% 
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>付款页面</title>
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".submit_order").click(function(){
					$("#pay_form").submit();
				});
			});
		</script>
		
		<style type="text/css">
			*{
				margin: 0px;
				padding: 0px;
			}
			
			body{
				margin-top: 10%
			}
			
			.container {
				width: 90%;
				padding-right: 15px;
				padding-left: 15px;
				margin-right: auto;
				margin-left: auto
			}
			
			img {
				vertical-align: middle
			}
			
			h4 {
				margin-top: 10px;
				margin-bottom: 10px;
				font-size: 18px
			}
			
			.row {
				margin-right: -15px;
				margin-left: -15px
			}
			
			.line {
				margin-top: 15px;
				border-top: 1px solid #9A9A9A;
				height: 10px;
			}

			.row:after,.row:before{
				display: table;
				content: " "
			}
			
			.row:after{
				clear: both
			}

			.submit_order {
				height: 50px;
				width: 150px;
				background-color: #FF5000;
				float: right;
				text-align: center;
				line-height: 50px;
				color: #FFFFFF;
				font-size: 16px;
				cursor: pointer;
			}
			
			.submit_order:HOVER {
				background-color:#FF0000;
			}
		</style>
	</head>

	<body>
		<%
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String orderNumber = sdf.format(now);
			String payAmount="0.01";
		%>
		<div class="container">
			<div class="row">
				<table width="100%">
					<tr>
						<td>订单编号为：<%=orderNumber %></td>
						<td style="text-align: right;">
							<span>订单总价为：</span>
							<span style="color: red;">
								<strong>￥<%=payAmount %>元&nbsp;&nbsp;</strong>
							</span>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="row line"></div>
			
			<div class="row">
				<h4><strong>选择银行</strong></h4>
			</div>
			<form action="<%=basePath%>/PayBeginServlet" id="pay_form" method="post" >
				<input type="hidden" value="<%=orderNumber %>" name="orderNumber">
				<input type="hidden" value="<%=payAmount %>" name="payAmount">
				
				<table width="100%">
					<tr align="center">
						<td>
							<input type="radio" name="bankCode" value="ICBC-NET-B2C" checked="checked"/>
							<img src="<%=basePath%>/imgs/icbc.bmp" align="middle" title="工商银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="BOC-NET-B2C"/>
							<img src="<%=basePath%>/imgs/bc.bmp" align="middle" title="中国银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="ABC-NET-B2C"/>
							<img src="<%=basePath%>/imgs/abc.bmp" align="middle" title="农业银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="POST-NET-B2C"/>
							<img src="<%=basePath%>/imgs/post.bmp" align="middle" title="中国邮政"/>
						</td>
					</tr>
				</table>
				
				<table width="100%" style="margin-top: 15px">
					<tr align="center">
						<td>
							<input type="radio" name="bankCode" value="PINGANBANK-NET"/>
							<img src="<%=basePath%>/imgs/pingan.bmp" align="middle" title="平安银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="CCB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/ccb.bmp" align="middle" title="建设银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="CEB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/guangda.bmp" align="middle" title="光大银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="CMBCHINA-NET-B2C"/>
							<img src="<%=basePath%>/imgs/cmb.bmp" align="middle" title="招商银行"/>
						</td>
					</tr>
				</table>
				
				<table width="100%" style="margin-top: 15px">
					<tr align="center">
						<td>
							<input type="radio" name="bankCode" value="CCB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/ccb.bmp" align="middle" title="建设银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="BCCB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/bj.bmp" align="middle" title="北京银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="CBHB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/bh.bmp" align="middle" title="渤海银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="CIB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/cib.bmp" align="middle" title="兴业银行"/>
						</td>
					</tr>
				</table>
				
				<table width="100%" style="margin-top: 15px">
					<tr align="center">
						<td>
							<input type="radio" name="bankCode" value="NBCB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/ningbo.bmp" align="middle" title="宁波银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="BOCO-NET-B2C"/>
							<img src="<%=basePath%>/imgs/bcc.bmp" align="middle" title="交通银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="SHB-NET-B2C"/>
							<img src="<%=basePath%>/imgs/sh.bmp" align="middle" title="上海银行"/>
						</td>
						<td>
							<input type="radio" name="bankCode" value="CZ-NET-B2C"/>
							<img src="<%=basePath%>/imgs/zheshang.bmp" align="middle" title="浙商银行"/>
						</td>
					</tr>
				</table>
			</form>

			<div class="row line"></div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="submit_order">确认付款</div>
			</div>
		</div>
	</body>

</html>