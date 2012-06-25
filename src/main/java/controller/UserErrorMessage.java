package controller;

public class UserErrorMessage {

	private String fieldName;
	private String message;
	
	public UserErrorMessage(String fieldName, String message) {
		this.fieldName = fieldName;
		this.message = message;
	}
	public String getFieldName() {
		return fieldName;
	}
	public String getMessage() {
		return message;
	}
	
}
