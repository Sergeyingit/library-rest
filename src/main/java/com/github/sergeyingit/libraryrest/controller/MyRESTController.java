package com.github.sergeyingit.libraryrest.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.oauth2.jwt.Jwt;

@RestController
@RequestMapping("/api")
public class MyRESTController {

    @GetMapping("user")
    @PreAuthorize("hasRole('USER')")
    public String helloUser() {
        return "Hello, user";
    }

    @GetMapping("admin")
    @PreAuthorize("hasRole('ADMIN')")
    public String helloAdmin(@AuthenticationPrincipal Jwt principal) {

        return "Hello, admin " + "principal.getClaimAsString(\"preferred_username\")" + principal.getClaimAsString("preferred_username") + "principal.getClaimAsString(\"profile\")" + principal.getClaimAsString("profile") + "principal.getClaimAsString(\"email\")" + principal.getClaimAsString("email");
    }

}
