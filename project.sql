-- file by Jennifer and Robles 

-- 1. List titles of all books in ascending order.
select title from Books
ORDER By Title;



-- 2. Find the name of the author who wrote the book named "On The Road"
au_name from authors a, writes w
where a.au_id = w.au_id AND title = 'On The Road';

/* 3.   
    List the title and author of books whose price is greater than $20. 
    List your result in the ascending order of the price.
*/
select b.title, au_name, price 
  from books b, authors a, writes w
  where price > 20 AND a.au_id = w.au_id AND b.title = w.title
  order by price; 


  /* 4.
    Find those pairs of books that have the same price. 
    Each pair of book titles should only be displayed once.
  */

select a.title, b.title, a.price 
  from books a, books b
  where a.title < b.title AND a.price = b.price;


  -- 5. List the title and price of all books published by Penguin Books.
select title, price
from books b 
where pub_id IN ( select pub_id from publishers
                 where pub_name = 'Penguin Books');


-- 6. List all authors whose book was published by Wiley.
-- double check this please
select au_name 
from Authors
where  au_id IN (select au_id from writes
                 where title IN (select title 
                                from Books b, publishers p
                                where pub_name = 'Wiley' AND
                                b.pub_id = p.pub_id));


-- 7. Find Publishers which have published more than 3 books.
select pub_name 
from Publishers
where pub_id IN ( select pub_id from Books
    group by pub_id
    having count(pub_id) > 3);


