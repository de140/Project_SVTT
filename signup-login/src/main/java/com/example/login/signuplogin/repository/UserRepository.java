package com.example.login.signuplogin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.login.signuplogin.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
