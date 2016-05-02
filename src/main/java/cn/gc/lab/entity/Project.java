package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * 项目
 * Created by tristan on 16/4/6.
 */
@Entity(name = "PROJECT")
public class Project {
    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;


    private String projectName;

    @Column(nullable = false)
    private Integer status=0;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @ManyToOne
    private Course course;


    @OneToMany(mappedBy = "project",fetch = FetchType.EAGER)
    private Set<ProjectEquMap> projectEquMaps;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Set<ProjectEquMap> getProjectEquMaps() {
        return projectEquMaps;
    }

    public void setProjectEquMaps(Set<ProjectEquMap> projectEquMaps) {
        this.projectEquMaps = projectEquMaps;
    }

    public Date getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(Date startDateTime) {
        this.startDateTime = startDateTime;
    }

    public Date getEndDateTime() {
        return endDateTime;
    }

    public void setEndDateTime(Date endDateTime) {
        this.endDateTime = endDateTime;
    }

    private Date startDateTime;

    private Date endDateTime;


    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

}
