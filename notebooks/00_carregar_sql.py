import pandas as pd
import sqlite3

df = pd.read_csv("data/raw/WA_Fn-UseC_-HR-Employee-Attrition.csv")
conn = sqlite3.connect("data/processed/hr.db")
df.to_sql("employees",conn,if_exists="replace",index=False)
conn.close()