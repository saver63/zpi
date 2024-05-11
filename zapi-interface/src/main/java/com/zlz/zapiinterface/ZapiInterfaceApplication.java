package com.zlz.zapiinterface;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * 该子系统为提供接口调用的系统
 */
@SpringBootApplication
public class ZapiInterfaceApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZapiInterfaceApplication.class, args);
    }

}
