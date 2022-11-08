DROP TABLE IF EXISTS user_book;

CREATE TABLE user_book (
  user_id int NOT NULL,
    book_id int NOT NULL,
    PRIMARY KEY (user_id, book_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);