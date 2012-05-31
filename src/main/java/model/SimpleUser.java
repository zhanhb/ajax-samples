package model;

import org.hibernate.validator.constraints.NotEmpty;

public class SimpleUser {
	
	@NotEmpty
	private String name = null;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
