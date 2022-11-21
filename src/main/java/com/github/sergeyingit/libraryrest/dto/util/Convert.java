package com.github.sergeyingit.libraryrest.dto.util;

import com.github.sergeyingit.libraryrest.dto.BookAdminDto;
import com.github.sergeyingit.libraryrest.dto.BookUserDto;
import com.github.sergeyingit.libraryrest.dto.UserDto;
import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.entity.User;

import java.util.List;
import java.util.stream.Collectors;

public class Convert {

    public static BookUserDto BookToBookUserDto(Book book) {
        BookUserDto bookUserDto = new BookUserDto();
        bookUserDto.setId(book.getId());
        bookUserDto.setName(book.getName());
        bookUserDto.setAuthor(book.getAuthor());
        bookUserDto.setQuantity(book.getQuantity());
        return bookUserDto;
    }

    public static Book BookUserDtoToBook(BookUserDto bookUserDto) {
        Book book = new Book();
        book.setId(bookUserDto.getId());
        book.setName(bookUserDto.getName());
        book.setAuthor(bookUserDto.getAuthor());
        book.setQuantity(bookUserDto.getQuantity());
        return book;
    }

    public static BookAdminDto BookToBookAdminDto(Book book) {
        BookAdminDto bookAdminDto = new BookAdminDto();
        bookAdminDto.setId(book.getId());
        bookAdminDto.setName(book.getName());
        bookAdminDto.setAuthor(book.getAuthor());
        bookAdminDto.setQuantity(book.getQuantity());
        bookAdminDto.setQuantityCount(book.getQuantityCount());
        List<User> users = book.getUsers();
        if (users != null) {
            List<UserDto> userDtos = users.stream().map(user -> Convert.UserToUserDto(user)).collect(Collectors.toList());
            bookAdminDto.setUsers(userDtos);
        }

        return bookAdminDto;
    }

    public static Book BookAdminDtoToBook(BookAdminDto bookAdminDto) {
        Book book = new Book();
        book.setId(bookAdminDto.getId());
        book.setName(bookAdminDto.getName());
        book.setAuthor(bookAdminDto.getAuthor());
        book.setQuantity(bookAdminDto.getQuantity());
        book.setQuantityCount(bookAdminDto.getQuantityCount());
        List<UserDto> userDtos = bookAdminDto.getUsers();
        if (userDtos != null) {
            List<User> users = userDtos.stream().map(userDto -> Convert.UserDtoToUser(userDto)).collect(Collectors.toList());
            book.setUsers(users);
        }
        return book;
    }

    public static UserDto UserToUserDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setUsername(user.getUsername());
        List<Book> books = user.getBooks();
        if (books != null) {
            List<BookUserDto> bookUserDtos = user.getBooks().stream().map(b -> Convert.BookToBookUserDto(b)).collect(Collectors.toList());

            userDto.setBooks(bookUserDtos);
        }
        return userDto;
    }

    public static User UserDtoToUser(UserDto userDto) {
        User user = new User();
        user.setId(userDto.getId());
        user.setUsername(userDto.getUsername());
        return user;
    }
}
