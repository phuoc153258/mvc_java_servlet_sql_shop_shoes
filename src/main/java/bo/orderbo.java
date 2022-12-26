package bo;

import java.util.ArrayList;

import bean.orderbean;
import dao.orderdao;

public class orderbo {
	orderdao od = new orderdao();
	
	public orderbean GetListOrderByUserId(int userId) {
		return od.GetListOrderByUserId(userId);
	}
	
	public void DeleteProductOrder(int orderId,int productId) {
		od.DeleteProductOrder(orderId, productId);
	}
	
	public void DeleteAllProductOrder(int orderId) {
		od.DeleteAllProductOrder(orderId);
	}
	
	public void AddProductOrderUser(int userId, int productId) {
		od.AddProductOrderUser(userId, productId);
	}
	
	public void UpdateAmountProductId(int orderId, int productId, int amount) {
		od.UpdateAmountProductId(orderId, productId, amount);
	}
	
	public void UpdateStatusOrder(int orderId) {
		od.UpdateStatusOrder(orderId);
	}
	
	public ArrayList<orderbean> GetListHistoryPurchase(int userId){
		return od.GetListHistoryPurchase(userId);
	}
	
	public orderbean GetListOrderById(int id) {
		return od.GetListOrderById(id);
	}
}
