package cn.gc.lab.repository;

import cn.gc.lab.entity.Course;
import cn.gc.lab.entity.Equipment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EquipmentRepository extends  JpaRepository<Equipment, String>,JpaSpecificationExecutor<Equipment>{


    List<Equipment> findByLaboratory_Uuid(String uuid);

    @Query(nativeQuery = true,value = "SELECT count(uuid) FROM EQUIPMENT")
    int countEqu();
}
