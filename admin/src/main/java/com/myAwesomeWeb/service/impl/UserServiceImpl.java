package com.myAwesomeWeb.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.myAwesomeWeb.domain.User;
import com.myAwesomeWeb.mapper.UserMapper;
import com.myAwesomeWeb.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public List<User> selectUser(User user) {
        return userMapper.selectUser(user);
    }

    @Override
    public User selectUserById(Long id) {
        return userMapper.selectUserById(id);
    }
}
