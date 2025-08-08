
-- Use the library database
USE librarydb;

-- 1. Count how many books each author has written
SELECT authorid, COUNT(*) AS total_books
FROM books
GROUP BY authorid;

-- 2. Count how many books each genre has
SELECT genre, COUNT(*) AS total_books
FROM books
GROUP BY genre;

-- 3. Count total borrowings per member
SELECT memberid, COUNT(*) AS total_borrowings
FROM borrowings
GROUP BY memberid;

-- 4. Find average borrowing period (in days) for each member
SELECT memberid, AVG(DATEDIFF(returndate, borrowdate)) AS avg_borrow_days
FROM borrowings
GROUP BY memberid;

-- 5. Find total borrowings per book and filter groups with more than 1 borrowing
SELECT bookid, COUNT(*) AS total_borrowings
FROM borrowings
GROUP BY bookid
HAVING COUNT(*) > 1;

-- 6. Find average borrow duration per book, only for books borrowed more than 5 days on average
SELECT bookid, AVG(DATEDIFF(returndate, borrowdate)) AS avg_days
FROM borrowings
GROUP BY bookid
HAVING AVG(DATEDIFF(returndate, borrowdate)) > 5;
