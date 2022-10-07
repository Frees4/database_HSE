CREATE TABLE book_copy (
    copy_num INT PRIMARY KEY,
    book_id INT NOT NULL,
    shelf VARCHAR (50),
    return_date DATE,
    reader_id INT
);