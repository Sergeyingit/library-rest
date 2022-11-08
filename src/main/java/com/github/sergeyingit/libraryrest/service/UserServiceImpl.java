package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.entity.User;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BookService bookService;

    @Override
    public List<User> findAll() {
        return  userRepository.findAll();
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }


    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }

    @Override
    public List<Book> findAllUserBooks(String username) {
        User user = this.findByUsername(username);
        return user.getBooks();
    }

    @Override
    public Book findUserBookByBookId(String username, int id) throws NoSuchBookException {
        List<Book> books = this.findAllUserBooks(username);
        Book bookResult = books.stream().filter(book -> book.getId() == id).findFirst().orElse(null);
        if (bookResult == null) {
            throw new NoSuchBookException("This book is not in the user's collection");
        }
        return bookResult;
    }

    @Override
    public List<Book> addBookToUser(String username, Book book) throws NoSuchBookException {
        User user = this.findByUsername(username);
        Book bookInLibrary = bookService.findAll().stream().filter(b -> b.equals(book)).findFirst().orElse(null);

        if (bookInLibrary == null) {
            throw new NoSuchBookException("This book is not in the library's collection");
        }

        int quantityCount = bookInLibrary.getQuantityCount();

        if (quantityCount > 0) {
            user.addBookToUser(bookInLibrary);

            bookInLibrary.setQuantityCount(--quantityCount);
            this.save(user);
        } else {
            throw new NoSuchBookException("The library is currently out of these books");
        }

        return user.getBooks();
    }

    @Override
    public void deleteBookFromUser(String username, int id) throws NoSuchBookException {
        User user = this.findByUsername(username);
        Book book = bookService.findById(id);

        if (book == null) {
            throw new NoSuchBookException("This book is not in the library's collection");
        }
        if (!user.getBooks().contains(book)) {
            throw new NoSuchBookException("This book is not in the user's collection");
        }
        int quantityCount = book.getQuantityCount();

        user.deleteBookFromUser(book);

        book.setQuantityCount(++quantityCount);

        this.save(user);

    }
}
