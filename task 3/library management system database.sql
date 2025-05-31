CREATE DATABASE library;

SHOW DATABASES;

USE library;

CREATE TABLE books(
	book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    total_copies INT,
    available_copies INT
);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE librarians (
    librarian_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    hire_date DATE
);

INSERT INTO books VALUES
(1, '1984', 'George Orwell', 'Fiction', 5, 3),
(2, 'Sapiens', 'Yuval Noah Harari', 'History', 4, 2),
(3, 'The Alchemist', 'Paulo Coelho', 'Fiction', 6, 6);

SELECT * FROM books;

INSERT INTO members VALUES
(101, 'Alice Smith', 'alice@example.com', '2023-01-15'),
(102, 'Bob Johnson', 'bob@example.com', '2023-02-01');

SELECT * FROM members;

INSERT INTO loans VALUES
(201, 1, 101, '2023-03-01', '2023-03-15', NULL),
(202, 2, 102, '2023-03-05', '2023-03-19', '2023-03-18');

SELECT * FROM loans;

INSERT INTO librarians VALUES
(301, 'Emma White', 'emma@example.com', '2022-10-01');

SELECT * FROM librarians;

SELECT m.name, b.title, l.issue_date
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN books b ON l.book_id = b.book_id;

SELECT b.title, m.name
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;

SELECT genre, COUNT(*) AS total_books
FROM books
GROUP BY genre;

SELECT b.title, m.name, l.due_date
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL AND l.due_date < CURRENT_DATE;

SELECT b.title, COUNT(*) AS borrow_count
FROM loans l
JOIN books b ON l.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 5;

SELECT * FROM librarians
WHERE hire_date < '2023-01-01';

SELECT 
    AVG(DATEDIFF(return_date, issue_date)) AS avg_loan_duration
FROM loans
WHERE return_date IS NOT NULL;




