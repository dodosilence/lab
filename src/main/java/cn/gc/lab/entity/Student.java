package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.ManyToAny;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by tristan on 16/4/9.
 */
@Entity(name = "STUDENT")
public class Student {
    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;

    @OneToOne(cascade = CascadeType.REMOVE)
    private  User user;

    @ManyToMany(fetch = FetchType.EAGER,mappedBy = "students")
    private Set<Course> courses;

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
