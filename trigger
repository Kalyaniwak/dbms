ASSIGNMENT NO:8
PROBLEM STATEMENT:Database Trigger (All Types: Row level and Statement level triggers, Before and After Triggers). Write a database trigger on Library table. The System should keep track of the records that are being updated or deleted. The old value of updated or deleted records should be added in Library_Audit table.
gescoe@gescoe-OptiPlex-3010:~$ mysql -h 192.168.2.232 -u TEB41 -p Enter password:
MySQL [(none)]> use TEB_41;

Database changed
MySQL [TEB_41]> create table lib_Audit(bid int,bname varchar(20),qty int);
Query OK, 0 rows affected (0.482 sec)
MySQL [TEB_41]> create table lib_book(bid int,bname varchar(20),qty int);
Query OK, 0 rows affected (0.357 sec)
MySQL[TEB_41]>insert	into	lib_book values(1,'DBMS',25),(2,'CNS',47),(3,'TOC',10),(4,'SPOS',30);
Query OK, 4 rows affected (0.079 sec)
Records: 4 Duplicates: 0 Warnings: 0
MySQL [TEB_41]> select * from lib_book;
+------+-------+------+
| bid | bname | qty |
+------+-------+------+
|	1 | DBMS |	25 |
|	2 | CNS	|	47 | |	3 | TOC	|	10 |
|	4 | SPOS |	30 |
+------+-------+------+
4 rows in set (0.001 sec)
MySQL [TEB_41]> select * from lib_Audit;
Empty set (0.001 sec)
MySQL [TEB_41]> drop trigger if exists Make_audit1;
Query OK, 0 rows affected, 1 warning (0.000 sec)
MySQL [TEB_41]> delimiter;
ERROR: DELIMITER must be followed by a 'delimiter' character or string
MySQL [TEB_41]> delimiter //
MySQL [TEB_41]> create trigger Make_audit1
	->	after delete on lib_book
	->	for each row
-> begin
	->	insert into lib_Audit(bid,bname,qty)
	->	values (old.bid,old.bname,old.qty);
-> end;
-> //
Query OK, 0 rows affected (0.126 sec)
MySQL [TEB_41]> delimiter ;
MySQL [TEB_41]> delete from lib_book where bid=2;
Query OK, 1 row affected (0.043 sec)
MySQL [TEB_41]> select * from lib_book;
+------+-------+------+
| bid | bname | qty |
+------+-------+------+
|	1 | DBMS |	25 |
|	3 | TOC	|	10 |
|	4 | SPOS |	30 |
+------+-------+------+
3 rows in set (0.001 sec)
MySQL [TEB_41]> select * from lib_Audit;
+------+-------+------+
| bid | bname | qty |
+------+-------+------+
|	2 | CNS	|	47 |
+------+-------+------+
1 row in set (0.001 sec)
MySQL [TEB_41]> drop trigger if exists Make_audit2;
Query OK, 0 rows affected (0.040 sec)
MySQL [TEB_41]>
MySQL [TEB_41]> delimiter //
MySQL [TEB_41]>
MySQL [TEB_41]> CREATE TRIGGER Make_audit2
	->	AFTER UPDATE ON lib_book
	->	FOR EACH ROW
-> BEGIN
	->	INSERT INTO lib_Audit (bid, bname, qty)
	->	VALUES (OLD.bid, OLD.bname,OLD.qty);
-> END;
-> //
Query OK, 0 rows affected (0.073 sec)
MySQL [TEB_41]>
MySQL [TEB_41]> delimiter ;
MySQL [TEB_41]> update lib_book set bname='Gate' where bid=3;
Query OK, 1 row affected (0.057 sec)
Rows matched: 1 Changed: 1 Warnings: 0
MySQL [TEB_41]> select * from lib_book;
+------+-------+------+
| bid | bname | qty |
+------+-------+------+
|	1 | DBMS |	25 |
|	3 | Gate |	10 |
|	4 | SPOS |	30 |
+------+-------+------+
3 rows in set (0.001 sec)
MySQL [TEB_41]> select * from lib_Audit;
+------+-------+------+
| bid | bname | qty |
+------+-------+------+
|	2 | CNS	|	47 |
|	3 | TOC	|	10 |
+------+-------+------+
2 rows in set (0.001 sec)
 

Assignment no : 08
Title : Database Trigger (All Types: Row level and Statement level triggers, Before and After Triggers).
Write
a database trigger on Library table. The System should keep track of
the records that are being updated or deleted. The old value of updated
or deleted records should be added in Library_Audit table.

PL SQL Code : 
drop trigger if exists Make_audit1;

delimiter //

CREATE TRIGGER Make_audit1
  AFTER DELETE ON lib_book
  FOR EACH ROW
BEGIN
  INSERT INTO lib_Audit (bid, bname, qty)
  VALUES (OLD.bid, OLD.bname,OLD.qty);
END;
//

delimiter ;


-------------------------------------------------------------------------------------------------------------------------------------------------

drop trigger if exists Make_audit2;

delimiter //

CREATE TRIGGER Make_audit2
  AFTER UPDATE ON lib_book
  FOR EACH ROW
BEGIN
  INSERT INTO lib_Audit (bid, bname, qty)
  VALUES (OLD.bid, OLD.bname,OLD.qty);
END;
//

delimiter ;
