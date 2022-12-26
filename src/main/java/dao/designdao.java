package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.designbean;

public class designdao {
	protected KetNoi kn;

	public designdao() {
		super();
		this.kn = new KetNoi();
	}
	
	public ArrayList<designbean> GetAllDesign() {
		try {
			ArrayList<designbean> list = new ArrayList<designbean>();
			kn.KetNoi();
			String sql = "select * from Design";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				designbean b = new designbean(Id, Name);
				list.add(b);
			}
			rs.close();
			cmd.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
