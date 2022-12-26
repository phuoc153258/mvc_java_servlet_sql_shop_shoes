package bean;

import java.util.ArrayList;

public class orderbean {
	private int Id;
	private String Name;
	private int Status;
	private int UserId;
	private ArrayList<orderdetailbean> OrderDetail;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public ArrayList<orderdetailbean> getOrderDetail() {
		return OrderDetail;
	}

	public void setOrderDetail(ArrayList<orderdetailbean> orderDetail) {
		OrderDetail = orderDetail;
	}

	public orderbean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public orderbean(int id, String name, int status, int userId, ArrayList<orderdetailbean> orderDetail) {
		super();
		Id = id;
		Name = name;
		Status = status;
		UserId = userId;
		OrderDetail = orderDetail;
	}

}
