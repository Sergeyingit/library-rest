package com.github.sergeyingit.libraryrest.controller;

import com.github.sergeyingit.libraryrest.dto.BookAdminDto;
import com.github.sergeyingit.libraryrest.dto.util.Convert;
import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.service.BookService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/books")
@SecurityRequirement(name = "Bearer Authentication")
public class BooksRESTController {

    @Autowired
    private BookService bookService;

    @GetMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public List<BookAdminDto> getBooks() {
        List<Book> books = bookService.findAll();
        List<BookAdminDto> bookAdminDtos = books.stream().map(book -> Convert.BookToBookAdminDto(book)).collect(Collectors.toList());
        return bookAdminDtos;
    }

    @GetMapping("/{bookId}")
    @PreAuthorize("hasRole('ADMIN')")
    public BookAdminDto getBook(@PathVariable("bookId") int bookId) throws NoSuchBookException {
        Book book = bookService.findById(bookId);

        return Convert.BookToBookAdminDto(book);
    }

    @PostMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public BookAdminDto addBooks(@Valid @RequestBody BookAdminDto bookAdminDto) {
        Book book = Convert.BookAdminDtoToBook(bookAdminDto);
        Book savedBook = bookService.save(book);
        return Convert.BookToBookAdminDto(savedBook);
    }

    @PutMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public BookAdminDto updateBooks(@Valid @RequestBody BookAdminDto bookAdminDto) {
        Book book = Convert.BookAdminDtoToBook(bookAdminDto);
        Book savedBook = bookService.save(book);
        return Convert.BookToBookAdminDto(savedBook);
    }

    @DeleteMapping("/{bookId}")
    @PreAuthorize("hasRole('ADMIN')")
    public void deleteBooks(@PathVariable int bookId) {
        bookService.delete(bookId);
    }
}
