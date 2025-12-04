package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sena.crudbasic.model.Course;

@Repository
public interface CourseRepository 
extends JpaRepository<Course, Integer>
{
	/*JpaRepository
	 * Incluye las consultas basicas
	 * Para una consulta personalizada
	 * es requerido definir el método  necesario
	 * 
	 */
	
	@Query(""
			+ "SELECT "
			+ "c "
			+ "FROM "
			+ "course c "
			+ "WHERE "
			+ "c.name like %?1%"
			)
	public List<Course>filterByName(String name);
	
	/*
	 * @Query(""
			+ "SELECT "
			+ "s "
			+ "FROM "
			+ "student s "
			+ "WHERE "
			+ "s.first_name=?1 OR "
			+ "s.last_name=?2"
			
			)
	public List<Course>filterByName(
	String firstName,String lastName);
	
	 */

}
