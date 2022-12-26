package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import bean.productbean;
import bo.productbo;

/**
 * Servlet implementation class adminProductUpdate
 */
@WebServlet("/admin/products/update")
public class adminProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminProductUpdate() {
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String brand = request.getParameter("brand");
		String origin = request.getParameter("origin");
		String design = request.getParameter("design");
		if (id == null || name == null || price == null || brand == null || origin == null || design == null || id == ""
				|| name == "" || price == "" || brand == "" || origin == "" || design == "") {
			response.sendRedirect("/ShopShoes/admin/products");
			return;
		}
		productbo pb = new productbo();
		pb.UpdateProduct(Integer.parseInt(id), name, Integer.parseInt(price), Integer.parseInt(brand),
				Integer.parseInt(origin), Integer.parseInt(design));
		response.sendRedirect("/ShopShoes/admin/products/detail?productId=" + id);
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
