package com.cduestc.service.entity;

public class ShortFoodWithIm extends ShortFood {
	private String info;
	
	private String message;
	
	private Float grade;
	
	private Integer commentNumber;

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getCommentNumber() {
		return commentNumber==null?0:commentNumber;
	}

	public void setCommentNumber(Integer commentNumber) {
		this.commentNumber = commentNumber;
	}

	public Float getGrade() {
		return grade==null?0:grade;
	}

	public void setGrade(Float grade) {
		this.grade = grade;
	}

}
