# PythonPostgresLab
A CLI (Command Line Interface) written in python to query a PostgreSQL database. Lab realized as a student at Ecole Centrale de Nantes (ECN).

## Postgres

Install postgreSQL :
`sudo apt install postgresql`

Create the database :
*#*`psql`
*postgres=#*`create database logistics;`


Populate database with tables :
*#*`psql -d logistics -f SQL/create_tables.sql postgres`