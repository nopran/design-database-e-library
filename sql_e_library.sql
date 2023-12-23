/* Membuat Tabel Libraries*/

CREATE TABLE libraries(
	LibraryID Serial Primary Key,
	LibraryName Varchar(255) Not Null,
	Address TEXT
);

/* Membuat Tabel Books*/

CREATE TABLE Books(
	BookID Serial Primary Key,
	Title Varchar(255) Not Null,
	Author Varchar(255) Not Null,
	Quantity INT CHECK(quantity >= 0),
	LibraryID INT REFERENCES libraries(LibraryID),
	Category Varchar(255)
);

/*Membuat Tabel users*/

CREATE TABLE Users (
	UserID SERIAL PRIMARY KEY,
	Username Varchar(255) NOT NULL,
	Email Varchar(255) Not Null
);

/*Membuat Tabel Loans*/

Create Table Loans (
	LoandID Serial Primary Key,
	UserID INT REFERENCES users(UserID),
	BookID INT REFERENCES Books(BookID),
	LoanDate DATE Not Null,
	DueDate Date Not Null,
	ReturnDate Date 
);



/*Membuat Tabel Holds*/

Create Table Holds(
	HoldID Serial Primary Key,
	UserID INT REFERENCES users(UserID),
	BookID INT REFERENCES Books(BookID),
	HoldDAte DATE Not Null
);


/*Import Data Set Libraries*/

Copy public.libraries(libraryid,libraryname,address)
from 'C:/elib/data_libraries.csv'
delimiter ';'
CSV HEADER;

select * from public.libraries ;



/*Import Data Set Books*/

Copy books(bookid,title,author,quantity,libraryid,category)
from 'C:/elib/Books.csv'
delimiter ';'
CSV HEADER;

select * from public.books ;

/*Import Data Set Users*/

Copy users(userid,username,email)
from 'C:/elib/users.csv'
delimiter ';'
CSV HEADER;

select * from public.users ;


/*Import Data Set Loans*/

Copy Loans(loandid,userid,bookid,loandate,duedate,returndate)
from 'C:/elib/loans.csv'
delimiter ';'
CSV HEADER;

select * from public.loans ;


/*Import Data Set Holds*/

Copy holds(holdid,userid,bookid,holddate)
from 'C:/elib/holds.csv'
delimiter ';'
CSV HEADER;

select * from public.holds ;


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








