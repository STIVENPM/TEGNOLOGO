package com.sena.crudbasic.dto;


public class CourseDto {

	private int id;
	private String name;
	//private List<Student> students;

	

	public int getId() {
		return id;
	}

	public CourseDto(int id, String name) {
		super();
		this.id = id;
		this.name = name;
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

	
}
