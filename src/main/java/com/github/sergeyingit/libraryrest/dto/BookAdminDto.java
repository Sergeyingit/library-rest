package com.github.sergeyingit.libraryrest.dto;

import com.github.sergeyingit.libraryrest.entity.User;

import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import java.util.List;

public class BookAdminDto extends BookDto {
    @PositiveOrZero
    private int id;

    private List<UserDto> users;

    private int quantityCount;

    public List<UserDto> getUsers() {
        return users;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsers(List<UserDto> users) {
        this.users = users;
    }

    public int getQuantityCount() {
        return quantityCount;
    }

    public void setQuantityCount(int quantityCount) {
        this.quantityCount = quantityCount;
    }

}
