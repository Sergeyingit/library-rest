package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
//@CacheConfig(cacheNames = "bc")
public class BookServiceImpl implements BookService{

//    @Autowired
    private BookRepository bookRepository;

    @Autowired
    public BookServiceImpl(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @Override
//    @Cacheable
    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    @Override
//    @Cacheable(key = "#id")
    public Book findById(int id) throws NoSuchBookException {
        Book book = bookRepository.findById(id).orElse(null);
        if (book == null) {
            throw new NoSuchBookException("This book is not in the library's collection");
        }
        return book;
    }

    @Override
//    @CachePut(key = "#book.id")
    public Book save(Book book) {

        return bookRepository.save(book);
    }

    @Override
//    @CacheEvict(key = "#id")
    public void delete(int id) {
        bookRepository.deleteById(id);
    }
}
