package com.myAwesomeWeb.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.myAwesomeWeb.system.domain.User;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    List<User> selectUser(User user);

    User selectUserById(Long id);
}
