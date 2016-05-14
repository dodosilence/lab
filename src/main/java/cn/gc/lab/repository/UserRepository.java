package cn.gc.lab.repository;

import cn.gc.lab.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.sql.ResultSet;
import java.util.Map;

/**
 * Created by tristan on 16/4/9.
 */
public interface UserRepository extends JpaRepository<User, String>, JpaSpecificationExecutor<User> {

    User findOneByUsername(String username);


    @Query(nativeQuery = true, value = "SELECT count(TEACHER.uuid),count(STUDENT.uuid),count(MANAGER.uuid)\n" +
            "FROM USER\n" +
            "  LEFT JOIN TEACHER ON TEACHER.user_uuid = USER.uuid\n" +
            "  LEFT JOIN MANAGER ON MANAGER.user_uuid = USER.uuid\n" +
            "  LEFT JOIN STUDENT ON STUDENT.user_uuid = USER.uuid;")
    String mgrcount();


}
