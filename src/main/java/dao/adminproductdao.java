package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.productbean;

public class adminproductdao {
	protected KetNoi kn;

	public adminproductdao() {
		super();
		this.kn = new KetNoi();
	}
	
	public ArrayList<productbean> GetListProduct(){
		try {
			ArrayList<productbean> list = new ArrayList<productbean>();
			kn.KetNoi();
			String sql = "select *\r\n"
					+ "from Product";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				String Image = rs.getString("Image");
				int Price = rs.getInt("Price");
				int BrandId = rs.getInt("BrandId");
				int OriginId = rs.getInt("OriginId");
				int DesignId = rs.getInt("DesignId");
				productbean sp = new productbean(Id, Name, Image, Price, BrandId, OriginId, DesignId);
				list.add(sp);
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
