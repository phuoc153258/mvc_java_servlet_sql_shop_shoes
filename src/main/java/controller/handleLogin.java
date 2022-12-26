package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loginbean;
import bean.orderdetailbean;
import bean.userbean;
import bo.orderbo;
import bo.userbo;
import helper.helper;

/**
 * Servlet implementation class handleLogin
 */
@WebServlet("/login/handle")
public class handleLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handleLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String Username = request.getParameter("txtUsername");
		String Password = request.getParameter("txtPassword");
		orderbo orderb = new orderbo();
		userbo DN = new userbo();
		if (Username!=null && Password!=null) {
			try {
				userbean userb = DN.Login(Username, Password);
				if (DN.Login(Username, Password)!=null){
					HttpSession session = request.getSession();
					session.setAttribute("user", userb);
					session.setAttribute("cart", orderb.GetListOrderByUserId(userb.getId()));
					response.sendRedirect("/ShopShoes/home");
				} else {
					response.sendRedirect("/ShopShoes/login?isLogin=1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("/ShopShoes/login");
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
