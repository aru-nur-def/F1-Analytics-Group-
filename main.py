import mysql.connector
import pandas as pd

config = {
    "host": "localhost",    
    "user": "root",         
    "password": "Aruzhan2005!",  
    "database": "formula1",  
}

conn = mysql.connector.connect(**config)
cursor = conn.cursor()

# --- SQL-запросы ---
queries = {
    "races_per_season": """
        SELECT year, COUNT(*) AS total_races
        FROM races
        GROUP BY year
        ORDER BY year ASC
        LIMIT 10;
    """,
    "top_drivers": """
        SELECT d.forename, d.surname, COUNT(*) AS wins
        FROM results r
        JOIN drivers d ON r.driverId = d.driverId
        WHERE r.position = 1
        GROUP BY d.driverId, d.forename, d.surname
        ORDER BY wins DESC
        LIMIT 10;
    """,
    "top_constructors": """
        SELECT c.name AS constructor, COUNT(*) AS wins
        FROM results r
        JOIN constructors c ON r.constructorId = c.constructorId
        WHERE r.position = 1
        GROUP BY c.constructorId, c.name
        ORDER BY wins DESC
        LIMIT 10;
    """
}

for name, query in queries.items():
    print(f"\n--- {name} ---")
    df = pd.read_sql(query, conn)
    print(df)
    df.to_excel(f"{name}.xlsx", index=False)

cursor.close()
conn.close()
