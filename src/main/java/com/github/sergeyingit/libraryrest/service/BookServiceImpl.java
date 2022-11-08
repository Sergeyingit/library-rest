package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookRepository bookRepository;

    @Override
    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    @Override
    public Book findById(int id) throws NoSuchBookException {
        Book book = bookRepository.findById(id).orElse(null);
        if (book == null) {
            throw new NoSuchBookException("This book is not in the library's collection");
        }
        return book;
    }

    @Override
    public Book save(Book book) {

        return bookRepository.save(book);
    }

    @Override
    public void delete(int id) {
        bookRepository.deleteById(id);
    }
}
