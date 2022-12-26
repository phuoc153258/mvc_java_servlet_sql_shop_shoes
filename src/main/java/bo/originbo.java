package bo;

import java.util.ArrayList;

import bean.originbean;
import dao.origindao;

public class originbo {
	origindao od = new origindao();
	
	public ArrayList<originbean> GetAllOrigin(){
		return od.GetAllOrigin();
	}
}
