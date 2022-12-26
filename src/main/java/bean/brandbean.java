package bean;

public class brandbean {
	private int Id;
	private String Name;
	private String Image;
	public brandbean(int id, String name, String image) {
		super();
		Id = id;
		Name = name;
		Image = image;
	}
	public brandbean() {
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
}
