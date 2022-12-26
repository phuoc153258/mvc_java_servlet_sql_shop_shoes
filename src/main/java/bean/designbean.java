package bean;

public class designbean {
	private int Id;
	private String Name;
	public designbean(int id, String name) {
		super();
		Id = id;
		Name = name;
	}
	public designbean() {
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
}
