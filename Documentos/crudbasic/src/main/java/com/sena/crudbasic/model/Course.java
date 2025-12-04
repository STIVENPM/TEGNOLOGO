package com.sena.crudbasic.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.OneToMany;

@Entity(name="course")
public class Course {
	
		//anotación bean para id de la entidad
		@Id
		//anotación para autoincremental
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		//indicar que el campo es una columna
		@Column(name="id_course")
		private int id;
		@Column(name="name", length = 50)
		private String name;
		
		@OneToMany(mappedBy = "course")
		private List<Student> students;

		public Course(int id, String name, List<Student> students) {
			super();
			this.id = id;
			this.name = name;
			this.students = students;
		}
		
		public Course() {
			super();
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

		public List<Student> getStudents() {
			return students;
		}

		public void setStudents(List<Student> students) {
			this.students = students;
		}
		

}
