package com.myAwesomeWeb.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.myAwesomeWeb.system.domain.User;
import com.myAwesomeWeb.system.domain.vo.DictValue;

import java.util.List;

public interface UserService extends IService<User> {

    List<User> selectUser(User user);

    User selectUserById(Long id);

    List<DictValue> getUserDictList();
}
