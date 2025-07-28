CREATE TABLE authors (
    author_id bigserial,
    first_name varchar(50),
	last_name varchar(50),
    CONSTRAINT author_key PRIMARY KEY (author_id),
    CONSTRAINT first_last_unique UNIQUE (first_name, last_name)
);

CREATE TABLE books (
  book_id bigserial,
  book_name varchar(50),
  pages NUMERIC,
  author_id INTEGER REFERENCES authors(author_id),
  CONSTRAINT book_key PRIMARY KEY (book_id),
  CONSTRAINT author_book_unique UNIQUE (book_id, author_id)
  
);

INSERT INTO authors (first_name,last_name)
VALUES
	('Lindo','Yende'),
	('Jenny', 'Han'),
	('Lilly','Bloom'),
	('Isabel', 'Conklin'),
	('Taylor','Beck');

INSERT INTO books (book_name,pages, author_id)
VALUES
	('Code',150,1),
	('The summer I turned Pretty', 330,4),
	('It ends with us',650, 5 ),
	('Me before you', 412, 3),
	('We will always have summer', 240, 2);

SELECT * 
FROM books JOIN authors
ON authors.author_id = books.author_id;