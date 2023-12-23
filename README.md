# Design Database e-library
Project SQL Design Database E-Library

Project's objectives. (10 point)
Designing The Database: 
Describe the steps to create a relational database.
- MIssion Statement (5 point)
  
# Design ERD
![My image](/erd.png)

  
Implementing The Design. (10 point)
- Explain the process of implementing design or ERD  in a PostgreSQL database.
Populating the database. (20 point)
- Describe how to generate a dummy dataset 
- Describe how to input data into the database
Retrieve data (20 point)
# Explain the questions you have created and analyze the output

/*Questions and Analyze the output*/

-- 1. Menghitung Total Jumlah Buku di perpustakaan

select count(*) from books


-- 2. Menghitung Total Buku by Address Library

select b.address, count(a.*) as total_of_book 
from books as a 
join libraries as b 
on a.libraryid = b.libraryid
group by b.address
order by total_of_book desc

-- 3. Menghitung total users

select count(userid) from public.users ;

-- 4. Melihat buku yang paling banyak di pinjam 

select b.title, count(a.loandate)
from loans as a join books as b
on a.bookid = b.bookid
group by  b.title ;

-- 5. Berapa banyak buku yang di kembalikan
select count(*) from loans
where returndate is not null

