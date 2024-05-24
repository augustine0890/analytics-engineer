from dotenv import load_dotenv
import os
import psycopg2

# Load environment variables from .env file
load_dotenv()

# Get environment variables
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

# Connect to PostgreSQL database
conn = psycopg2.connect(
    host=DB_HOST,
    port=DB_PORT,
    user=DB_USER,
    password=DB_PASSWORD,
)
print("Connected to Postgres DB")

# Create a cursor object
cur = conn.cursor()
# Get the list of tables
cur.execute('SELECT table_name FROM information_schema.tables WHERE table_schema = "public"')
# Fetch all the rows
rows = cur.fetchall()
# Print the tables
print("Default tables:")
for row in rows:
    print(row[0])

# Close the cursor and connection
cur.close()
conn.close()