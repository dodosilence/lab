package cn.gc.lab.service;

import cn.gc.lab.entity.User;
import cn.gc.lab.exception.ServiceException;
import cn.gc.lab.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by tristan on 16/4/9.
 */

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public User findByUsernamePassword(String username, String password) throws ServiceException {

        User user = userRepository.findOneByUsername(username);
        if (user == null) {
            throw new ServiceException("无该用户");
        } else {
            if (user.getPassword().equals(password)) {
                return user;
            } else {
                throw new ServiceException("密码错误");
            }
        }
    }


}
