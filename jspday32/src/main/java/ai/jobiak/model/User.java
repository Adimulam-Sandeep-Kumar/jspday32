package ai.jobiak.model;

//Bean- a simple data class with some constraints
//A jsp is capable of creating objects
//property refers to bean instance variable
//parameter refers to the input element of the html

public class User implements java.io.Serializable {
	
	private String fname;
	private String email;
	private String mobile;
	
	public User() {
		// TODO Auto-generated constructor stub
		System.out.println("Bean Instantiated");
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
		System.out.println("Property is set to "+fname);
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	

}
