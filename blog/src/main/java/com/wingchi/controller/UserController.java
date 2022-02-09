package com.wingchi.controller;

import com.wingchi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @RequestMapping("/user")
    @ResponseBody
    public String user( ) {
        return "hello";
    }


    @RequestMapping("/haha")
    @ResponseBody
    public String hello() {
        return "haha，你好";
    }
}
