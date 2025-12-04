package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sena.crudbasic.dto.CourseDto;
import com.sena.crudbasic.model.Course;
import com.sena.crudbasic.repository.CourseRepository;
import com.sena.crudbasic.service.CourseService;

@Service
public class CourseServiceImpl
implements CourseService{
	
	@Autowired
	private CourseRepository repo;
	/*
	public CourseServiceImpl(CourseRepository repo) {
		this.repo=repo;
	}
	*/

	@Override
	public List<Course> findAll() {
		
		return this.repo.findAll();
	}

	@Override
	public Course findById(int id) {
		// TODO Auto-generated method stub
		return repo.findById(id).orElse(null);
	}

	@Override
	public List<Course> filterByName(String name) {
		// TODO Auto-generated method stub
		return repo.filterByName(name);
	}
	//conversor del DTO al model
	public Course dtoToModel(CourseDto courseDto) {
		return new Course 
				(
				courseDto.getId(),
				courseDto.getName(),
				null
		);
	}
	public CourseDto modelToDto(Course course) {
		return new CourseDto(
				course.getId(),
				course.getName()
				);
	}

	
	@Override
	public String save(CourseDto courseDto) {
		Course course=dtoToModel(courseDto);
		repo.save(course);
		return null;
	}

	@Override
	public String delete(int id) {
		repo.deleteById(id);
		return null;
	}

}
