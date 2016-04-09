package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Set;

/**
 * 课程
 * Created by tristan on 16/4/6.
 */
@Entity(name = "COURSE")
public class Course {
    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;

    private String courseName;

    @ManyToOne
    private Teacher teacher;


    @ManyToMany
    private Set<Student> students;


    @OneToMany(mappedBy = "course")
    private Set<Project> projects;


    @ManyToOne
    private Laboratory laboratory;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Laboratory getLaboratory() {
        return laboratory;
    }

    public void setLaboratory(Laboratory laboratory) {
        this.laboratory = laboratory;
    }
}
