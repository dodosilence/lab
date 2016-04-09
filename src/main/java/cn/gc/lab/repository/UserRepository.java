package cn.gc.lab.repository;

import cn.gc.lab.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by tristan on 16/4/9.
 */
public interface UserRepository extends JpaRepository<User,String>,JpaSpecificationExecutor<User> {

    User findOneByUsername(String username);
}
