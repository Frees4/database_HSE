CREATE TABLE book (
  isbn_num int PRIMARY KEY,
  year int,
  book_name varchar,
  book author varchar,
  pages_num int,
  categories varchar
);

CREATE TABLE book_copy (
  copy_num int PRIMARY KEY,
  isbn_num int,
  shelf varchar,
  return_date date,
  reader_id int
);

CREATE TABLE categories (
  name varchar PRIMARY KEY,
  parent_cat varchar
);

CREATE TABLE reader (
  reader_id int PRIMARY KEY,
  surname varchar,
  name varchar,
  adress varchar,
  birthday date
);

CREATE TABLE publisher (
  name varchar PRIMARY KEY,
  adress varchar,
  isbn_num int
);

ALTER TABLE book ADD FOREIGN KEY (isbn_num) REFERENCES book_copy (isbn_num);
ALTER TABLE book ADD FOREIGN KEY (categories) REFERENCES categories (name);
ALTER TABLE book_copy ADD FOREIGN KEY (reader_id) REFERENCES reader (reader_id);
ALTER TABLE publisher ADD FOREIGN KEY (isbn_num) REFERENCES categories (isbn_num);