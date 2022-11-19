package com.github.sergeyingit.libraryrest.controller;

import com.github.sergeyingit.libraryrest.dto.BookUserDto;
import com.github.sergeyingit.libraryrest.dto.UserDto;
import com.github.sergeyingit.libraryrest.dto.util.Convert;
import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.entity.User;
import com.github.sergeyingit.libraryrest.exception_handling.NoAccessException;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchUserException;
import com.github.sergeyingit.libraryrest.service.UserService;
import com.github.sergeyingit.libraryrest.service.security.AccessType;
import com.github.sergeyingit.libraryrest.service.security.CheckingUserRights;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;


@RestController
@RequestMapping("/api/users")
@SecurityRequirement(name = "Bearer Authentication")
@CrossOrigin(origins = "${client.url}")
public class UsersRESTController {

    @Autowired
    private UserService userService;

    @Autowired
    private CheckingUserRights checkingUserRights;

    @GetMapping()
    @PreAuthorize("hasRole('ADMIN')")
    public List<UserDto> getUsers() {
        List<User> users = userService.findAll();
        List<UserDto> userDtos = users.stream().map(user -> Convert.UserToUserDto(user)).collect(Collectors.toList());
        return userDtos;
    }

    @GetMapping("/{username}")
    @PreAuthorize("hasRole('USER')")
    public UserDto getUser(@PathVariable("username") String username, @Parameter(hidden = true) @AuthenticationPrincipal Jwt principal) throws NoSuchUserException, NoAccessException {
        User user = userService.findByUsername(username);
        AccessType accessType = checkingUserRights.checkUser(username,principal);

        switch (accessType) {
            case ALLOWED:
                break;
            case DENIED:
                throw new NoAccessException("No access to the requested resource");
            default:
                throw new NoSuchUserException("There is no user with username = " + username);
        }

        return Convert.UserToUserDto(user);
    }

    @PostMapping("")
    @PreAuthorize("hasRole('USER')")
    public UserDto addUser(@Valid @RequestBody UserDto userDto) {
        User user = Convert.UserDtoToUser(userDto);
        User savedUser = userService.save(user);
        return Convert.UserToUserDto(savedUser);
    }

    @GetMapping("/{username}/books")
    @PreAuthorize("hasRole('USER')")
    public List<BookUserDto> getUserBooks(@PathVariable("username") String username, @Parameter(hidden = true) @AuthenticationPrincipal Jwt principal) throws NoAccessException, NoSuchUserException {
        AccessType accessType = checkingUserRights.checkUser(username,principal);

        switch (accessType) {
            case ALLOWED:
                break;
            case DENIED:
                throw new NoAccessException("No access to the requested resource");
            default:
                throw new NoSuchUserException("There is no user with username = " + username);
        }
        List<Book> books = userService.findAllUserBooks(username);
        return books.stream().map(book -> Convert.BookToBookUserDto(book)).collect(Collectors.toList());
    }

    @GetMapping("/{username}/books/{bookId}")
    @PreAuthorize("hasRole('USER')")
    public BookUserDto getUserBook(@PathVariable("username") String username, @PathVariable("bookId") int bookId, @Parameter(hidden = true) @AuthenticationPrincipal Jwt principal) throws NoAccessException, NoSuchUserException, NoSuchBookException {
        AccessType accessType = checkingUserRights.checkUser(username,principal);

        switch (accessType) {
            case ALLOWED:
                break;
            case DENIED:
                throw new NoAccessException("No access to the requested resource");
            default:
                throw new NoSuchUserException("There is no user with username = " + username);
        }
        Book book = userService.findUserBookByBookId(username, bookId);
        return Convert.BookToBookUserDto(book);
    }

    @PostMapping("/{username}/books")
    @PreAuthorize("hasRole('USER')")
    public List<BookUserDto> addUserBooks(@PathVariable("username") String username, @Valid @RequestBody BookUserDto bookUserDto, @Parameter(hidden = true) @AuthenticationPrincipal Jwt principal) throws NoSuchBookException, NoAccessException, NoSuchUserException {
        AccessType accessType = checkingUserRights.checkUser(username,principal);

        switch (accessType) {
            case ALLOWED:
                break;
            case DENIED:
                throw new NoAccessException("No access to the requested resource");
            default:
                throw new NoSuchUserException("There is no user with username = " + username);
        }
        Book book = Convert.BookUserDtoToBook(bookUserDto);
        List<Book> books = userService.addBookToUser(username, book);
        return books.stream().map(b -> Convert.BookToBookUserDto(b)).collect(Collectors.toList());
    }

    @DeleteMapping("/{username}/books/{bookId}")
    @PreAuthorize("hasRole('USER')")
    public void deleteUserBook(@PathVariable("username") String username, @PathVariable("bookId") int bookId, @Parameter(hidden = true) @AuthenticationPrincipal Jwt principal) throws NoSuchBookException, NoAccessException, NoSuchUserException {
        AccessType accessType = checkingUserRights.checkUser(username,principal);

        switch (accessType) {
            case ALLOWED:
                break;
            case DENIED:
                throw new NoAccessException("No access to the requested resource");
            default:
                throw new NoSuchUserException("There is no user with username = " + username);
        }
        userService.deleteBookFromUser(username, bookId);
    }


}
