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

#### Create SQL objects

##### Create python user

Create owner of the _logistics_ database.

`sudo -u postgres psql -f SQL/create_user.sql`

##### Create the database

Create the database :

`sudo -u postgres psql -f SQL/create_db.sql`

##### Create tables

Populate database with tables :

`sudo -u postgres psql -d logistics -f SQL/create_tables.sql`

Grant python to alter these tables :

`sudo -u postgres psql -d logistics -f SQL/grant_python.sql`

##### Add starter testing data

Populate tables with sample data :

`sudo -u postgres psql -d logistics -f SQL/populate_tables.sql`

#### Security

If needed you can adapt the password of *python_app* user (or any user you want) :

`sudo -u postgres psql -c "ALTER USER python_app PASSWORD 'blablapoivron'"`

#### Shortcut

To do everything in two single command :
`sudo -u postgres psql -f SQL/create_user.sql -f SQL/create_db.sql`

`sudo -u postgres psql -d logistics -f SQL/create_tables.sql -f SQL/grant_python.sql -f SQL/populate_tables.sql`

#### Clear everything

Remove database and *python_app* db user :

`sudo -u postgres psql -f SQL/clear_all.sql`

## Repository structure

How files are organized.

### Python files with `app_` prefix

Python application launched by user. For instance, to run the application as a customer, run the following command

`python3 app_customer.py`

### `test_pyinquirer.py`

Execute this file with python to check if PyInquirer is correctly installed. No need of PostgreSQL to start this file.

### `basic_display.py`

Contains a class that perform simple prints to show information to users.

### `cli`

**cli** stands for *command line interface*. You will find every class which asks inputs to user. That's where the PyInquirer module is used.

### `consumer`

Contains code to interact with the database. The class **Consumer** in `consumer.py` holds a connection to perform SQL queries against the database. If you need to change the credentials used to log on the database, please modify `credentials.py`.

### `SQL`

Contains the SQL files used in the *prerequisites* section to create and populate the `logistics` database used by application.

### `model`

Contain simple python classes mapped to relational model. Used in `basic_display.py` to get the code more readable.
