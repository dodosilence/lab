package cn.gc.lab.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**项目
 * Created by tristan on 16/4/6.
 */
@Entity(name = "PROJECT")
public class Project {
    @Id
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @GeneratedValue(generator = "uuid")
    private String uuid;


    private String projectName;


    @ManyToOne
    private Course course;


    @OneToMany(mappedBy = "project")
    private Set<ProjectEquMap> projectEquMaps;




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
