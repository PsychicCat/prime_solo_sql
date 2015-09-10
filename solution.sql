//1. Which authors are represented in our store?
SELECT * FROM authors;

//2. Which authors are also distinguished authors?
SELECT * FROM authors 
JOIN distinguished_authors 
ON authors.id = distinguished_authors.id;

//3. Which authors are not distinguished authors?



4. How many authors are represented in our store?
5. Who are the favorite authors of the employee with the first name of Michael?
6. What are the titles of all the books that are in stock today?
7. Insert one of your favorite books into the database. Hint: You’ll want to create data into at least 2 other tables to completely create this book.
8. What authors have books that are not in stock?
9. What is the title of the book that has the most stock?