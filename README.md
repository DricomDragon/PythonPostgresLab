# PythonPostgresLab
A CLI (Command Line Interface) written in python to query a PostgreSQL database. Lab realized as a student at Ecole Centrale de Nantes (ECN).

## Postgres

Install postgreSQL :
`sudo apt install postgresql`

Connect with postgres profile :
`sudo su postgres`

Create the database :
`psql -f SQL/create_db.sql postgres`

Populate database with tables :
`psql -d logistics -f SQL/create_tables.sql postgres`