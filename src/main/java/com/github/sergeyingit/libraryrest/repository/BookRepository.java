package com.github.sergeyingit.libraryrest.repository;

import com.github.sergeyingit.libraryrest.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository  extends JpaRepository<Book, Integer> {
}
