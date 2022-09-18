package com.myAwesomeWeb.system.controller;

import com.myAwesomeWeb.activemq.JmsService;
import com.myAwesomeWeb.activemq.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Autowired
    private JmsService jmsService;

    @GetMapping("/a")
    public void test(){
        jmsService.sendOrder(new Order("消息测试"));
    }
}
