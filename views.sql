
-- 1. View: All borrowed books with member and author details
CREATE VIEW vw_borrowed_books AS
SELECT m.Name AS Member_Name,
       b.Title AS Book_Title,
       a.Name AS Author_Name,
       br.BorrowDate,
       br.ReturnDate
FROM Borrowing br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
JOIN Authors a ON b.AuthorID = a.AuthorID;

-- Using the view
SELECT * FROM vw_borrowed_books;

-- 2. View: Members who haven't borrowed any book
CREATE VIEW vw_members_no_borrow AS
SELECT m.MemberID, m.Name
FROM Members m
LEFT JOIN Borrowing br ON m.MemberID = br.MemberID
WHERE br.BorrowID IS NULL;

-- Using the view
SELECT * FROM vw_members_no_borrow;

-- 3. View: Genre-wise total books
CREATE VIEW vw_genre_book_count AS
SELECT Genre, COUNT(*) AS Total_Books
FROM Books
GROUP BY Genre;

-- Using the view
SELECT * FROM vw_genre_book_count;

-- 4. View with WHERE clause
CREATE VIEW vw_recent_books AS
SELECT * FROM Books
WHERE PublishedYear >= 2020;

-- Using the view
SELECT * FROM vw_recent_books;

-- 5. Dropping a view
 DROP VIEW vw_recent_books;
