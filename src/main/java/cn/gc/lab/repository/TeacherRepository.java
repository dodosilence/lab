package cn.gc.lab.repository;

import cn.gc.lab.entity.Project;
import cn.gc.lab.entity.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by tristan on 16/4/6.
 */
public interface TeacherRepository extends JpaRepository<Teacher,String>,JpaSpecificationExecutor<Teacher> {
}
