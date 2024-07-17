import pandas as pd

csv_file = './report1.csv'
table_name = 'report_table'

df = pd.read_csv(csv_file)

sql_queries = []
for index, row in df.iterrows():
    columns = ', '.join([f'[{col}]' for col in row.index])
    values = ', '.join([f"'{str(val)}'" for val in row])
    insert_query = f"INSERT INTO {table_name} ({columns}) VALUES ({values});"
    sql_queries.append(insert_query)

with open('insert_queries.sql', 'w') as sql_file:
    sql_file.write('\n'.join(sql_queries))

print(f"SQL queries have been written to insert_queries.sql.")
