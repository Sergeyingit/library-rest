package com.github.sergeyingit.libraryrest.service;

import com.github.sergeyingit.libraryrest.entity.Book;
import com.github.sergeyingit.libraryrest.entity.User;
import com.github.sergeyingit.libraryrest.exception_handling.NoSuchBookException;
import com.github.sergeyingit.libraryrest.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
//@CacheConfig(cacheNames = "uc")
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BookService bookService;

    @Override
//    @Cacheable
    public List<User> findAll() {
        return  userRepository.findAll();
    }


    /* Не кэшируется,
     * т.к. кэш не работает при вызове методов из того же класса
     * и вообще не очень надо
     */
    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    /*
     * Кэшируется метод для проверки доступа пользователя
     * т.к. на каждую операцию пользователя происходит проверка
     */
    @Override
    @Cacheable(value = "access")
    public User findByUsernameCheck(String username) {
        return userRepository.findByUsername(username);
    }

    /*
     * Кэш access обновляет ключ username
     * ( чтобы небыло ситуации когда пользователь с токеном,
     * но которого нет в таблице получил отказ в доступе,
     * а после добавления его в таблицу получил снова отказ из-за кэша access)
     */
    @Override
//    @Caching(put = {@CachePut(key = "#user.id"), @CachePut(value = "access", key = "#user.username")})
    @CachePut(value = "access", key = "#user.username")
    public User save(User user) {
        return userRepository.save(user);
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
