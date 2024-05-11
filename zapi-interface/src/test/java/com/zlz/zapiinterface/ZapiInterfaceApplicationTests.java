package com.zlz.zapiinterface;

import com.zlz.zapiclientsdk.client.ZpiClient;
import com.zlz.zapiclientsdk.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class ZapiInterfaceApplicationTests {

    @Resource
    private ZpiClient zpiClient;

    @Test
    void contextLoads() {
        String result = zpiClient.getNameByGet("zlz");
        User user = new User();
        user.setUsername("zlz");
        String usernameByPost = zpiClient.getUsernameByPost(user);
        System.out.println(result);
        System.out.println(usernameByPost);
    }

}
