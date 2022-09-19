package com.myAwesomeWeb.system.controller;

import com.myAwesomeWeb.system.domain.User;
import com.myAwesomeWeb.system.service.UserService;
import com.myAwesomeWeb.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
    @RequestMapping("/system/user")
public class UserController extends BaseController{
    @Resource
    private UserService userService;

    @GetMapping("/getUserById")
    public Result getUserById(Long id){
        User user = userService.selectUserById(id);
        return Result.success(user);
    }

    @GetMapping("/list")
    public Result list(){
        startPage();
        List<User> list = userService.list();
        return Result.page(list);
    }
}
