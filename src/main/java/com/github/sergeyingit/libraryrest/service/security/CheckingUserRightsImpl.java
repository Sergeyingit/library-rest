package com.github.sergeyingit.libraryrest.service.security;

import com.github.sergeyingit.libraryrest.entity.User;
import com.github.sergeyingit.libraryrest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;

@Service
public class CheckingUserRightsImpl implements CheckingUserRights{
    @Autowired
    private UserService userService;

    @Override
    public AccessType checkUser(String username, Jwt principal){
        String name = principal.getClaimAsString("preferred_username");
        User currentUser = userService.findByUsername(name);

        User requestUser = userService.findByUsername(username);
        if (requestUser == null) {

            return AccessType.NOT_FOUND;
        }
        if (currentUser != null &&currentUser.equals(requestUser)) {
            return AccessType.ALLOWED;
        } else {
            return AccessType.DENIED;
        }

    }
}
