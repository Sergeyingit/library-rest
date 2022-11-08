package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookService {
    List<Book> findAll();
    Book findById(int id) throws NoSuchBookException;
    Book save(Book book);
    void delete(int id);
}
