package cn.gc.lab.repository;

import cn.gc.lab.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * Created by tristan on 16/4/6.
 */
public interface ProjectRepository extends JpaRepository<Project,String>,JpaSpecificationExecutor<Project>{

    List<Project> findByCourse_Teacher_User_Uuid(String userid);

}
