package com.ecut.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    // 首页
    @GetMapping("/")
    public String index() {
        return "index";
    }
} 