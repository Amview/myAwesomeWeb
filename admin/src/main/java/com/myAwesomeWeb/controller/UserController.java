package com.myAwesomeWeb.controller;

import com.myAwesomeWeb.domain.User;
import com.myAwesomeWeb.service.UserService;
import com.myAwesomeWeb.utils.Result;
import lombok.val;
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
