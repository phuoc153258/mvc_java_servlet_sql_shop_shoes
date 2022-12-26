package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.userbo;
import helper.helper;

@WebServlet("/register/handle")
public class handleRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handleRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			String Fullname = request.getParameter("fullname");
			String Username = request.getParameter("username");
			String Email = request.getParameter("email");
			String Password = request.getParameter("password");
			String ConfirmPassword = request.getParameter("confirm-password");
			userbo DN = new userbo();
			
			if(Fullname!=null&&Username!=null&&Email!=null&&Password!=null&&ConfirmPassword!=null) {
				if(Password.equals(ConfirmPassword)) {
					DN.AddUser(Fullname, Username, Email, "", helper.ecrypt(Password), "", 2);
					response.sendRedirect("/ShopShoes/login");
				}
				else response.sendRedirect("/ShopShoes/register");
			}
			else response.sendRedirect("/ShopShoes/register");
			
		} catch (Exception e) {
			e.printStackTrace();
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
