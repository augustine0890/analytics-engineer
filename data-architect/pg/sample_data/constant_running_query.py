import time

import psycopg2

# Database connection details
dbhost = "localhost"
dbusername = "postgres"
dbpassword = "welcome"
dbname = "hr"

# Establish connection
try:
    connection = psycopg2.connect(
        host=dbhost, port=5432, dbname=dbname, user=dbusername, password=dbpassword
    )
    cursor = connection.cursor()
    print("Connected to the database")
except Exception as e:
    print(f"Could not connect to server: {e}")
    exit(1)

# Number of loops
loop_number = 1000

# Loop to query and print employee names
for i in range(loop_number):
    query = "SELECT * FROM employees"
    try:
        cursor.execute(query)
        rows = cursor.fetchall()
        if rows:
            for row in rows:
                print(f"Employee Name: {row['first_name']}, {row['last_name']}")
    except Exception as e:
        print(f"Query failed: {e}")

    print(f"Sleeping.. {i}")
    time.sleep(5)

# Close connection
cursor.close()
connection.close()
print("Connection closed")
