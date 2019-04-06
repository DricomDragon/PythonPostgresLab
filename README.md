# PythonPostgresLab
A CLI (Command Line Interface) written in python to query a PostgreSQL database. Lab realized as a student at Ecole Centrale de Nantes (ECN).

## Prerequisites

What you need to get this project running. These commands were tested on a debian based system (Ubuntu 18.04 LTS).

### Python packages

#### Pip

If not installed yet, you need to get pip, the python package manager :
`sudo apt install python3-pip`

#### PyInquirer

For easy CLI python interfaces :
`sudo pip3 install pyinquirer`

#### Postgres

To install PostgreSQL driver :
`sudo pip3 install postgres`

### PostgreSQL database

I strongly recommand to know how to run an instance of postgreSQL. The schema is a model of a logistics company.

#### Install a postgreSQL instance

Install postgreSQL :
`sudo apt install postgresql`

Start service :
`sudo service postgresql start`

#### Create the database

Connect with postgres profile :
`sudo su postgres`

Create the database :
`psql -f SQL/create_db.sql postgres`

Populate database with tables :
`psql -d logistics -f SQL/create_tables.sql postgres`

Populate tables with sample data :
`psql -d logistics -f SQL/populate_tables.sql postgres`

If needed you can adapt the password of postgres user (or any user you want) :
`psql -c "alter user postgres password 'postgres_password'"`
