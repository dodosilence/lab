package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Set;


/**
 * 设备
 * Created by tristan on 16/4/6.
 */
@Entity(name = "EQUIPMENT")
public class Equipment {
    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;


    private String eName;

    @Column(columnDefinition = "int default 0")
    private Integer usefullCount=0;

    @Column(columnDefinition = "int default 0")
    private Integer brokenCount=0;

    @Column(columnDefinition = "int default 0")
    private Integer borrowdCount=0;

    @OneToMany(mappedBy = "equipment", fetch = FetchType.EAGER)
    private Set<ProjectEquMap> projectEquMaps;


    private Double price;


    @ManyToOne(fetch = FetchType.EAGER)
    private Laboratory laboratory;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public Integer getUsefullCount() {
        return usefullCount;
    }

    public void setUsefullCount(Integer usefullCount) {
        this.usefullCount = usefullCount;
    }

    public Integer getBrokenCount() {
        return brokenCount;
    }

    public void setBrokenCount(Integer brokenCount) {
        this.brokenCount = brokenCount;
    }

    public Integer getBorrowdCount() {
        return borrowdCount;
    }

    public void setBorrowdCount(Integer borrowdCount) {
        this.borrowdCount = borrowdCount;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Laboratory getLaboratory() {
        return laboratory;
    }

    public void setLaboratory(Laboratory laboratory) {
        this.laboratory = laboratory;
    }
}
