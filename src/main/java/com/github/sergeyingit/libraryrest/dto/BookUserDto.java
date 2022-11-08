package com.github.sergeyingit.libraryrest.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;

public class BookUserDto extends BookDto{

    @Positive
    private int id;


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }
}
