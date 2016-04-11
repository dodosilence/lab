package cn.gc.lab.repository;

import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by tristan on 16/4/6.
 */
public interface StudentRepository extends JpaRepository<Student, String>, JpaSpecificationExecutor<Student> {
}
