package cn.gc.lab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import cn.gc.lab.entity.Course;

public interface CourseRepository  extends  JpaRepository<Course, String>,JpaSpecificationExecutor<Course>{

	public Course findOneByCourseName(String courseName);
	
	
	public Course findOneByTeacher_User_Username(String username);


	public Course findOneByTeacher_Courses_CourseNameIn(List<String> courseNames);
	
	
}
