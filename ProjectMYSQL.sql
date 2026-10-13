CREATE DATABASE Library_System;
SHOW DATABASES;
USE Library_System;

CREATE TABLE Book (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Category_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

DESC Book;

CREATE TABLE Member (
    Member_ID INT PRIMARY KEY,
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

DESC Member;


CREATE TABLE Author (
    Author_ID INT PRIMARY KEY,
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100) NOT NULL,
    Nationality VARCHAR(60)
);

DESC Author;


CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

DESC Category;


CREATE TABLE BorrowDate (
    Book_ID INT,
    Member_ID INT,
    Date_Borrowed DATE,
    PRIMARY KEY (Book_ID, Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

DESC BorrowDate;


CREATE TABLE Book_Author (
    Book_ID INT,
    Author_ID INT,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
);

DESC Book_Author;


SHOW TABLES;

INSERT INTO Category (Category_ID, CategoryName) values
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Literature'),
(4, 'History'),
(5, 'Physics');

SELECT * FROM Category;

INSERT INTO Book (Book_ID, Title, ISBN, Category_ID) values 
(101, 'Introduction to Algorithms', '978-0262033848', 1),
(102, 'Calculus Early Transcendentals', '978-1285741550', 2),
(103, 'The Great Gatsby', '978-0743273565', 3),
(104, 'A Brief History of Time', '978-0553380163', 5),
(105, 'The Art of Computer Programming', '978-0201896831', 1);

SELECT * FROM Book;


INSERT INTO Member (Member_ID, Fname, Lname, Email) values 
(44600071, 'Sara', 'Khalid', 'sara@mail.com'),
(44600012, 'Khadija', 'Mohammed', 'khadija@mail.com'),
(44600011, 'Hala', 'Omar', 'hala@mail.com'),
(44600093, 'Layan', 'Mouath', 'layan@mail.com'),
(44600088, 'Nora', 'Fawaz', 'nora@mail.com');

SELECT * FROM Member;

INSERT INTO Author (Author_ID, Fname, Lname, Nationality) values 
(33300777, 'Reem', 'Faisal', 'Saudi'),
(33300101, 'Mohammed', 'Fahad', 'Saudi'),
(33300102, 'Osama', 'Bandar', 'Saudi'),
(33300203, 'Mark', 'Diaz', 'American'),
(33300111, 'Tala', 'Naif', 'Saudi');

SELECT * FROM Author;

INSERT INTO Book_Author (Book_ID, Author_ID) values
(101, 33300777),
(102, 33300111),
(103, 33300101),
(104, 33300203),
(105, 33300102);

SELECT * FROM Book_Author;

INSERT INTO BorrowDate (Book_ID, Member_ID, Date_Borrowed) VALUES 
(101, 44600071, '2026-04-23'),
(102, 44600012, '2026-04-22'),
(103, 44600011, '2026-04-21'),
(104, 44600093, '2026-04-20'),
(105, 44600088, '2026-04-19');

SELECT * FROM BorrowDate;


SELECT * FROM Book_Author;