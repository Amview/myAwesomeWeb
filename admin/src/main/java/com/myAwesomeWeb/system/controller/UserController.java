package com.myAwesomeWeb.system.controller;

import com.myAwesomeWeb.system.domain.User;
import com.myAwesomeWeb.system.service.UserService;
import com.myAwesomeWeb.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/system/user")
public class UserController {
    @Resource
    private UserService userService;

    @GetMapping("/getUserById")
    public Result getUserById(Long id){
        User user = userService.selectUserById(id);
        return Result.success(user);
    }
}
