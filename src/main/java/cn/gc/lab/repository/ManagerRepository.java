package cn.gc.lab.repository;

import cn.gc.lab.entity.Manager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by tristan on 16/4/6.
 */
public interface ManagerRepository extends JpaRepository<Manager, String>, JpaSpecificationExecutor<Manager> {
	
}
