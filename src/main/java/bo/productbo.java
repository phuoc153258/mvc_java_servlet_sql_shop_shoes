package bo;

import java.util.ArrayList;

import bean.detailproductbean;
import bean.productbean;
import dao.productdao;

public class productbo {
	productdao pd = new productdao();
	ArrayList<productbean> list;

	public ArrayList<productbean> GetListProduct(int pagesize, int page) {
		list = pd.GetListProduct(pagesize, page);
		return list;
	}

	public int TotalProduct() {
		return pd.totalProduct();
	}

	public ArrayList<productbean> SearchByBrand(int brandId) {
		ArrayList<productbean> temp = new ArrayList<productbean>();
		for (productbean s : list)
			if (s.getBrandId() == (brandId))
				temp.add(s);
		return temp;
	}

	public ArrayList<productbean> SearchByOrigin(int originId) {
		ArrayList<productbean> temp = new ArrayList<productbean>();
		for (productbean s : list)
			if (s.getOriginId() == (originId))
				temp.add(s);
		return temp;
	}

	public ArrayList<productbean> SearchByDesign(int designId) {
		ArrayList<productbean> temp = new ArrayList<productbean>();
		for (productbean s : list)
			if (s.getDesignId() == (designId))
				temp.add(s);
		return temp;
	}

	public ArrayList<productbean> SearchByName(String name) {
		ArrayList<productbean> temp = new ArrayList<productbean>();
		for (productbean s : list)
			if (s.getName().toLowerCase().contains(name.toLowerCase()))
				temp.add(s);
		return temp;
	}
	
	public detailproductbean GetProductById(int id) {
		return pd.GetProductById(id);
	}
	
	public void UpdateProduct(int id, String name, int price, int brand, int origin, int design) {
		pd.UpdateProduct(id, name,price, brand, origin, design);
	}
	
	public void DeleteProduct(int id) {
		pd.DeleteProduct(id);
	}
	
	public void AddProduct(String name, int Price, int BrandId, int OriginId, int DesignId) {
		pd.CreateProduct(name, Price, BrandId, OriginId, DesignId);
	}
}
