package bo;

import java.util.ArrayList;

import bean.designbean;
import dao.designdao;

public class designbo {
	designdao dd = new designdao();
	
	public ArrayList<designbean> GetAllDesign(){
		return dd.GetAllDesign();
	}
}
