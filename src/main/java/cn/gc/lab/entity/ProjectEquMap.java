package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * Created by tristan on 16/4/9.
 */

@Entity(name="PROJECTEQUMAP")
public class ProjectEquMap {

    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;

    @ManyToOne
    private Project project;

    @ManyToOne
    private Equipment equipment;

    private Integer count;

    private Integer status;



}
