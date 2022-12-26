package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.userbean;
import dao.userdao;

public class userbo {
	userdao ud = new userdao();

	public userbo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public userbean Login(String username, String password) {
		return ud.Login(username, password);
	}

	public ArrayList<userbean> GetAllUser() {
		return ud.GetAllUser();
	}

	public void AddUser(String Fullname, String Username, String Email, String PhoneNumber, String Password,
			String Avatar, int RoleId) {
		ud.AddUser(Fullname, Username, Email, PhoneNumber, Password, Avatar, RoleId);
	}
	
	public void UpdateUser(int Id,String Fullname, String Username, String Email, String PhoneNumber) {
		ud.UpdateUser(Id, Fullname, Username, Email, PhoneNumber);
	}
	
	public void DeleteUser(int Id) {
		ud.DeleteUser(Id);
	}
	
	public userbean GetUserById(int Id) {
		return ud.GetUserById(Id);
	}
	
	public void ChangePassword(int Id, String oldpassword, String newpassword) {
		ud.ChangePassword(Id, oldpassword, newpassword);
	}
}
