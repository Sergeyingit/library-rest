//package com.github.sergeyingit.libraryrest.repository;
//
//import com.github.sergeyingit.libraryrest.entity.User;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.jdbc.Sql;
//
//import static org.assertj.core.api.Assertions.assertThat;
//
//@SpringBootTest
//class UserRepositoryIntegrationTest {
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Sql(scripts = {"/sql/users.sql"})
//    @Test
//    void findByUsername() {
//        User userFound = userRepository.findByUsername("demo");
//        User userNotFound = userRepository.findByUsername("demodemo");
//
//        assertThat(userFound).isNotNull();
//        assertThat(userNotFound).isNull();
//
//    }
//}