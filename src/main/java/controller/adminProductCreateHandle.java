package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.productbo;

/**
 * Servlet implementation class adminProductCreateHandle
 */
@WebServlet("/admin/products/create/handle")
public class adminProductCreateHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminProductCreateHandle() {
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
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String brand = request.getParameter("brand");
		String origin = request.getParameter("origin");
		String design = request.getParameter("design");
		if (name == null || price == null || brand == null || origin == null || design == null || name == ""
				|| price == "" || brand == "" || origin == "" || design == "") {
			response.sendRedirect("/ShopShoes/admin/products");
			return;
		}
		productbo pb = new productbo();
		pb.AddProduct(name, Integer.parseInt(price), Integer.parseInt(brand), Integer.parseInt(origin),
				Integer.parseInt(design));
		response.sendRedirect("/ShopShoes/admin/products");
		return;
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
