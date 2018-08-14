\connect booktown;

--- Order
    SELECT subject FROM subjects ORDER BY subject;
    SELECT subject FROM subjects ORDER BY location;
    
--- Where
    SELECT * FROM books WHERE title = 'Little Women';
    SELECT * FROM books WHERE title LIKE 'Python';
    SELECT subject FROM subjects WHERE location LIKE 'Main St' ORDER BY subject;

--- JOIN
    SELECT title FROM books JOIN subjects ON books.subject_id = subjects.id WHERE subjects.subject = 'Computers';
    SELECT title, authors.first_name, authors.last_name, subjects.subject FROM books INNER JOIN authors ON books.author_id = authors.id INNER JOIN subjects ON books.subject_id = subjects.id;
    SELECT title, stock.retail FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock ON editions.isbn = stock.isbn ORDER BY stock.retail DESC;
    SELECT title, stock.isbn, stock.retail, publishers.name FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock ON editions.isbn = stock.isbn INNER JOIN publishers ON editions.publisher_id = publishers.id WHERE title='Dune';
    SELECT first_name, last_name, shipments.ship_date, books.title FROM customers INNER JOIN shipments ON customers.id = shipments.customer_id INNER JOIN editions ON editions.isbn = shipments.isbn INNER JOIN books ON books.id = editions.book_id ORDER BY shipments.ship_date DESC;

--- COUNT and ORDER
    SELECT COUNT(*) FROM books;
    SELECT COUNT(location) FROM subjects;
    SELECT COUNT(location), location FROM subjects GROUP BY location;
    SELECT book_id, books.title, COUNT(book_id) FROM editions INNER JOIN books ON books.id = editions.book_id GROUP BY book_id, books.title;
