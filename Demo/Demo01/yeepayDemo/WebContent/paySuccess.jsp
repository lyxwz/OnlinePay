<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>付款成功页面</title>
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
				margin-left: auto
			}

			.pay_info{
				width: 100%;
				height: 400px;
				border: 1px solid #555555;
			}
			
			.pay_info_top{
				height: 33%;
				width: 100%;
			}
			
			.pay_info_top_lef{
				width: 50%;
				height: 100%;
				float: left;
				text-align: center;
				line-height: 133px;
			}
			
			.pay_info_top_right{
				width: 50%;
				height: 100%;
				float: right;
				text-align:left;
				line-height: 133px;
				font-size: 25px;
				font-weight: bold;
			}
			
			.pay_info_bottom{
				margin-left:auto; margin-right:auto; 
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="pay_info">
				<div class="pay_info_top">
					<div class="pay_info_top_lef">
						<img width="120px" height="120px" src="<%=basePath%>/imgs/success.jpg" />
					</div>
					<div class="pay_info_top_right">
						恭喜！支付成功
					</div>
				</div>
				<div class="pay_info_bottom">
					<table style="margin:auto">
						<tr>
							<td>业务类型:</td><td><%=request.getParameter("r0_Cmd")%></td>
						</tr>
						<tr>
							<%
								String r1_Code = request.getParameter("r1_Code");
								String payState="扣款失败";
								if("1".equals(r1_Code)){
									payState="扣款成功";
								}
							%>
							<td>扣款状态：</td><td><%=payState%></td>
						</tr>
						<tr>
							<td>易宝订单系统订单号：</td><td><%=request.getParameter("r2_TrxId")%></td>
						</tr>
						<tr>
							<td>扣款金额：</td><td><%=request.getParameter("r3_Amt")%>元(单位：人民币)</td>
						</tr>
						<tr>
							<%
								String r4_Cur = request.getParameter("r4_Cur");
								String currencyType="其它";
								if("RMB".equals(r4_Cur)){
									currencyType="人民币";
								}
							%>
							<td>交易币种：</td><td><%=currencyType%></td>
						</tr>
						<tr>
							<td>商品ID：</td><td><%=request.getParameter("r5_Pid")%></td>
						</tr>
						<tr>
							<td>商户订单号：</td><td><%=request.getParameter("r6_Order")%></td>
						</tr>
						<tr>
							<td>易宝会员ID：</td><td><%=request.getParameter("r7_Uid")%></td>
						</tr>
						<tr>
							<td>商户扩展信息：</td><td><%=request.getParameter("r8_MP")%></td>
						</tr>
						<tr>
							<%
								String r9_BType = request.getParameter("r9_BType");
								String backType="交易成功回调(浏览 器重定向)";
								if("2".equals(r9_BType)){
									backType="交易成功主动通知 (服务器点对点通讯)";
								}
							%>
							<td>交易结果返回类型：</td><td><%=backType%></td>
						</tr>
						<tr>
							<td>支付银行：</td><td><%=request.getParameter("rb_BankId")%></td>
						</tr>
						<tr>
							<td>支付时间：</td><td><%=request.getParameter("rp_PayDate")%></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>