package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.userbean;
import bo.orderbo;

/**
 * Servlet implementation class addProductCart
 */
@WebServlet("/cart/add")
public class addProductCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addProductCart() {
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
		String productId = request.getParameter("productId");
		HttpSession session = request.getSession();
		userbean user = (userbean) session.getAttribute("user");

		if (productId == null || productId == "") {
			response.sendRedirect("/ShopShoes/home");
			return;
		}

		if (user == null) {
			response.sendRedirect("/ShopShoes/login");
			return;
		}
		orderbo orb = new orderbo();
		orb.AddProductOrderUser(user.getId(), Integer.parseInt(productId));
		session.setAttribute("cart", orb.GetListOrderByUserId(user.getId()));
		response.sendRedirect("/ShopShoes/cart");
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
