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
import bo.originbo;

/**
 * Servlet implementation class adminProductCreate
 */
@WebServlet("/admin/products/create")
public class adminProductCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminProductCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		brandbo bb = new brandbo();
		request.setAttribute("brands", bb.GetAllBrand());
		designbo db = new designbo();
		request.setAttribute("designs", db.GetAllDesign());
		originbo ob = new originbo();
		request.setAttribute("origins", ob.GetAllOrigin());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("/admin-product-create.jsp");
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
