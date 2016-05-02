package cn.gc.lab.repository;

import cn.gc.lab.entity.Project;
import cn.gc.lab.entity.ProjectEquMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * Created by tristan on 16/4/6.
 */
public interface ProjectEqpMapRepository extends JpaRepository<ProjectEquMap,String>,JpaSpecificationExecutor<ProjectEquMap>{


    ProjectEquMap findOneByEquipment_UuidAndProject_Uuid(String equipId, String pid);
}
