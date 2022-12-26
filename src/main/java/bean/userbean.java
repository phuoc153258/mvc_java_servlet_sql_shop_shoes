package bean;


public class userbean {
	private int Id;
	private String Fullname;
	private String Username;
	private String Email;
	private String PhoneNumber;
	private String Password;
	private String Avatar;
	private int RoleId;
	public userbean(int id, String fullname, String username, String email, String phoneNumber, String password,
			String avatar, int roleId) {
		super();
		Id = id;
		Fullname = fullname;
		Username = username;
		Email = email;
		PhoneNumber = phoneNumber;
		Password = password;
		Avatar = avatar;
		RoleId = roleId;
	}
	public userbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getFullname() {
		return Fullname;
	}
	public void setFullname(String fullname) {
		Fullname = fullname;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getAvatar() {
		return Avatar;
	}
	public void setAvatar(String avatar) {
		Avatar = avatar;
	}
	public int getRoleId() {
		return RoleId;
	}
	public void setRoleId(int roleId) {
		RoleId = roleId;
	}
	
}
