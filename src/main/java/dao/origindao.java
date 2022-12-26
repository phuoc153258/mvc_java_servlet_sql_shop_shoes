package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.originbean;

public class origindao {
	protected KetNoi kn;

	public origindao() {
		super();
		this.kn = new KetNoi();
	}
	
	public ArrayList<originbean> GetAllOrigin(){
		try {
			ArrayList<originbean> list = new ArrayList<originbean>();
			kn.KetNoi();
			String sql = "select * from Origin";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				originbean b = new originbean(Id, Name);
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
