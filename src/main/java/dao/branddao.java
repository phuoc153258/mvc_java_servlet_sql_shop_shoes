package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.brandbean;

public class branddao {
	protected KetNoi kn;

	public branddao() {
		super();
		this.kn = new KetNoi();
	}
	
	public ArrayList<brandbean> GetAllBrand(){
		try {
			ArrayList<brandbean> list = new ArrayList<brandbean>();
			kn.KetNoi();
			String sql = "select * from Brand";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				String Image = rs.getString("Image");
				brandbean b = new brandbean(Id, Name, Image);
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
