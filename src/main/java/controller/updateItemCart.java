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
 * Servlet implementation class updateItemCart
 */
@WebServlet("/cart/update")
public class updateItemCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateItemCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String productId = request.getParameter("productId");
		String amount = request.getParameter("amount");
		if(productId==null || amount == null) {
			response.sendRedirect("/ShopShoes/home");
			return;
		}
		HttpSession session = request.getSession();
		orderbean orb = (orderbean) session.getAttribute("cart");
		userbean user = (userbean) session.getAttribute("user");
		orderbo orbo = new orderbo();
		orbo.UpdateAmountProductId(orb.getId(), Integer.parseInt(productId), Integer.parseInt(amount));
		session.setAttribute("cart", orbo.GetListOrderByUserId(user.getId()));		
		response.sendRedirect("/ShopShoes/cart");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
