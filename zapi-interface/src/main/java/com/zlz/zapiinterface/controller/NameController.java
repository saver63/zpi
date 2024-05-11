package com.zlz.zapiinterface.controller;

import com.zlz.zapiclientsdk.model.User;
import com.zlz.zapiclientsdk.utils.SignUtil;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 名称API
 *
 * @author example
 */
@RestController
@RequestMapping("/name")
public class NameController {

    @GetMapping("/")
    public String getNameByGet(String name){

        return "GET 你的名字是"+name;
    }

    @PostMapping("/")
    public String getNameByPost(@RequestParam String name){
        return "POST 你的名字是"+name;
    }

    @PostMapping("/user")
    public String getUsernameByPost(@RequestBody User user, HttpServletRequest request){;
        String accessKey = request.getHeader("accessKey");
        String nonce = request.getHeader("nonce");
        String timestamp = request.getHeader("timestamp");
        String sign = request.getHeader("sign");
        String body = request.getHeader("body");
        //todo 实际请求应该去数据库中查
        if (!accessKey.equals("zlz")){
            throw new RuntimeException("无权限访问");
        }
        //todo 随机数放到数据库中存储，用Redis或者hashMap存
        if (Long.parseLong(nonce) > 10000){
            throw new RuntimeException("无权限访问");
        }
        //todo 时间与当前时间不超过5分钟

        //body校验，也可以不校验，但是得通过body去生成sign
        //todo 实际情况中是从数据库中查secretKey
        String serviceSign = SignUtil.getSign(body, "zlzAdmin");
        if (!sign.equals(serviceSign)){
            throw new RuntimeException("无权限访问");
        }

        return "POST 用户名是"+user.getClass();
    }

}
