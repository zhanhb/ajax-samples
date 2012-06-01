package model;

import org.hibernate.validator.constraints.NotEmpty;

public class SimpleUser {
	
	@NotEmpty
	private String firstName = null;
	
	@NotEmpty
	private String lastName = null;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	
}
