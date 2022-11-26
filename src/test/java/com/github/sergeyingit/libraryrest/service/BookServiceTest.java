package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.repository.BookRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class BookServiceTest {

    private BookService bookService;

    private BookRepository bookRepository;

    private List<Book> books;

    @BeforeEach
    public void init() {
        bookRepository = Mockito.mock(BookRepository.class);
        bookService =  new BookServiceImpl(bookRepository);
        Book book1 = new Book();
        book1.setId(1);
        book1.setName("book1name");
        book1.setAuthor("author1");
        book1.setQuantity(10);
        book1.setQuantityCount(10);
        Book book2 = new Book();
        book2.setId(2);
        book2.setName("book2name");
        book2.setAuthor("author2");
        book2.setQuantity(10);
        book2.setQuantityCount(10);
        books = new ArrayList<>();
        books.add(book1);
        books.add(book2);



    }
    @Test
    void findAll() {
        Mockito.when(bookRepository.findAll()).thenReturn(books);
        List<Book> booksFound = bookService.findAll();

        assertEquals(2,booksFound.size());
        Mockito.verify(bookRepository, Mockito.times(1)).findAll();
    }

    @Test
    void findById() throws NoSuchBookException {
        int idValid = 1;
        int idNotValid = 10;
        Book book = books.get(idValid);

        Mockito.when(bookRepository.findById(book.getId())).thenReturn(Optional.of(book));
        Book bookFound = bookService.findById(book.getId());
        assertEquals(bookFound, book);
        Mockito.verify(bookRepository, Mockito.times(1)).findById(book.getId());

        Mockito.when(bookRepository.findById(idNotValid)).thenReturn(Optional.empty());
        Exception exception = assertThrows(NoSuchBookException.class, () ->  bookService.findById(idNotValid));
        String messageTest = "This book is not in the library's collection";
        assertEquals(messageTest, exception.getMessage());
        Mockito.verify(bookRepository, Mockito.times(1)).findById(idNotValid);


    }

    @Test
    void save() {
        Book bookNew = new Book();
        bookNew.setId(1);
        bookNew.setName("bookNewName");
        bookNew.setAuthor("authorNew");
        bookNew.setQuantity(10);
        bookNew.setQuantityCount(10);
        bookService.save(bookNew);
        Mockito.verify(bookRepository, Mockito.times(1)).save(bookNew);
    }

    @Test
    void delete() {
        Book book = books.get(0);
        bookService.delete(book.getId());
        Mockito.verify(bookRepository, Mockito.times(1)).deleteById(book.getId());
    }
}