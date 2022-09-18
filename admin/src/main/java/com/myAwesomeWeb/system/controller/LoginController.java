package com.myAwesomeWeb.system.controller;

import com.myAwesomeWeb.system.domain.User;
import com.myAwesomeWeb.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class LoginController {

    @Autowired
    private HttpSession httpSession;

    @PostMapping("/login")
    public Result login(String userName, String password){
        httpSession.setAttribute("user",userName);
        return Result.success();
    }
}
