package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.detailproductbean;
import bean.productbean;

public class productdao {
//	protected KetNoi kn;
//
//	public productdao() {
//		super();
//		this.kn = new KetNoi();
//	}

	public ArrayList<productbean> GetListProduct(int pageSize, int page) {
		try {
			KetNoi kn = new KetNoi();
			ArrayList<productbean> list = new ArrayList<productbean>();
			kn.KetNoi();
			String sql = "SELECT *\r\n" + "FROM (\r\n" + "SELECT	*, ROW_NUMBER() OVER(ORDER BY Id) AS RowNumber\r\n"
					+ "FROM	Product\r\n" + "WHERE	(N'' = N'') OR (Product.Name LIKE N'')) AS c\r\n"
					+ "WHERE (? = 0 ) OR ( c.RowNumber BETWEEN (? - 1) * ? + 1 AND ? * ? )\r\n"
					+ "ORDER BY c.RowNumber;";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, pageSize);
			cmd.setInt(2, page);
			cmd.setInt(3, pageSize);
			cmd.setInt(4, page);
			cmd.setInt(5, pageSize);
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

	public int totalProduct() {
		int count = 1;
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			String sql = "select count(*) as c from Product";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			if (rs.next())
				count = rs.getInt("c");
			rs.close();
			cmd.close();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return count;
		}
	}

	public detailproductbean GetProductById(int id) {
		detailproductbean p = null;
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			String sql = "select * \r\n" + "from [DetailProduct]\r\n" + "where id = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, id);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				String Image = rs.getString("Image");
				int Price = rs.getInt("Price");
				int BrandId = rs.getInt("BrandId");
				int OriginId = rs.getInt("OriginId");
				int DesignId = rs.getInt("DesignId");
				String BrandName = rs.getString("BrandName");
				String OriginName = rs.getString("OriginName");
				String DesignName = rs.getString("DesignName");
				p = new detailproductbean(Id, Name, Image, Price, BrandId, OriginId, DesignId, BrandName, OriginName,
						DesignName);
			}
			rs.close();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	public void UpdateProduct(int id, String name, int price, int brand, int origin, int design) {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			String sql = "UPDATE [dbo].[Product]\r\n" + "   SET [Name] =?\r\n" + "      ,[Price] =?\r\n"
					+ "      ,[BrandId] = ?\r\n" + "      ,[OriginId] = ?\r\n" + "      ,[DesignId] = ?\r\n"
					+ " WHERE Id = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, name);
			cmd.setInt(2, price);
			cmd.setInt(3, brand);
			cmd.setInt(4, origin);
			cmd.setInt(5, design);
			cmd.setInt(6, id);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DeleteProduct(int id) {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			String sql = "DELETE FROM [dbo].[Product]\r\n" + "      WHERE Id=?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, id);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void CreateProduct(String name, int Price, int BrandId, int OriginId, int DesignId) {
		try {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			String sql = "INSERT INTO [dbo].[Product]\r\n" + "           ([Name]\r\n" + "           ,[Image]\r\n"
					+ "           ,[Price]\r\n" + "           ,[BrandId]\r\n" + "           ,[OriginId]\r\n"
					+ "           ,[DesignId])\r\n" + "     VALUES\r\n" + "           (?\r\n" + "           ,?\r\n"
					+ "           ,?\r\n" + "           ,?\r\n" + "           ,?\r\n" + "           ,?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, name);
			cmd.setString(2, "images/image_shoes_1.jpg");
			cmd.setInt(3, Price);
			cmd.setInt(4, BrandId);
			cmd.setInt(5, OriginId);
			cmd.setInt(6, DesignId);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
