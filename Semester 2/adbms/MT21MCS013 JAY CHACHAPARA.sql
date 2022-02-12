MT21MCS013 JAY CHACHAPARA
ADBMS VIVA


mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| blackbook          |
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> create database adbmsviva;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| adbmsviva          |
| blackbook          |
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> use adbmsviva
Database changed

mysql> create table sector_name(sid varchar(5),name varchar(50),PRIMARY KEY(sid));
Query OK, 0 rows affected (0.02 sec)

mysql> describe sector_name
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into sector_name values("s1","defence"),
    -> ("s2","commerce and industry"),
    -> ("s3","labour and employeement"),
    -> ("s4","health and nutrition"),
    -> ("s5","education"),
    -> ("s6","transport"),
    -> ("s7","infrastructure and real estate"),
    -> ("s8","science and technology"),
    -> ("s9","agriculture and alied");
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> select * from sector_name;
+-----+--------------------------------+
| sid | name                           |
+-----+--------------------------------+
| s1  | defence                        |
| s2  | commerce and industry          |
| s3  | labour and employeement        |
| s4  | health and nutrition           |
| s5  | education                      |
| s6  | transport                      |
| s7  | infrastructure and real estate |
| s8  | science and technology         |
| s9  | agriculture and alied          |
+-----+--------------------------------+
9 rows in set (0.00 sec)

mysql> create table budget(bid varchar(5),year date,value double,PRIMARY KEY(bid,year));
Query OK, 0 rows affected (0.02 sec)

mysql> describe budget;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| bid   | varchar(5) | NO   | PRI | NULL    |       |
| year  | date       | NO   | PRI | NULL    |       |
| value | double     | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table budget modify year int;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into budget values("b1",2010,3000000000000);
Query OK, 1 row affected (0.00 sec)

mysql> select * from budget;
+-----+------+---------------+
| bid | year | value         |
+-----+------+---------------+
| b1  | 2010 | 3000000000000 |
+-----+------+---------------+
1 row in set (0.00 sec)

mysql> insert into budget values("b2",2011,4000000000000),
    -> ("b3",2012,3000000000000),
    -> ("b4",2013,6000000000000),
    -> ("b5",2014,2000000000000),
    -> ("b6",2015,5000000000000);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> create table finance_minister(fid varchar(3),name varchar(20),edu varchar(20),year int,PRIMARY KEY(fid));
Query OK, 0 rows affected (0.02 sec)

mysql> describe finance_minister
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| fid   | varchar(3)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| edu   | varchar(20) | YES  |     | NULL    |       |
| year  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


mysql> insert into finance_minister values("f1","A","graduate",2010), ("f2","B","post graduate",2011), ("f3","C","higher secondary",2012), ("f4","D","post graduate",2013);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from finance_minister;
+-----+------+------------------+------+
| fid | name | edu              | year |
+-----+------+------------------+------+
| f1  | A    | graduate         | 2010 |
| f2  | B    | post graduate    | 2011 |
| f3  | C    | higher secondary | 2012 |
| f4  | D    | post graduate    | 2013 |
+-----+------+------------------+------+
4 rows in set (0.00 sec)


mysql> insert into finance_minister values("f5","E","graduate",2014), ("f6","D","post graduate",2015);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from finance_minister;
+-----+------+------------------+------+
| fid | name | edu              | year |
+-----+------+------------------+------+
| f1  | A    | graduate         | 2010 |
| f2  | B    | post graduate    | 2011 |
| f3  | C    | higher secondary | 2012 |
| f4  | D    | post graduate    | 2013 |
| f5  | E    | graduate         | 2014 |
| f6  | D    | post graduate    | 2015 |
+-----+------+------------------+------+
6 rows in set (0.00 sec)

mysql> create table sector_year(id varchar(5),year int,value double,FOREIGN KEY(id) REFERENCES sector_name(sid));
Query OK, 0 rows affected (0.03 sec)

mysql> describe sector_year;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| id    | varchar(5) | YES  | MUL | NULL    |       |
| year  | int        | YES  |     | NULL    |       |
| value | double     | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into sector_year values("s1",2010,200000000000),
    -> ("s2",2010,300000000000),
    -> ("s3",2010,500000000000),
    -> ("s4",2010,3000000000000);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into sector_year values("s2",2011,800000000000), ("s3",2011,700000000000), ("s5",2011,600000000000), ("s6",2011,7000000000000);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into sector_year values("s1",2012,300000000000), ("s2",2012,200000000000), ("s3",2012,400000000000), ("s8",2012,600000000000);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into sector_year values("s9",2013,600000000000), ("s8",2013,800000000000), ("s7",2013,700000000000);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into sector_year values("s7",2014,900000000000), ("s6",2014,100000000000), ("s4",2014,300000000000);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into sector_year values("s1",2015,500000000000), ("s3",2015,600000000000), ("s8",2015,700000000000);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from sector_year;
+------+------+---------------+
| id   | year | value         |
+------+------+---------------+
| s1   | 2010 |  200000000000 |
| s2   | 2010 |  300000000000 |
| s3   | 2010 |  500000000000 |
| s4   | 2010 | 3000000000000 |
| s2   | 2011 |  800000000000 |
| s3   | 2011 |  700000000000 |
| s5   | 2011 |  600000000000 |
| s6   | 2011 | 7000000000000 |
| s1   | 2012 |  300000000000 |
| s2   | 2012 |  200000000000 |
| s3   | 2012 |  400000000000 |
| s8   | 2012 |  600000000000 |
| s9   | 2013 |  600000000000 |
| s8   | 2013 |  800000000000 |
| s7   | 2013 |  700000000000 |
| s7   | 2014 |  900000000000 |
| s6   | 2014 |  100000000000 |
| s4   | 2014 |  300000000000 |
| s1   | 2015 |  500000000000 |
| s3   | 2015 |  600000000000 |
| s8   | 2015 |  700000000000 |
+------+------+---------------+
21 rows in set (0.00 sec)

mysql> select sn.name from sector_name sn, sector_year sy where sn.sid in (select MIN(value) from sector_year);
Empty set (0.00 sec)

mysql> select MIN(value) from sector_year;
+--------------+
| MIN(value)   |
+--------------+
| 100000000000 |
+--------------+
1 row in set (0.00 sec)

mysql> select * from sector_year where value = (select MIN(value) from sector_year);
+------+------+--------------+
| id   | year | value        |
+------+------+--------------+
| s6   | 2014 | 100000000000 |
+------+------+--------------+
1 row in set (0.00 sec)

mysql> select id from sector_year where value = (select MIN(value) from sector_year);
+------+
| id   |
+------+
| s6   |
+------+
1 row in set (0.00 sec)


"""
FOLLOWING IS THE QUERY OF Q1 - B
"""


mysql> select sn.name from sector_name as sn where sid = (select id from sector_year where value = (select MIN(value) from sector_year));
+-----------+
| name      |
+-----------+
| transport |
+-----------+
1 row in set (0.00 sec)

"""
FOLLOWING IS THE QUERY FOR THE Q1 - C
"""

mysql> select * from sector_year where id = (select sid from sector_name where name = "defence");
+------+------+--------------+
| id   | year | value        |
+------+------+--------------+
| s1   | 2010 | 200000000000 |
| s1   | 2012 | 300000000000 |
| s1   | 2015 | 500000000000 |
+------+------+--------------+
3 rows in set (0.00 sec)

mysql> insert into sector_year values("s9",2015,700000000000)
    -> ;
Query OK, 1 row affected (0.01 sec)

mysql> insert into finance_minister values("f7","Dr. Manmohan Singh","doctoral",2016);
Query OK, 1 row affected (0.00 sec)

"""
FOLLOWING IS THE QUERY FOR THE Q1 - D
"""

mysql> select * from finance_minister where edu = "doctoral";
+-----+--------------------+----------+------+
| fid | name               | edu      | year |
+-----+--------------------+----------+------+
| f7  | Dr. Manmohan Singh | doctoral | 2016 |
+-----+--------------------+----------+------+
1 row in set (0.00 sec)

mysql> select name from finance_minister where edu = "doctoral";
+--------------------+
| name               |
+--------------------+
| Dr. Manmohan Singh |
+--------------------+
1 row in set (0.00 sec)

mysql> update finance_minister set name = "Dr. Manmohan Singh" where name = "D";
Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from finance_minister;
+-----+--------------------+------------------+------+
| fid | name               | edu              | year |
+-----+--------------------+------------------+------+
| f1  | A                  | graduate         | 2010 |
| f2  | B                  | post graduate    | 2011 |
| f3  | C                  | higher secondary | 2012 |
| f4  | Dr. Manmohan Singh | post graduate    | 2013 |
| f5  | E                  | graduate         | 2014 |
| f6  | Dr. Manmohan Singh | post graduate    | 2015 |
| f7  | Dr. Manmohan Singh | doctoral         | 2016 |
+-----+--------------------+------------------+------+
7 rows in set (0.00 sec)

mysql> update finance_minister set edu = "doctoral" where name = "Dr. Manmohan Singh";
Query OK, 2 rows affected (0.01 sec)
Rows matched: 3  Changed: 2  Warnings: 0

mysql> select * from finance_minister;
+-----+--------------------+------------------+------+
| fid | name               | edu              | year |
+-----+--------------------+------------------+------+
| f1  | A                  | graduate         | 2010 |
| f2  | B                  | post graduate    | 2011 |
| f3  | C                  | higher secondary | 2012 |
| f4  | Dr. Manmohan Singh | doctoral         | 2013 |
| f5  | E                  | graduate         | 2014 |
| f6  | Dr. Manmohan Singh | doctoral         | 2015 |
| f7  | Dr. Manmohan Singh | doctoral         | 2016 |
+-----+--------------------+------------------+------+
7 rows in set (0.00 sec)

mysql> select id,MAX(value) from sector_year group by id;
+------+---------------+
| id   | MAX(value)    |
+------+---------------+
| s1   |  500000000000 |
| s2   |  800000000000 |
| s3   |  700000000000 |
| s4   | 3000000000000 |
| s5   |  600000000000 |
| s6   | 7000000000000 |
| s7   |  900000000000 |
| s8   |  800000000000 |
| s9   |  700000000000 |
+------+---------------+
9 rows in set (0.00 sec)

mysql> select * MAX(value) from sector_year group by id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'MAX(value) from sector_year group by id' at line 1

mysql> select *,MAX(value) from sector_year group by id;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'adbmsviva.sector_year.year' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

mysql> select id,year,MAX(value) from sector_year group by id;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'adbmsviva.sector_year.year' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

mysql> select * from sector_year where year = (select year from finance_minister where name = "Dr. Manmohan Singh") and id = (select sid from sector_name where name = "agriculture and alied");
ERROR 1242 (21000): Subquery returns more than 1 row

mysql> select * from sector_year where year in (select year from finance_minister where name = "Dr. Manmohan Singh") and id = (select sid from sector_name where name = "agriculture and alied");
+------+------+--------------+
| id   | year | value        |
+------+------+--------------+
| s9   | 2013 | 600000000000 |
| s9   | 2015 | 700000000000 |
+------+------+--------------+
2 rows in set (0.00 sec)

mysql> select year from sector_year where value = MAX();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1

mysql> select year from sector_year where value = MAX()
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1

mysql> select year from sector_year where value = MAX(
    -> select value  from sector_year where year in (
    -> select year from finance_minister where name = "Dr. Manmohan Singh")
    -> and
    -> id = (select sid from sector_name where name = "agriculture and alied"));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select value  from sector_year where year in (
select year from finance_minister' at line 2

mysql> select year from sector_year where value = MAX( select value  from sector_year where year in ( select year from finance_minister where name = "Dr. Manmohan Singh") and id = (select sid from sector_name where name = "agriculture and alied"));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select value  from sector_year where year in ( select year from finance_minister' at line 1

mysql> select year from sector_year where value = MAX(select value  from sector_year where year in (select year from finance_minister where name = "Dr. Manmohan Singh") and id = (select sid from sector_name where name = "agriculture and alied"));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select value  from sector_year where year in (select year from finance_minister ' at line 1

mysql> select * from sector_year where year in (select year from finance_minister where name = "Dr. Manmohan Singh") and id = (select sid from sector_name where name = "agriculture and alied");
+------+------+--------------+
| id   | year | value        |
+------+------+--------------+
| s9   | 2013 | 600000000000 |
| s9   | 2015 | 700000000000 |
+------+------+--------------+
2 rows in set (0.00 sec)

mysql> insert into tab1 select * from sector_year where year in (select year from finance_minister where name = "Dr. Manmohan Singh") and id = (select
 sid from sector_name where name = "agriculture and alied");
ERROR 1146 (42S02): Table 'adbmsviva.tab1' doesnt exist

mysql> create table Client_Master(Client_no int,Name varchar(20),Address1 varchar(50),Address2 varchar(50),Pincode int,State varchar(15),Bal_Due double);
Query OK, 0 rows affected (0.02 sec)

mysql> create table Product_Master(Product_No int,Description varchar(50),Profit)
mysql> describe finance_minister;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| fid   | varchar(3)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| edu   | varchar(20) | YES  |     | NULL    |       |
| year  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe budget;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| bid   | varchar(5) | NO   | PRI | NULL    |       |
| year  | int        | NO   | PRI | NULL    |       |
| value | double     | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> describe sector_name;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> describe sector_year;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| id    | varchar(5) | YES  | MUL | NULL    |       |
| year  | int        | YES  |     | NULL    |       |
| value | double     | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from finance_minister;
+-----+--------------------+------------------+------+
| fid | name               | edu              | year |
+-----+--------------------+------------------+------+
| f1  | A                  | graduate         | 2010 |
| f2  | B                  | post graduate    | 2011 |
| f3  | C                  | higher secondary | 2012 |
| f4  | Dr. Manmohan Singh | doctoral         | 2013 |
| f5  | E                  | graduate         | 2014 |
| f6  | Dr. Manmohan Singh | doctoral         | 2015 |
| f7  | Dr. Manmohan Singh | doctoral         | 2016 |
+-----+--------------------+------------------+------+
7 rows in set (0.00 sec)

mysql> select * from sector_name;
+-----+--------------------------------+
| sid | name                           |
+-----+--------------------------------+
| s1  | defence                        |
| s2  | commerce and industry          |
| s3  | labour and employeement        |
| s4  | health and nutrition           |
| s5  | education                      |
| s6  | transport                      |
| s7  | infrastructure and real estate |
| s8  | science and technology         |
| s9  | agriculture and alied          |
+-----+--------------------------------+
9 rows in set (0.00 sec)

mysql> select * from sector_year;
+------+------+---------------+
| id   | year | value         |
+------+------+---------------+
| s1   | 2010 |  200000000000 |
| s2   | 2010 |  300000000000 |
| s3   | 2010 |  500000000000 |
| s4   | 2010 | 3000000000000 |
| s2   | 2011 |  800000000000 |
| s3   | 2011 |  700000000000 |
| s5   | 2011 |  600000000000 |
| s6   | 2011 | 7000000000000 |
| s1   | 2012 |  300000000000 |
| s2   | 2012 |  200000000000 |
| s3   | 2012 |  400000000000 |
| s8   | 2012 |  600000000000 |
| s9   | 2013 |  600000000000 |
| s8   | 2013 |  800000000000 |
| s7   | 2013 |  700000000000 |
| s7   | 2014 |  900000000000 |
| s6   | 2014 |  100000000000 |
| s4   | 2014 |  300000000000 |
| s1   | 2015 |  500000000000 |
| s3   | 2015 |  600000000000 |
| s8   | 2015 |  700000000000 |
| s9   | 2015 |  700000000000 |
+------+------+---------------+
22 rows in set (0.00 sec)

mysql> select * from budget;
+-----+------+---------------+
| bid | year | value         |
+-----+------+---------------+
| b1  | 2010 | 3000000000000 |
| b2  | 2011 | 4000000000000 |
| b3  | 2012 | 3000000000000 |
| b4  | 2013 | 6000000000000 |
| b5  | 2014 | 2000000000000 |
| b6  | 2015 | 5000000000000 |
+-----+------+---------------+
6 rows in set (0.00 sec)

mysql> select * from sector_year where sid = (select;)
mysql> select * from sector_year where sid = (select sid form sector_name where name = "defence");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sector_name where name = "defence")' at line 1
mysql> select * from sector_year where sid = (select sid form sector_name where name = "defence");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sector_name where name = "defence")' at line 1
mysql> selec