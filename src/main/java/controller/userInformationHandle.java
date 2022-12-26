package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.userbean;
import bo.userbo;

/**
 * Servlet implementation class userInformationHandle
 */
@WebServlet("/users/information/handle")
public class userInformationHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userInformationHandle() {
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
		HttpSession session = request.getSession();
		userbean user = (userbean) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("/ShopShoes/home");
			return;
		}
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");

		if (fullname == "" || username == "" || email == "" || phonenumber == "" || fullname == null || username == null
				|| email == null || phonenumber == null) {
			response.sendRedirect("/ShopShoes/home");
			return;
		}
		userbo ub = new userbo();
		ub.UpdateUser(user.getId(), fullname, username, email, phonenumber);
		session.setAttribute("user", ub.GetUserById(user.getId()));
		response.sendRedirect("/ShopShoes/users/information");
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
