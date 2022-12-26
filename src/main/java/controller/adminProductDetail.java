package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.brandbo;
import bo.designbo;
import bo.orderbo;
import bo.originbo;
import bo.productbo;

/**
 * Servlet implementation class adminProductDetail
 */
@WebServlet("/admin/products/detail")
public class adminProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminProductDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = request.getParameter("productId");
		brandbo bb = new brandbo();
		request.setAttribute("brands", bb.GetAllBrand());
		designbo db = new designbo();
		request.setAttribute("designs", db.GetAllDesign());
		originbo ob = new originbo();
		request.setAttribute("origins", ob.GetAllOrigin());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		if(productId==null || productId == "") {
			response.sendRedirect("/ShopShoes/admin/products");
			return;
		}
		productbo pb = new productbo();
		request.setAttribute("product", pb.GetProductById(Integer.parseInt(productId)));

		RequestDispatcher rd = request.getRequestDispatcher("/admin-product-detail.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
