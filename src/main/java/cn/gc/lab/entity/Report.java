package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Loader;

import javax.persistence.*;

/**
 * Created by tristan on 16/5/14.
 */
@Entity(name = "REPORT")
public class Report {
    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;


    private String sid;

    private String pid;

    private Integer score;

    private String name;

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Lob
    private byte[] report;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public byte[] getReport() {
        return report;
    }

    public void setReport(byte[] report) {
        this.report = report;
    }
}
