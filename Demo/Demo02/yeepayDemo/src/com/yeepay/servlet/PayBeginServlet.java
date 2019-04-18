package com.yeepay.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yeepay.util.PropertiesUtil;
import com.yeepay.util.YeePayUtil;

/**
 * 处理开始付款请求
 */
public class PayBeginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderNumber=request.getParameter("orderNumber");//订单号
		String payAmount=request.getParameter("payAmount");//付款金额
		String bankCode=request.getParameter("bankCode"); //选择的支付银行

		// 付款需要的参数:
		String p0_Cmd = "Buy"; // 业务类型  请求命令,在线支付固定为Buy
		String p1_MerId = PropertiesUtil.getValue("p1_MerId");// 商户编号
		String p2_Order = orderNumber;// 订单编号
		String p3_Amt = payAmount; // 付款金额
		String p4_Cur = "CNY"; // 交易币种
		String p5_Pid = ""; // 商品id
		String p6_Pcat = ""; // 商品种类
		String p7_Pdesc = ""; // 商品描述
		String p8_Url = PropertiesUtil.getValue("p8_Url"); // 支付结束后,处理返回数据的地址
		String p9_SAF = ""; // 送货地址 即需要填写送货信息 0：不需要 1:需要
		String pa_MP = ""; // 商户扩展信息
		String pd_FrpId = bankCode;// 支付通道编码，即银行编码
		String pr_NeedResponse = "1"; // 应答机制 1: 需要应答机制; 0: 不需要应答机制
		String keyValue = PropertiesUtil.getValue("keyValue"); // 商户密钥
		String hmac = YeePayUtil.getHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue); // hmac

		request.setAttribute("p0_Cmd", p0_Cmd);
		request.setAttribute("p1_MerId", p1_MerId);
		request.setAttribute("p2_Order", p2_Order);
		request.setAttribute("p3_Amt", p3_Amt);
		request.setAttribute("p4_Cur", p4_Cur);
		request.setAttribute("p5_Pid", p5_Pid);
		request.setAttribute("p6_Pcat", p6_Pcat);
		request.setAttribute("p7_Pdesc", p7_Pdesc);
		request.setAttribute("p8_Url", p8_Url);
		request.setAttribute("p9_SAF", p9_SAF);
		request.setAttribute("pa_MP", pa_MP);
		request.setAttribute("pd_FrpId", pd_FrpId);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);
		request.setAttribute("hmac", hmac);
		request.getRequestDispatcher("sendPayInfo.jsp").forward(request, response);//向易宝支付发送支付信息
	}
}