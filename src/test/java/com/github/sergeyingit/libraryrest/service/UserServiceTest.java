package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.entity.User;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.repository.BookRepository;
import com.github.sergeyingit.libraryrest.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertThrows;

class UserServiceTest {

    private UserService userService;

    private UserRepository userRepository;

    private List<User> users;

    private BookService bookService;

    private BookRepository bookRepository;

    private List<Book> booksInLibrary;

    @BeforeEach
    public void init() {
        bookRepository = Mockito.mock(BookRepository.class);
        bookService =  new BookServiceImpl(bookRepository);
        userRepository = Mockito.mock(UserRepository.class);
        userService = new UserServiceImpl(userRepository, bookService);
        User user1 = new User("user1");
        User user2 = new User("user2");
        users = new ArrayList<>();
        users.add(user1);
        users.add(user2);


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

        List<Book> bookList1 = new ArrayList<>();
        bookList1.add(book1);
        bookList1.add(book2);
        user1.setBooks(bookList1);

        List<Book> bookList2 = new ArrayList<>();
        bookList2.add(book1);
        user2.setBooks(bookList2);


        //Для теста addBookToUser
        booksInLibrary = new ArrayList<>(bookList1);

        Book bookFromLibraryQuantityCountGreaterThanZero = new Book();
        bookFromLibraryQuantityCountGreaterThanZero.setId(5);
        bookFromLibraryQuantityCountGreaterThanZero.setName("book5name");
        bookFromLibraryQuantityCountGreaterThanZero.setAuthor("author5");
        bookFromLibraryQuantityCountGreaterThanZero.setQuantity(10);
        bookFromLibraryQuantityCountGreaterThanZero.setQuantityCount(10);

        Book bookFromLibraryQuantityCountZero = new Book();
        bookFromLibraryQuantityCountZero.setId(6);
        bookFromLibraryQuantityCountZero.setName("book6name");
        bookFromLibraryQuantityCountZero.setAuthor("author6");
        bookFromLibraryQuantityCountZero.setQuantity(10);
        bookFromLibraryQuantityCountZero.setQuantityCount(0);

        booksInLibrary.add(bookFromLibraryQuantityCountGreaterThanZero);
        booksInLibrary.add(bookFromLibraryQuantityCountZero);

    }

    @Test
    void findAll() {
        Mockito.when(userRepository.findAll()).thenReturn(users);
        List<User> users =  userService.findAll();
        assertEquals(2, users.size());
    }

    @Test
    void findByUsername() {
        User user = users.get(1);

        Mockito.when(userRepository.findByUsername(user.getUsername())).thenReturn(user);
        User userFound = userService.findByUsername(user.getUsername());
        assertEquals(userFound, user);
        Mockito.verify(userRepository, Mockito.times(1)).findByUsername(user.getUsername());

        String notValidUsername = "noname";
        Mockito.when(userRepository.findByUsername(notValidUsername)).thenReturn(null);
        assertThat(userService.findByUsername(notValidUsername)).isNull();
    }

    @Test
    void save() {
        User newUser = new User("newUser");
        userService.save(newUser);
        Mockito.verify(userRepository, Mockito.times(1)).save(newUser);
    }

    @Test
    void findAllUserBooks() {
        User user1 = users.get(0);
        User user2 = users.get(1);

        Mockito.when(userRepository.findByUsername(user1.getUsername())).thenReturn(user1);
        assertThat(userService.findAllUserBooks(user1.getUsername())).isNotNull();
        assertEquals(2,user1.getBooks().size());
        Mockito.verify(userRepository, Mockito.times(1)).findByUsername(user1.getUsername());

        Mockito.when(userRepository.findByUsername(user2.getUsername())).thenReturn(user2);
        assertThat(userService.findAllUserBooks(user2.getUsername())).isNotNull();
        assertEquals(1,user2.getBooks().size());
        Mockito.verify(userRepository, Mockito.times(1)).findByUsername(user2.getUsername());


    }

    @Test
    void findUserBookByBookId() throws NoSuchBookException {
        User user = users.get(0);
        Book bookUser = user.getBooks().get(1);

        Mockito.when(userRepository.findByUsername(user.getUsername())).thenReturn(user);


        Book bookFound1 = userService.findUserBookByBookId(user.getUsername(), bookUser.getId());
        assertThat(bookFound1).isNotNull();
        assertEquals(bookUser, bookFound1);

        Book newBook = new Book();
        newBook.setId(3);
        newBook.setName("newBook");
        newBook.setAuthor("newBookAuthor");
        newBook.setQuantity(10);
        newBook.setQuantityCount(10);

        Exception exception = assertThrows(NoSuchBookException.class, () -> userService.findUserBookByBookId(user.getUsername(), newBook.getId()));
        String messageTest = "This book is not in the user's collection";
        assertEquals(messageTest, exception.getMessage());
        Mockito.verify(userRepository, Mockito.times(2)).findByUsername(user.getUsername());
    }

    @Test
    void addBookToUser() throws NoSuchBookException {
        User user = users.get(0);

        Mockito.when(bookRepository.findAll()).thenReturn(booksInLibrary);
        Mockito.when(userRepository.findByUsername(user.getUsername())).thenReturn(user);

        Book bookFromLibraryQuantityCountGreaterThanZero = booksInLibrary.get(2);
        Book bookFromLibraryQuantityCountZero = booksInLibrary.get(3);
        Book bookIsNotInLibrary = new Book();
        bookIsNotInLibrary.setId(10);

        Exception exceptionNotInLibrary = assertThrows(NoSuchBookException.class,
                () -> userService.addBookToUser(user.getUsername(), bookIsNotInLibrary));
        String messageTestNotInLibrary = "This book is not in the library's collection";
        assertEquals(messageTestNotInLibrary, exceptionNotInLibrary.getMessage());

        Exception exceptionQuantityCountZero = assertThrows(NoSuchBookException.class,
                () -> userService.addBookToUser(user.getUsername(), bookFromLibraryQuantityCountZero));
        String messageTestQuantityCountZero = "The library is currently out of these books";
        assertEquals(messageTestQuantityCountZero, exceptionQuantityCountZero.getMessage());

        assertEquals(10,bookFromLibraryQuantityCountGreaterThanZero.getQuantityCount());
        List<Book> successAddBookAndReturnList = userService.addBookToUser(user.getUsername(), bookFromLibraryQuantityCountGreaterThanZero);
        assertEquals(3, successAddBookAndReturnList.size());
        assertEquals(9,bookFromLibraryQuantityCountGreaterThanZero.getQuantityCount());

        Mockito.verify(userRepository, Mockito.times(3)).findByUsername(user.getUsername());
        Mockito.verify(bookRepository, Mockito.times(3)).findAll();

    }

    @Test
    void deleteBookFromUser() throws NoSuchBookException {
        User user = users.get(0);
        Book bookUser = user.getBooks().get(0);

        int idBookIsNotLibrary = 7;

        Book bookIsNotUser = booksInLibrary.get(3);

        Mockito.when(userRepository.findByUsername(user.getUsername())).thenReturn(user);

        Mockito.when(bookRepository.findById(bookIsNotUser.getId())).thenReturn(Optional.ofNullable(bookIsNotUser));
        Exception exceptionBookIsNotUser = assertThrows(NoSuchBookException.class,
                () -> userService.deleteBookFromUser(user.getUsername(), bookIsNotUser.getId()));
        String messageBookIsNotUser = "This book is not in the user's collection";
        assertEquals(messageBookIsNotUser, exceptionBookIsNotUser.getMessage());

        Mockito.when(bookRepository.findById(idBookIsNotLibrary)).thenReturn(Optional.empty());
        Exception exceptionBookIsNotLibrary = assertThrows(NoSuchBookException.class,
                () -> userService.deleteBookFromUser(user.getUsername(), idBookIsNotLibrary));
        String messageBookIsNotLibrary = "This book is not in the library's collection";
        assertEquals(messageBookIsNotLibrary, exceptionBookIsNotLibrary.getMessage());

        Mockito.when(bookRepository.findById(bookUser.getId())).thenReturn(Optional.ofNullable(bookUser));

        assertEquals(10, bookUser.getQuantityCount());
        userService.deleteBookFromUser(user.getUsername(), bookUser.getId());
        assertEquals(11, bookUser.getQuantityCount());

        Mockito.verify(bookRepository, Mockito.times(1)).findById(bookIsNotUser.getId());
        Mockito.verify(bookRepository, Mockito.times(1)).findById(idBookIsNotLibrary);
        Mockito.verify(bookRepository, Mockito.times(1)).findById(bookUser.getId());

    }
}