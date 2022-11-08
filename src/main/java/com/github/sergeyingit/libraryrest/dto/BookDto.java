package com.github.sergeyingit.libraryrest.dto;

import javax.validation.constraints.NotEmpty;


public class BookDto {



    @NotEmpty
    protected String name;

    @NotEmpty
    protected String author;

    protected int quantity;




    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
