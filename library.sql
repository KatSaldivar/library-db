
USE db_library

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
	);

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Penguin', '123 Main St Portland, OR 97030', '111-111-1111');

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL,
	);

INSERT INTO tbl_library_branch
	(branch_name, branch_address)
	VALUES
	('East', '123 Main St Cedar Rapids, Iowa 52402'),
	('West', '123 Main St Iowa City, Iowa 52402'),
	('Central', '123 Main St Des Moines, Iowa 52402'),
	('Sharpstown', '123 Main St Des Moines, Iowa 52402');

CREATE TABLE tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
	);

INSERT INTO tbl_book
	(title, publisher_name)
	VALUES
	('The Lost Tribe', 'Penguin'),
	('blue book', 'Penguin'),
	('red book', 'Penguin'),
	('orange book', 'Penguin'),
	('yellow book', 'Penguin'),
	('green book', 'Penguin'),
	('blue book', 'Penguin'),
	('purple book', 'Penguin'),
	('The Found Tribe', 'Penguin'),
	('one book', 'Penguin'),
	('two book', 'Penguin'),
	('three book', 'Penguin'),
	('four book', 'Penguin'),
	('five book', 'Penguin'),
	('six book', 'Penguin'),
	('seven book', 'Penguin'),
	('eight book', 'Penguin'),
	('nine book', 'Penguin'),
	('ten book', 'Penguin'),
	('eleven book', 'Penguin');

CREATE TABLE tbl_borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL,
	);

INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Mickey Mouse', '123 Main St Cedar Rapids, Iowa 52402', '111-111-1111'),
	('Elvis Presley', '123 Main St Iowa City, Iowa 52402', '111-111-1111'),
	('Beyonce', '123 Main St Marion, Iowa 52402', '111-111-1111'),
	('George Washington', '123 Main St Anamosa, Iowa 52402', '111-111-1111'),
	('Minnie Mouse', '123 Main St Cedar Jefferson, Iowa 52402', '111-111-1111'),
	('Michael Jordon', '123 Main St Iowa City, Debuque 52402', '111-111-1111'),
	('Michael Jackson', '123 Main St Moline, Illinois 52402', '111-111-1111'),
	('Lucile Ball', '123 Main St Palo, Iowa 52402', '111-111-1111')

CREATE TABLE tbl_book_loans (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_book(book_id),
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no),
	date_out VARCHAR(50) NOT NULL,
	due_date VARCHAR(50) NOT NULL
	);

INSERT INTO tbl_book_loans
	(book_id, branch_id, card_no, date_out, due_date)
	VALUES
	(1, 3, 3, '3-3-17', '4-3-17'),
	(2, 3, 3, '3-3-17', '4-3-17'),
	(3, 3, 3, '3-3-17', '4-3-17'),
	(4, 3, 3, '3-3-17', '4-3-17'),
	(5, 3, 3, '3-3-17', '4-3-17'),
	(6, 3, 3, '3-3-17', '4-3-17'),
	(7, 3, 3, '3-3-17', '4-3-17'),
	(8, 3, 3, '3-3-17', '4-3-17'),
	(9, 3, 3, '3-3-17', '4-3-17'),
	(10, 3, 3, '3-3-17', '4-3-17'),
	(1, 3, 3, '4-3-17', '5-3-17'),
	(1, 2, 4, '6-3-17', '7-3-17'),
	(1, 2, 4, '3-3-17', '4-3-17'),
	(1, 2, 4, '3-5-17', '4-3-17'),
	(1, 2, 4, '3-6-17', '4-3-17'),
	(1, 2, 4, '3-7-17', '4-3-17'),
	(1, 2, 4, '3-8-17', '4-3-17'),
	(1, 2, 4, '3-9-17', '4-3-17'),
	(1, 1, 4, '3-1-17', '4-3-17'),
	(1, 1, 4, '3-13-17', '4-3-17'),
	(1, 1, 5, '3-11-17', '4-3-17'),
	(1, 1, 6, '3-12-17', '4-3-17'),
	(1, 1, 7, '3-13-17', '4-3-17'),
	(1, 1, 8, '3-15-17', '4-3-17'),
	(1, 1, 7, '3-16-17', '4-3-17'),
	(1, 1, 6, '3-17-17', '4-3-17'),
	(1, 4, 5, '3-17-17', '4-3-17'),
	(1, 4, 4, '3-3-17', '4-3-17'),
	(1, 4, 3, '3-3-17', '3-3-17'),
	(1, 4, 2, '3-3-17', '4-3-17'),
	(1, 4, 1, '3-3-17', '3-3-17'),
	(1, 4, 1, '3-3-17', '3-3-17'),
	(1, 4, 2, '3-3-17', '3-3-17'),
	(1, 4, 1, '3-3-17', '5-3-17'),
	(1, 4, 5, '3-3-17', '5-3-17'),
	(1, 4, 6, '3-3-17', '5-3-17'),
	(1, 4, 7, '3-3-17', '5-3-17'),
	(1, 1, 8, '3-3-17', '5-3-17'),
	(1, 1, 8, '3-3-17', '5-3-17'),
	(1, 1, 7, '3-3-17', '5-3-17'),
	(1, 2, 6, '3-3-17', '5-3-17'),
	(1, 2, 5, '3-3-17', '8-3-17'),
	(1, 2, 4, '3-3-17', '8-3-17'),
	(1, 2, 3, '3-3-17', '7-3-17'),
	(1, 2, 2, '3-3-17', '7-3-17'),
	(1, 2, 1, '3-3-17', '7-3-17'),
	(1, 2, 1, '3-3-17', '7-3-17'),
	(1, 2, 1, '3-3-17', '7-3-17'),
	(1, 2, 2, '3-3-17', '6-3-17'),
	(1, 1, 4, '3-3-17', '5-3-17');

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_copies_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id_copies FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	no_of_copies INT NOT NULL
	);

INSERT INTO tbl_book_copies
	(book_id, branch_id, no_of_copies)
	VALUES
	(1, 2, 1001),
	(2, 3, 1001),
	(3, 4, 1001),
	(4, 2, 1002),
	(5, 1, 1004);

CREATE TABLE tbl_book_authors (
	author_book_id INT NOT NULL CONSTRAINT fk_author_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
	);

INSERT INTO tbl_book_authors
	(author_book_id, author_name)
	VALUES
	(1, 'Poison Ivy'),
	(2, 'Bat Man'),
	(3, 'Wonder Woman'),
	(4, 'Harry Potter'),
	(5, 'Frodo Baggins'),
	(6, 'Daffy Duck'),
	(7, 'Betty Boop'),
	(8, 'James Bond'),
	(9, 'J.R. Tolkein'),
	(10, 'Stephen King'),
	(11, 'Billy Bob');

SELECT  * FROM tbl_book;
SELECT  * FROM tbl_book_authors;
SELECT  * FROM tbl_book_authors;
SELECT  * FROM  tbl_book_loans;
SELECT  * FROM tbl_borrower;
SELECT  * FROM tbl_library_branch;
SELECT  * FROM tbl_publisher;

USE db_library
GO

CREATE PROCEDURE dbo.usp1LostTribeSharptston
AS
BEGIN
/*How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/
SELECT
	no_of_copies
	FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_ID = tbl_book_copies.branch_ID
	INNER JOIN tbl_book ON tbl_book.book_ID = tbl_book_copies.book_ID
	WHERE tbl_book.title = 'The Lost Tribe'
	AND tbl_library_branch.branch_name = 'Sharpstown';
END
GO

CREATE PROCEDURE dbo.usp2LostTribeAll
AS
BEGIN
/*How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/
SELECT
	tbl_book_copies.no_of_copies, tbl_library_branch.branch_name
	FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_ID = tbl_book_copies.branch_ID
	INNER JOIN tbl_book ON tbl_book.book_ID = tbl_book_copies.book_ID
	WHERE tbl_book.title = 'The Lost Tribe';
END
GO

CREATE PROCEDURE dbo.usp3BorrowersWithoutBooks
AS
BEGIN
/*Retrieve the names of all borrowers who do not have any books checked out.*/
SELECT
	tbl_borrower.borrower_name
	FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.card_no = tbl_borrower.card_no
	WHERE tbl_borrower.card_no IS NULL;
END
GO

CREATE PROCEDURE dbo.usp4DueTodaySharpstown
AS
BEGIN
/*For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.*/
SELECT
	tbl_book.title, tbl_borrower.borrower_name, tbl_borrower.borrower_address
	FROM tbl_book_loans
	INNER JOIN tbl_borrower ON tbl_borrower.card_no = tbl_book_loans.card_no
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_loans.book_id
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_loans.branch_id
	WHERE tbl_book_loans.due_date = '8-17-17'
	AND tbl_library_branch.branch_name = 'Sharpstown';
END
GO

CREATE PROCEDURE dbo.usp5LoansPerBranch
AS
BEGIN
/*For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/
SELECT
	tbl_library_branch.branch_name, COUNT(tbl_book_loans.branch_id) AS total_book_loans
	FROM tbl_library_branch
	INNER JOIN tbl_book_loans ON tbl_book_loans.branch_id = tbl_library_branch.branch_id
	GROUP BY tbl_library_branch.branch_name;
END
GO

CREATE PROCEDURE dbo.usp6OverFiveLoans
AS
BEGIN
/*Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.*/
SELECT
	tbl_borrower.borrower_name, tbl_borrower.borrower_address, COUNT(tbl_book_loans.card_no) AS total_books_loaned
	FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.card_no = tbl_borrower.card_no
	GROUP BY tbl_borrower.borrower_name, tbl_borrower.borrower_address
	HAVING COUNT(tbl_book_loans.card_no) >= 5;
END
GO

CREATE PROCEDURE dbo.usp7StephenKingAtCentral
AS
BEGIN
/*For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/
SELECT
	tbl_book.title, COUNT(tbl_book_copies.branch_ID) AS total_copies
	FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_ID = tbl_book_copies.branch_ID
	INNER JOIN tbl_book ON tbl_book.book_ID = tbl_book_copies.book_ID
	INNER JOIN tbl_book_authors ON tbl_book_authors.author_book_ID = tbl_book.book_ID
	GROUP BY tbl_book.title, tbl_library_branch.branch_name, tbl_book_authors.author_name
	HAVING tbl_library_branch.branch_name= 'central'
	AND tbl_book_authors.author_name= 'Stephen King';
END
GO

CREATE PROCEDURE dbo.usp8BooksStephenKingAtCentral
AS
BEGIN
/* Same as above, but lists all the books and the count of each that matches the criteria*/
SELECT
	tbl_book.title,
		(SELECT COUNT(tbl_book_copies.branch_ID)
		FROM tbl_book_copies
		INNER JOIN tbl_library_branch ON tbl_library_branch.branch_ID = tbl_book_copies.branch_ID
		INNER JOIN tbl_book ON tbl_book.book_ID = tbl_book_copies.book_ID
		INNER JOIN tbl_book_authors ON tbl_book_authors.author_book_ID = tbl_book.book_ID
		WHERE tbl_library_branch.branch_name= 'central'
		AND tbl_book_authors.author_name= 'Stephen King'
		) AS total_copies
	FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_ID = tbl_book_copies.branch_ID
	INNER JOIN tbl_book ON tbl_book.book_ID = tbl_book_copies.book_ID
	INNER JOIN tbl_book_authors ON tbl_book_authors.author_book_ID = tbl_book.book_ID
	GROUP BY tbl_book.title;
END
GO
