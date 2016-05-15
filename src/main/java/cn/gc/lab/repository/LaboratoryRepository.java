package cn.gc.lab.repository;

import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by tristan on 16/4/6.
 */
public interface LaboratoryRepository extends JpaRepository<Laboratory, String>, JpaSpecificationExecutor<Laboratory> {
    List<Laboratory> findByLabstyle_Uuid(String labstyleUuid);



    List<Laboratory> findByLabName(String keyword);

    List<Laboratory> findByLabNameLike(String keyword);

    @Query(nativeQuery = true,value = "SELECT count(uuid) FROM LABORATORY")
    int countLabs();
}
