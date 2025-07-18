
## 📌 Project Overview - 🛒 Zepto Inventory SQL Analysis

The goal of this project is to simulate how actual data analysts in the e-commerce or retail industry work behind the scenes to:

- ✅ Set up a messy, real-world inventory database
- ✅ Perform EDA (Exploratory Data Analysis) on product categories, pricing, and stock
- ✅ Clean data by removing invalid entries and converting prices from paise to rupees
- ✅ Write SQL queries to derive key business insights (pricing, availability, revenue, etc.)

---

## 📁 Dataset Overview

This dataset is inspired by real Zepto product listings (sourced via Kaggle). It reflects what an actual e-commerce catalog might look like:
- One product (e.g., Apple) may appear multiple times with different sizes, prices, and discounts
- Each row is a unique **SKU (Stock Keeping Unit)**

---

## 🧾 Columns Breakdown

| Column Name             | Description |
|-------------------------|-------------|
| `sku_id`                | Unique identifier (synthetic primary key) |
| `name`                  | Product name from app |
| `category`              | Category like Fruits, Snacks, Beverages |
| `mrp`                   | Maximum Retail Price (in ₹) |
| `discountPercent`       | Discount percentage on MRP |
| `discountedSellingPrice` | Final selling price after discount |
| `availableQuantity`     | Units available in stock |
| `weightInGms`           | Weight of product in grams |
| `outOfStock`            | Boolean flag (True/False) |
| `quantity`              | Number of units or package size |

---

## 🧰 Tech Stack

- 🐍 Python: `pandas`, `sqlalchemy`, `pymysql`
- 🐬 MySQL: Database to store and analyze inventory
- 🛠️ MySQL Workbench / CLI
- 📁 GitHub for version control

---

## 🔧 Project Workflow

### 1. 🧱 Database & Table Creation

```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```

---

### 2. 📥 Data Import via Python

- Loaded `zepto_v2.csv` using `pandas`
- Connected to MySQL using `sqlalchemy` and `pymysql`
- Generated unique `sku_id` dynamically
- Uploaded the dataset into the `zepto` table

> ✅ Python script is included in the repository.

---

### 3. 🔍 Data Exploration

- Checked total number of records
- Sampled the data for structure and cleanliness
- Identified nulls and missing values
- Detected all distinct categories
- Compared stock vs out-of-stock products
- Found duplicate product names representing different SKUs

---

### 4. 🧹 Data Cleaning

- Removed rows with MRP or discount price = 0
- Converted `mrp` and `discountedSellingPrice` from **paise to ₹**
- Ensured Boolean fields (`outOfStock`) were stored properly

---

### 5. 📊 Business-Driven SQL Insights

- 🏷️ Top 10 best-value products based on discounts
- ❌ Out-of-stock high-MRP products
- 💰 Revenue estimation by product category
- 🧃 Filtered luxury products (MRP > ₹500) with low discount
- 🥇 Ranked categories by highest average discount
- ⚖️ Price-per-gram analysis for value-for-money items
- 📦 Grouped products by weight: Low, Medium, Bulk
- ⚖️ Calculated total inventory weight per category

---


## 🧑‍💻 About the Author

**Tushar Bhatt**  
🎓 Data Analytics Student | 📍 India  
🔗 [GitHub](https://github.com/itushar-bhatt)
 • [LinkedIn](https://www.linkedin.com/in/itusharbhatt)

---

## 📄 License

This project is open-source and free to use for learning or academic purposes.

---

