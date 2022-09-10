package com.myAwesomeWeb.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.myAwesomeWeb.domain.User;

import java.util.List;

public interface UserService extends IService<User> {

    List<User> selectUser(User user);

    User selectUserById(Long id);
}
