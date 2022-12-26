package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.orderbean;
import bean.productbean;
import bo.brandbo;
import bo.designbo;
import bo.orderbo;
import bo.originbo;
import bo.productbo;
import dao.orderdao;

/**
 * Servlet implementation class home
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public home() {
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
		brandbo bb = new brandbo();
		request.setAttribute("brands", bb.GetAllBrand());
		designbo db = new designbo();
		request.setAttribute("designs", db.GetAllDesign());
		originbo ob = new originbo();
		request.setAttribute("origins", ob.GetAllOrigin());


		productbo pb = new productbo();
		String id = request.getParameter("indexP");
		int count = pb.TotalProduct();

		int indexPage;
		int pagesize = 12;

		if (id != null) {
			indexPage = Integer.parseInt(id);
		} else {
			indexPage = 1;
		}
		int endPage = count / pagesize;

		if (count % pagesize != 0) {
			endPage++;
		}

		String brandId = request.getParameter("brandId");
		String originId = request.getParameter("originId");
		String designId = request.getParameter("designId");
		String name = request.getParameter("name");
		request.setAttribute("ePage", endPage);
		request.setAttribute("tag", indexPage);

		ArrayList<productbean> listProduct = new ArrayList<productbean>();
		listProduct = pb.GetListProduct(pagesize, indexPage);
		if (brandId != null) {
			request.setAttribute("tagBrandId", Integer.parseInt(brandId));
			listProduct = pb.SearchByBrand(Integer.parseInt(brandId));
		}

		if (originId != null) {
			request.setAttribute("tagOriginId", Integer.parseInt(originId));
			listProduct = pb.SearchByOrigin(Integer.parseInt(originId));
		}

		if (designId != null) {
			request.setAttribute("tagDesignId", Integer.parseInt(designId));
			listProduct = pb.SearchByDesign(Integer.parseInt(designId));
		}

		if (name != null)
			listProduct = pb.SearchByName(name);
		
		request.setAttribute("products", listProduct);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
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
