-- 1. Which authors are represented in our store?
SELECT * FROM authors;

-- 2. Which authors are also distinguished authors?
SELECT authors.first_name, authors.last_name FROM authors 
JOIN distinguished_authors ON authors.id = distinguished_authors.id;

-- 3. Which authors are not distinguished authors?
SELECT authors.first_name, authors.last_name FROM authors 
LEFT JOIN distinguished_authors ON authors.id = distinguished_authors.id
WHERE distinguished_authors.id IS NULL;

-- 4. How many authors are represented in our store? 
SELECT COUNT(*) FROM authors;

-- 5. Who are the favorite authors of the employee with the first name of Michael?
SELECT authors_and_titles FROM favorite_authors
JOIN employees
ON employees.first_name = 'Michael';

-- 6. What are the titles of all the books that are in stock today?
SELECT books.title FROM books
JOIN editions ON editions.book_id = books.id
JOIN daily_inventory ON daily_inventory.isbn = editions.isbn
WHERE daily_inventory.is_stocked IS true;

-- 7. Insert one of your favorite books into the database. Hint: You’ll want to create data into at least 2 other tables to completely create this book.
INSERT INTO books (id, title, author_id, subject_id)
	VALUES (30000, 'Flow My Tears, The Policeman Said', 9999, 15)
INSERT INTO authors (id, last_name, first_name)
	VALUES (9999, 'Dick', 'Philip K.')
INSERT INTO stock (isbn, cost, retail, stock)
	VALUES ('9780575079953', 10.00, 15.00, 50);


-- 8. What authors have books that are not in stock?
SELECT authors.first_name, authors.last_name FROM authors
JOIN books ON books.author_id = authors.id
JOIN editions ON editions.book_id = books.id
JOIN daily_inventory ON daily_inventory.isbn = editions.isbn
WHERE daily_inventory.is_stocked IS false;


-- 9. What is the title of the book that has the most stock?

SELECT books.title FROM books
JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn
ORDER BY stock.stock DESC 
LIMIT 1;