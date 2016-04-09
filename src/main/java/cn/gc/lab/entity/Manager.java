package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 管理员
 * Created by tristan on 16/4/6.
 */

@Entity(name = "MANAGER")
public class Manager {

    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;


    @OneToOne
    private User user;



    private String permission;





}
