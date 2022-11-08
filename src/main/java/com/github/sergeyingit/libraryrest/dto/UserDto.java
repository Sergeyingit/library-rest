package com.github.sergeyingit.libraryrest.dto;

import com.github.sergeyingit.libraryrest.entity.Book;

import javax.validation.constraints.NotEmpty;
import java.util.List;

public class UserDto {

    private int id;

    @NotEmpty
    private String username;

    private List<BookUserDto> books;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<BookUserDto> getBooks() {
        return books;
    }

    public void setBooks(List<BookUserDto> books) {
        this.books = books;
    }
}
