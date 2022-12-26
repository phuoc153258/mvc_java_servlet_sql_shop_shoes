package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.userbean;
import helper.helper;

public class userdao {
	protected KetNoi kn;

	public userdao() {
		super();
		this.kn = new KetNoi();
	}

	public userbean Login(String username, String password) {
		userbean tk = null;

		try {
			kn.KetNoi();
			String sql = "select * from [User] where Username=? and Password=?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, username);
			cmd.setString(2, helper.ecrypt(password));
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				int Id = rs.getInt("Id");
				String Fullname = rs.getString("Fullname");
				String Username = rs.getString("Username");
				String Email = rs.getString("Email");
				String PhoneNumber = rs.getString("PhoneNumber");
				String Password = rs.getString("Password");
				String Avatar = rs.getString("Avatar");
				int RoleId = rs.getInt("RoleId");
				tk = new userbean(Id, Fullname, Username, Email, PhoneNumber, Password, Avatar, RoleId);
			}
			rs.close();
			cmd.close();
			return tk;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<userbean> GetAllUser() {
		try {
			ArrayList<userbean> list = new ArrayList<userbean>();
			kn.KetNoi();
			String sql = "select * from user_info";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int Id = rs.getInt("Id");
				String Fullname = rs.getString("Fullname");
				String Username = rs.getString("Username");
				String Email = rs.getString("Email");
				String PhoneNumber = rs.getString("PhoneNumber");
				String Password = rs.getString("Password");
				String Avatar = rs.getString("Avatar");
				int RoleId = rs.getInt("RoleId");
				userbean tk = new userbean(Id, Fullname, Username, Email, PhoneNumber, Password, Avatar, RoleId);
				list.add(tk);
			}
			rs.close();
			cmd.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void AddUser(String Fullname, String Username, String Email, String PhoneNumber, String Password,
			String Avatar, int RoleId) {
		try {
			kn.KetNoi();
			String sql = "INSERT INTO [User] (Fullname, Username, Email, PhoneNumber, Password,\r\n"
					+ "			Avatar,RoleId) VALUES (?,?,?,?,?,?,?);";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, Fullname);
			cmd.setString(2, Username);
			cmd.setString(3, Email);
			cmd.setString(4, PhoneNumber);
			cmd.setString(5, Password);
			cmd.setString(6, Avatar);
			cmd.setInt(7, RoleId);
			cmd.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void UpdateUser(int Id, String Fullname, String Username, String Email, String PhoneNumber) {
		try {
			kn.KetNoi();
			String sql = "update [User] set Fullname=?, Username=?, Email=?, PhoneNumber=? where Id=?;";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, Fullname);
			cmd.setString(2, Username);
			cmd.setString(3, Email);
			cmd.setString(4, PhoneNumber);
			cmd.setInt(5, Id);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DeleteUser(int Id) {
		try {
			kn.KetNoi();
			String sql = "DELETE FROM [User] WHERE Id = ?;";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, Id);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public userbean GetUserById(int userId) {
		userbean tk = null;

		try {
			kn.KetNoi();
			String sql = "select * from [User] where Id=?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, userId);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				int Id = rs.getInt("Id");
				String Fullname = rs.getString("Fullname");
				String Username = rs.getString("Username");
				String Email = rs.getString("Email");
				String PhoneNumber = rs.getString("PhoneNumber");
				String Password = rs.getString("Password");
				String Avatar = rs.getString("Avatar");
				int RoleId = rs.getInt("RoleId");
				tk = new userbean(Id, Fullname, Username, Email, PhoneNumber, Password, Avatar, RoleId);
			}
			rs.close();
			cmd.close();
			return tk;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void ChangePassword(int Id, String oldpassword, String newpassword) {
		try {
			kn.KetNoi();
			String sql = "update [User] set Password=? where Id=? and Password=? ;";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, newpassword);
			cmd.setInt(2, Id);
			cmd.setString(3, oldpassword);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
