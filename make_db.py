import config
import mysql.connector

"""
Store your mysql username and password in a config.py file.  This has
already been added to the gitignore and should be more secure than
environmental variables.  

Example format:
my_sql = dict(
    username='username',
    password='password',
)
"""

# General db connection
username = config.my_sql['username']
pw = config.my_sql['password']

db = mysql.connector.connect(
    host="localhost",
    user=username,
    passwd=pw,
    database="fitness",
    auth_plugin="mysql_native_password"
)

# Drop any existing tables and data
cursor = db.cursor()
query = "DROP DATABASE IF EXISTS fitness;"
cursor.execute(query)

query = "CREATE DATABASE fitness;"
cursor.execute(query)

query = "USE fitness;"
cursor.execute(query)

query = "DROP TABLE IF EXISTS muscles;"
cursor.execute(query)

query = "DROP TABLE IF EXISTS difficulty;"
cursor.execute(query)

query = "DROP TABLE IF EXISTS exercises;"
cursor.execute(query)

query = "DROP TABLE IF EXISTS workouts;"
cursor.execute(query)

# Setup tables
query = "CREATE TABLE muscles (id int NOT NULL, name varchar(45), PRIMARY KEY(id));"
cursor.execute(query)

query = "CREATE TABLE difficulty ("
query += "id int NOT NULL,"
query += "level	varchar(45)	NOT NULL,"
query += "PRIMARY KEY(id)"
query += ");"
cursor.execute(query)

query = "CREATE TABLE exercises ("
query += "id int NOT NULL,"
query += "name varchar(255) NOT NULL,"
query += "description varchar(255),"
query += "primary_muscle int NOT NULL,"
query += "secondary_muscle int,"
query += "PRIMARY KEY(id)"
query += ");"
cursor.execute(query)

query = "CREATE TABLE workouts ("
query += "id int NOT NULL AUTO_INCREMENT,"
query += "name varchar(255) NOT NULL,"
query += "description varchar(255),"
query += "exercise_one varchar(255),"
query += "exercise_two varchar(255),"
query += "exercise_three varchar(255),"
query += "difficulty int,"
query += "PRIMARY KEY(id)"
query += ");"
cursor.execute(query)

# Data setup
query = "INSERT INTO "
query += "muscles (id, name)"
query += "VALUES"
query += "(0, 'biceps'),"
query += "(1, 'triceps'),"
query += "(2, 'chest'),"
query += "(3, 'forearms'),"
query += "(4, 'abdominals'),"
query += "(5, 'quadriceps'),"
query += "(6, 'hamstrings'),"
query += "(7, 'calves'),"
query += "(8, 'back'),"
query += "(9, 'shoulders');"
cursor.execute(query)


