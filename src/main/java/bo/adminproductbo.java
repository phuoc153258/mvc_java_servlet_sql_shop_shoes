package bo;

import java.util.ArrayList;

import bean.productbean;
import dao.adminproductdao;

public class adminproductbo {
	adminproductdao apb = new adminproductdao();
	
	public ArrayList<productbean> GetListProduct(){
		return apb.GetListProduct();
	}
}
