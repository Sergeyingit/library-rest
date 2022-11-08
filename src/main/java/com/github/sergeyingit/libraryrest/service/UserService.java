package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.entity.User;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;

import java.util.List;

public interface UserService {

    List<User> findAll();
    User findById(int id);
    User findByUsername(String username);
    User save(User user);
    void delete(User user);
    List<Book> findAllUserBooks(String username);
    Book findUserBookByBookId(String username, int id) throws NoSuchBookException;
    List<Book> addBookToUser(String username,Book book) throws NoSuchBookException;
    void deleteBookFromUser(String username, int id) throws NoSuchBookException;
}
