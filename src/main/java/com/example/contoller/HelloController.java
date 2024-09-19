package com.example.contoller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "Hello from Jenkins and Kubernetes!";
    }

    @GetMapping("/test")
    public String test() {
        return "gitlab webhook test";
    }
}