package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.userbean;
import bo.userbo;
import helper.helper;

/**
 * Servlet implementation class changePasswordHandle
 */
@WebServlet("/users/password/handle")
public class changePasswordHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePasswordHandle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			userbean user = (userbean) session.getAttribute("user");
			if (user == null) {
				response.sendRedirect("/ShopShoes/home");
				return;
			}
			
			String oldpassword = request.getParameter("oldpassword");
			String newpassword = request.getParameter("newpassword");
			String confirmpassword = request.getParameter("confirmpassword");
			if(!newpassword.equals(confirmpassword) ) {
				response.sendRedirect("/ShopShoes/home");
				return;
			}
			userbo ub = new userbo();
			ub.ChangePassword(user.getId(), helper.ecrypt(oldpassword) , helper.ecrypt(newpassword));
			session.setAttribute("user", ub.GetUserById(user.getId()));
			response.sendRedirect("/ShopShoes/users/information");
			return;
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
