package com.sena.crudbasic.service;

import java.util.List;

import com.sena.crudbasic.dto.CourseDto;
import com.sena.crudbasic.model.Course;

public interface CourseService {

	/*
	 * findAll
	 * findById
	 * filterByName
	 * save
	 * delete
	 */
	public List<Course> findAll();
	public Course findById(int id);
	public List<Course> filterByName(String name);
	public String save(CourseDto c);
	public String delete(int id);
}
