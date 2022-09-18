package com.myAwesomeWeb.activemq;

import com.myAwesomeWeb.activemq.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.BrowserCallback;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Date;

@Component
public class Test {

    @Autowired
    private JmsTemplate jmsTemplate;

//    @Scheduled(cron = "0/1 * * * * ? ")
    public void t(){

        System.out.println(new Date());
    }
}
