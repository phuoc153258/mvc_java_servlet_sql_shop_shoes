package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.userbean;
import bo.orderbo;

/**
 * Servlet implementation class deleteItemCart
 */
@WebServlet("/cart/delete")
public class deleteItemCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteItemCart() {
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
		String orderId = request.getParameter("orderId");
		HttpSession session = request.getSession();
		orderbo orderb = new orderbo();

		userbean tk = (userbean) session.getAttribute("user");
		if (tk.getUsername() == "" || tk.getUsername() == null)
			response.sendRedirect("/ShopShoes/home");

		if (productId.equals("all")) {
			orderb.DeleteAllProductOrder(Integer.parseInt(orderId));
		}

		else
			orderb.DeleteProductOrder(Integer.parseInt(orderId), Integer.parseInt(productId));

		session.setAttribute("cart", orderb.GetListOrderByUserId(tk.getId()));
		
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
