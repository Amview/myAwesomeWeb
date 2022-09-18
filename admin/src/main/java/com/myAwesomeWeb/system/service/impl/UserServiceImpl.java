package com.myAwesomeWeb.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.myAwesomeWeb.system.domain.Dict;
import com.myAwesomeWeb.system.domain.User;
import com.myAwesomeWeb.system.domain.vo.DictValue;
import com.myAwesomeWeb.system.mapper.UserMapper;
import com.myAwesomeWeb.system.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

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

    @Override
    public List<DictValue> getUserDictList() {
        List<DictValue> dictValues = new ArrayList<>();
        List<User> users = userMapper.selectList(null);
        for (User user : users) {
            dictValues.add(new DictValue(user.getUserName(),String.valueOf(user.getId())));
        }
        return dictValues;
    }
}
