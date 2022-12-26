package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.orderbean;
import bean.userbean;
import bo.orderbo;

/**
 * Servlet implementation class handleCheckoutCart
 */
@WebServlet("/cart/pay/handle")
public class handleCheckoutCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public handleCheckoutCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String cardOwnerName = request.getParameter("cardOwnerName");
		String validCardNumber = request.getParameter("validCardNumber");
		String month = (String) request.getParameter("month");
		String year = (String) request.getParameter("year");
		String CVV = (String) request.getParameter("CVV");
		if (cardOwnerName == null || cardOwnerName == "" || validCardNumber == null || validCardNumber == ""
				|| month == null || month == "" || year == null || year == "") {
			response.sendRedirect("/ShopShoes/cart/pay");
			return;
		}
		HttpSession session = request.getSession();
		orderbean orb = (orderbean) session.getAttribute("cart");
		userbean userb = (userbean) session.getAttribute("user");
		orderbo orbo = new orderbo();
		orbo.UpdateStatusOrder(orb.getId());
		session.setAttribute("cart", orbo.GetListOrderByUserId(userb.getId()));
		response.sendRedirect("/ShopShoes/home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
