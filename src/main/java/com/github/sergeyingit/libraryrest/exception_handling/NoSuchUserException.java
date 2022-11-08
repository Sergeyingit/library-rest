package com.github.sergeyingit.libraryrest.exception_handling;

public class NoSuchUserException extends Exception{
    public NoSuchUserException(String message) {
        super(message);
    }
}
