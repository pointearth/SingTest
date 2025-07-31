package com.cxm.singapore.SingTest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@RestController
public class HelloController {
    @Value("${CLIENT_ID:unknown-client}")   // default value if not present
    private String clientId;
    @GetMapping("/")
    public String hello() {
        return clientId + ", Hello from Spring Boot MVC!";
    }
}
