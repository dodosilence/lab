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

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
