package com.github.sergeyingit.libraryrest.service.security;

import com.github.sergeyingit.libraryrest.entity.User;
import com.github.sergeyingit.libraryrest.exception_handling.NoAccessException;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchUserException;
import org.springframework.security.oauth2.jwt.Jwt;

/**
 * Service for checking user rights by id in url.
 */
public interface CheckingUserRights {
    AccessType checkUser(String username, Jwt principal) throws NoSuchUserException, NoAccessException;
}
