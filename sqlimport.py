import pyodbc
import csv

server = 'EC2AMAZ-2SULOB3\TESTDB'
database = 'Student'
username = 'EC2AMAZ-2SULOB3\prvcloudusr'
password = 'sqldb@123'
driver = '{ODBC Driver 17 for SQL Server}'

conn_str = f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password};Trusted_Connection=yes'

try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    
    table_name = 'table1'
    cursor.execute(f'SELECT * FROM {table_name}')

    rows = cursor.fetchall()

    # Print the selected rows
    for row in rows:
        print(row)
    
    #with open('C:\Temp\sqltest.csv', newline='') as csvfile:
    #    reader = csv.reader(csvfile)
    #    for row in reader:
    #        cursor.execute('INSERT INTO table1 (Rollno, Name) VALUES (?, ?)', row)
    #    conn.commit()

except Exception as e:
    print(f"An error occurred: {str(e)}")
finally:
    conn.close()
