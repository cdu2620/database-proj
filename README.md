# database-proj
CMU 67262 Fall 19 database project

Make sure to have Postgres installed.

To run the SQL files, go to terminal, CD to the folder these files are in, and write:  

psql -d postgres -U isdb -f initialize.sql

To show all the table contents, run: 

psql -d postgres -U isdb -f show_all.sql

To run a Python file, write:

python *insert_py_name*.py
