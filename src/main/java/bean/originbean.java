package bean;

public class originbean {
	private int Id;
	private String Name;
	public originbean(int id, String name) {
		super();
		Id = id;
		Name = name;
	}
	public originbean() {
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
