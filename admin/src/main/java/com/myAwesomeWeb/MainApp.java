package com.myAwesomeWeb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan(basePackages = "com.myAwesomeWeb.system.mapper")
@EnableScheduling
public class MainApp {
    public static void main( String[] args ) {
        SpringApplication.run(MainApp.class,args);
    }
}
