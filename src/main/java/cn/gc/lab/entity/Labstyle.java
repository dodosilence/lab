package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Set;

/**
 * 实验室分类
 * Created by tristan on 16/4/6.
 */
@Entity(name = "LABSTYLE")
public class Labstyle {
    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;

    private String styleName;

    @OneToMany(mappedBy = "labstyle",fetch = FetchType.EAGER)
    protected Set<Laboratory> laboratorys;


    public Set<Laboratory> getLaboratorys() {
        return laboratorys;
    }

    public void setLaboratorys(Set<Laboratory> laboratorys) {
        this.laboratorys = laboratorys;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getStyleName() {
        return styleName;
    }

    public void setStyleName(String styleName) {
        this.styleName = styleName;
    }

}
