package com.example.login.signuplogin.service;

import com.example.login.signuplogin.model.User;
import com.example.login.signuplogin.web.dto.UserRegistrationDto;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User save(UserRegistrationDto registrationDto);
}
