package cn.gc.lab.repository;

import cn.gc.lab.entity.Course;
import cn.gc.lab.entity.Labstyle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface LabstyleRepository extends  JpaRepository<Labstyle, String>,JpaSpecificationExecutor<Labstyle>{


	
	
}
