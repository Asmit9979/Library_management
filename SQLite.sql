CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    Genre VARCHAR(50),
    AvailableCopies INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Checkout (
    CheckoutID INT PRIMARY KEY,
    MemberID INT,
    ISBN VARCHAR(13),
    CheckoutDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);


-- Authors
INSERT INTO Authors (AuthorID, AuthorName) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Robert Johnson');

-- Books
INSERT INTO Books (ISBN, Title, AuthorID, Genre, AvailableCopies) VALUES
('102', 'Introduction to SQL', 1, 'Educational', 5),
('99', 'Database Design Basics', 2, 'Technical', 3),
('55', 'Fictional Adventure', 3, 'Fiction', 8);

-- Members
INSERT INTO Members (MemberID, MemberName, Email, PhoneNumber) VALUES
(101, 'Alice Adams', 'alice@email.com', '123-456-7890'),
(102, 'Bob Brown', 'bob@email.com', '987-654-3210');

SELECT * FROM Books;

SELECT * FROM Authors;

SELECT * FROM Members;

INSERT INTO Books (ISBN, Title, AuthorID, Genre, AvailableCopies) VALUES ('NEW_ISBN', 'New Book', 1, 'New Genre', 10);

DELETE FROM Books WHERE ISBN = '1234567890123';

INSERT INTO Authors (AuthorID, AuthorName) VALUES (4, 'New Author');

DELETE FROM Authors WHERE AuthorID = 3;

INSERT INTO Members (MemberID, MemberName, Email, PhoneNumber) VALUES (103, 'Charlie Clark', 'charlie@email.com', '555-123-4567');

DELETE FROM Members WHERE MemberID = 101;

SELECT Books.*, Checkout.CheckoutDate, Checkout.ReturnDate
FROM Books
JOIN Checkout ON Books.ISBN = Checkout.ISBN
WHERE Checkout.MemberID = 102;