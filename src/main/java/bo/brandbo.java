package bo;

import java.util.ArrayList;

import bean.brandbean;
import dao.branddao;

public class brandbo {
	branddao bd = new branddao();
	
	public ArrayList<brandbean> GetAllBrand(){
		return bd.GetAllBrand();
	}
}
