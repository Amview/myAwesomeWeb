package com.myAwesomeWeb.activemq;

import com.myAwesomeWeb.activemq.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

@Service
public class JmsService {

    private JmsTemplate jmsTemplate;

    @Autowired
    public JmsService(JmsTemplate jms){
        this.jmsTemplate = jms;
    }

    public void sendOrder(Order order){
        jmsTemplate.send(new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                return session.createObjectMessage(order);
            }
        });
    }

}
