package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.orderbean;
import bean.orderdetailbean;
import bean.productbean;
import bean.userbean;
import helper.helper;

public class orderdao {
	protected KetNoi kn;

	public orderdao() {
		super();
		this.kn = new KetNoi();
	}

	public orderbean GetListOrderByUserId(int userId) {
		try {
			orderbean cart = new orderbean();
			ArrayList<orderdetailbean> listOrderDetail = new ArrayList<orderdetailbean>();
			kn.KetNoi();
			String sql = "select *\r\n" + "from Cart\r\n" + "where Cart.Status=0 and Cart.UserId = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, userId);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				int Stauts = rs.getInt("Status");
				int UserId = rs.getInt("UserId");
				int ProductId = rs.getInt("ProductId");
				int Amount = rs.getInt("Amount");
				String ProductName = rs.getString("ProductName");
				String ProductImage = rs.getString("Image");
				int ProductPrice = rs.getInt("Price");
				orderdetailbean odbean = new orderdetailbean(UserId, ProductId, Amount, ProductName, ProductImage,
						ProductPrice);
				listOrderDetail.add(odbean);
				cart.setId(Id);
				cart.setName(Name);
				cart.setStatus(Stauts);
				cart.setUserId(UserId);
				cart.setOrderDetail(listOrderDetail);
			}
			rs.close();
			cmd.close();
			return cart;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void DeleteProductOrder(int orderId, int productId) {
		try {
			kn.KetNoi();
			String sql = "DELETE FROM [dbo].[OrderDetail]\r\n" + "      WHERE OrderId=? and ProductId=?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, orderId);
			cmd.setInt(2, productId);
			int rs = cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DeleteAllProductOrder(int orderId) {
		try {
			kn.KetNoi();
			String sql = "DELETE FROM [dbo].[OrderDetail]\r\n" + "      WHERE OrderId=?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, orderId);
			int rs = cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public orderbean GetOrderUser(int userId) {
		orderbean ob = null;
		try {
			kn.KetNoi();
			String sql = "select *\r\n" + "from [Order]\r\n" + "where [Order].UserId =?  and [Order].Status=0";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, userId);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				int Status = rs.getInt("Status");
				int UserId = rs.getInt("UserId");
				ob = new orderbean(Id, Name, Status, UserId, null);
			}
			rs.close();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ob;
	}

	public void AddOrderUser(int userId) {
		try {
			kn.KetNoi();
			String sql = "INSERT INTO [dbo].[Order]\r\n" + "           ([Name]\r\n" + "           ,[Status]\r\n"
					+ "           ,[UserId])\r\n" + "     VALUES\r\n" + "           (?, 0, ?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, helper.generateOrderName());
			cmd.setInt(2, userId);
			int rs = cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<orderdetailbean> GetOderDetail(int orderId) {
		try {
			KetNoi kn = new KetNoi();
			ArrayList<orderdetailbean> list = new ArrayList<orderdetailbean>();
			kn.KetNoi();
			String sql = "select *\r\n" + "from OrderDetail left join Product on OrderDetail.ProductId = Product.Id\r\n"
					+ "where OrderDetail.OrderId = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, orderId);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int OrderId = rs.getInt("OrderId");
				int ProductId = rs.getInt("ProductId");
				int Amount = rs.getInt("Amount");
				String ProductName = rs.getString("Name");
				String ProductImage = rs.getString("Image");
				int ProductPrice = rs.getInt("Price");
				orderdetailbean orb = new orderdetailbean(OrderId, ProductId, Amount, ProductName, ProductImage,
						ProductPrice);
				list.add(orb);
			}
			rs.close();
			cmd.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void UpdateAmountProductId(int orderId, int productId, int amount) {
		try {
			kn.KetNoi();
			String sql = "UPDATE [dbo].[OrderDetail]\r\n" + "   SET [Amount] = ?\r\n"
					+ " WHERE OrderId = ? and ProductId = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, amount);
			cmd.setInt(2, orderId);
			cmd.setInt(3, productId);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void AddProductOrderUser(int userId, int productId) {
		try {
			orderbean orderb = GetOrderUser(userId);
			if (orderb == null) {
				AddOrderUser(userId);
				orderb = GetOrderUser(userId);
			}
			ArrayList<orderdetailbean> listOrderDetail = GetOderDetail(orderb.getId());
			boolean isContainProduct = false;
			int Amount = 1;
			for (orderdetailbean item : listOrderDetail) {
				if (item.getProductId() == productId) {
					isContainProduct = true;
					Amount = item.getAmount();
				}
			}
			if (isContainProduct) {
				UpdateAmountProductId(orderb.getId(), productId, Amount + 1);
			} else {
				kn.KetNoi();
				String sql = "INSERT INTO [dbo].[OrderDetail]\r\n" + "           ([OrderId]\r\n"
						+ "           ,[ProductId]\r\n" + "           ,[Amount])\r\n" + "     VALUES\r\n"
						+ "           (?,?,1)";
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
				cmd.setInt(1, orderb.getId());
				cmd.setInt(2, productId);
				int rs = cmd.executeUpdate();
				cmd.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void UpdateStatusOrder(int orderId) {
		try {
			kn.KetNoi();
			String sql = "UPDATE [dbo].[Order]\r\n" + "   SET [Status] = 1\r\n" + " WHERE Id = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, orderId);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<orderbean> GetListHistoryPurchase(int userId) {
		try {
			ArrayList<orderbean> list = new ArrayList<orderbean>();
			kn.KetNoi();
			String sql = "SELECT [Id]\r\n"
					+ "      ,[Name]\r\n"
					+ "      ,[Status]\r\n"
					+ "      ,[UserId]\r\n"
					+ "  FROM [dbo].[Order]\r\n"
					+ "  where UserId = ? and Status= 1";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, userId);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int Id = rs.getInt("Id");
				list.add(GetListOrderById(Id));
			}
			rs.close();
			cmd.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public orderbean GetListOrderById(int id) {
		try {
			orderbean cart = new orderbean();
			ArrayList<orderdetailbean> listOrderDetail = new ArrayList<orderdetailbean>();
			kn.KetNoi();
			String sql = "select *\r\n" + "from Cart\r\n" + "where Cart.Status=1 and Cart.Id = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, id);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int Id = rs.getInt("Id");
				String Name = rs.getString("Name");
				int Stauts = rs.getInt("Status");
				int UserId = rs.getInt("UserId");
				int ProductId = rs.getInt("ProductId");
				int Amount = rs.getInt("Amount");
				String ProductName = rs.getString("ProductName");
				String ProductImage = rs.getString("Image");
				int ProductPrice = rs.getInt("Price");
				orderdetailbean odbean = new orderdetailbean(UserId, ProductId, Amount, ProductName, ProductImage,
						ProductPrice);
				listOrderDetail.add(odbean);
				cart.setId(Id);
				cart.setName(Name);
				cart.setStatus(Stauts);
				cart.setUserId(UserId);
				cart.setOrderDetail(listOrderDetail);
			}
			rs.close();
			cmd.close();
			return cart;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
