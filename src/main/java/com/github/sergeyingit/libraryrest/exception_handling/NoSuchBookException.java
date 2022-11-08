package com.github.sergeyingit.libraryrest.exception_handling;

public class NoSuchBookException extends Exception{
    public NoSuchBookException(String message) {
        super(message);
    }
}
