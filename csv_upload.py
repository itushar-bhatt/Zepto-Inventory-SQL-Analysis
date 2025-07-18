import pandas as pd
from sqlalchemy import create_engine

# 🔧 Database Config
host = "127.0.0.1"
user = "root"
password = "Your Password"  # Change this to your actual MySQL password
database = "zepto_db"

# 🔌 Create SQLAlchemy engine
engine = create_engine(f"mysql+pymysql://{user}:{password}@{host}/{database}")

# 📁 CSV file path
csv_path = r"Your File Path to be Pasted here"

# 📥 Load CSV into DataFrame
df = pd.read_csv(csv_path)

# ⬆️ Upload to MySQL
df.to_sql("zepto", con=engine, if_exists='replace', index=False)

print("✅ zepto_v2.csv uploaded successfully to MySQL!")
