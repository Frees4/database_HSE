CREATE TABLE book (
    book_id INT PRIMARY KEY,
    isbn_num INT,
    year DATE,
    book_name VARCHAR (50) NOT NULL,
    book_author VARCHAR (50),
    book_pages_num INT,
    categories VARCHAR (50)
);