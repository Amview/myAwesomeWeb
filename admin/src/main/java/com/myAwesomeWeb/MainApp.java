package com.myAwesomeWeb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.myAwesomeWeb.mapper")
public class MainApp {
    public static void main( String[] args ) {
        SpringApplication.run(MainApp.class,args);
    }
}
