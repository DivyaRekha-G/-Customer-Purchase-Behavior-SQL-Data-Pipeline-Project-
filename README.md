# Customer-Purchase-Behavior-SQL-Data-Pipeline-Project
# 🛍️ Customer Purchase Behavior - SQL Data Pipeline

This project builds a complete SQL-based data pipeline to analyze customer purchase behavior by cleaning, transforming, and segmenting raw transactional data.

---

## 📌 Project Objective

To segment customers into High, Medium, and Low value based on their total spending using raw order and customer data.

---

## 📁 Dataset

- `raw_customers_2500.csv`: Simulated customer signup data
- `raw_orders_2500.csv`: Simulated order history with statuses

---

## 🧩 Tools Used

- **SQL (MySQL)**
- **Excel** for CSV generation
- Optional: Power BI or Tableau for visualization

---

## ⚙️ ETL Steps (SQL)

1. **Extract** raw customer and order data from CSVs
2. **Transform**:
   - Clean data to include only 'completed' orders
   - Calculate total spend, total orders, average order value
   - Segment customers into:
     - High Value (>= ₹1000)
     - Medium Value (₹500–₹999)
     - Low Value (< ₹500)
3. **Load** into a final result table or report view

---

## 🔍 Final SQL Query Logic

```sql
SELECT *,
    CASE 
        WHEN total_spent >= 1000 THEN 'High Value'
        WHEN total_spent >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_summary
WHERE total_spent IS NOT NULL;
