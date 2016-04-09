package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Set;

/**
 * 实验室
 * Created by tristan on 16/4/6.
 */

@Entity(name = "LABORATORY")
public class Laboratory {

    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;


    private String labName;


    private String position;



    @ManyToOne
    private Labstyle labstyle;


    @OneToMany(mappedBy = "laboratory")
    private Set<Course> courses;



    @OneToMany(mappedBy = "laboratory")
    private Set<Equipment> equipments;


    @OneToMany(mappedBy = "laboratory")
    private Set<Module> modules;


    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getLabName() {
        return labName;
    }

    public void setLabName(String labName) {
        this.labName = labName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Labstyle getLabstyle() {
        return labstyle;
    }

    public void setLabstyle(Labstyle labstyle) {
        this.labstyle = labstyle;
    }

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }

    public Set<Equipment> getEquipments() {
        return equipments;
    }

    public void setEquipments(Set<Equipment> equipments) {
        this.equipments = equipments;
    }

    public Set<Module> getModules() {
        return modules;
    }

    public void setModules(Set<Module> modules) {
        this.modules = modules;
    }

}
