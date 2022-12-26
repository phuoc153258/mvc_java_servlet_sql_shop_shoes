package bean;

public class orderdetailbean {
	private int OrderId;
	private int ProductId;
	private int Amount;
	private String ProductName;
	private String ProductImage;
	private int ProductPrice;
	public orderdetailbean(int orderId, int productId, int amount, String productName, String productImage,
			int productPrice) {
		super();
		OrderId = orderId;
		ProductId = productId;
		Amount = amount;
		ProductName = productName;
		ProductImage = productImage;
		ProductPrice = productPrice;
	}
	public orderdetailbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}
	public int getProductPrice() {
		return ProductPrice;
	}
	public void setProductPrice(int productPrice) {
		ProductPrice = productPrice;
	}
	
}
