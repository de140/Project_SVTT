package com.example.login.signuplogin.web;
import com.example.login.signuplogin.model.Role;
import com.example.login.signuplogin.model.User;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class MainController {

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/user")
    public String home() {
        return "index";
    }

    @GetMapping("/admin")
    public String admin() { return "admin"; }

//    @GetMapping("/login1")
//    public String login1() {
//        return "login1";
//    }

    @GetMapping("/loginOK")
    public String loginOK(Principal principal) {

        User userLogin = (User) ((Authentication) principal).getPrincipal();

        for (Role role : userLogin.getRoles()){
            if("ROLE_MANAGER".equalsIgnoreCase(role.getName())){
                return "redirect:/admin"; // Home Admin
            }
        }

        return "redirect:/index"; // Home User
    }
}