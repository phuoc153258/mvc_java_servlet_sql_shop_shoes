package bean;

public class detailproductbean {
	private int Id;
	private String Name;
	private String Image;
	private int Price;
	private int BrandId;
	private int OriginId;
	private int DesignId;
	private String BrandName;
	private String OriginName;
	private String DesignName;
	public detailproductbean(int id, String name, String image, int price, int brandId, int originId, int designId,
			String brandName, String originName, String designName) {
		super();
		Id = id;
		Name = name;
		Image = image;
		Price = price;
		BrandId = brandId;
		OriginId = originId;
		DesignId = designId;
		BrandName = brandName;
		OriginName = originName;
		DesignName = designName;
	}
	public detailproductbean() {
		super();
		// TODO Auto-generated constructor stub
	}
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
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getBrandId() {
		return BrandId;
	}
	public void setBrandId(int brandId) {
		BrandId = brandId;
	}
	public int getOriginId() {
		return OriginId;
	}
	public void setOriginId(int originId) {
		OriginId = originId;
	}
	public int getDesignId() {
		return DesignId;
	}
	public void setDesignId(int designId) {
		DesignId = designId;
	}
	public String getBrandName() {
		return BrandName;
	}
	public void setBrandName(String brandName) {
		BrandName = brandName;
	}
	public String getOriginName() {
		return OriginName;
	}
	public void setOriginName(String originName) {
		OriginName = originName;
	}
	public String getDesignName() {
		return DesignName;
	}
	public void setDesignName(String designName) {
		DesignName = designName;
	}
	
}
