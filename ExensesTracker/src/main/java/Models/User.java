package Models;

public class User {
	protected int id;
	protected String name;
	protected String password;
	protected String role;
	public User(String name, String password, String role) {
		super();
		this.name = name;
		this.password = password;
		this.role = role;
	}
	
	
	public User(int id, String name, String password,String role) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.role = role;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	
	
	
}
