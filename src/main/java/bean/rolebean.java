package bean;

public class rolebean {
	private int Id;
	private String Name;
	public rolebean(int id, String name) {
		super();
		Id = id;
		Name = name;
	}
	public rolebean() {
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
