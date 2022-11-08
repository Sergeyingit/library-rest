DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  author varchar(255) NOT NULL,
  quantity int,
  quantity_count int,
  PRIMARY KEY (id)
);