# 🇧🇷 Brazilian E-Commerce Market Analysis
### End-to-End Business Intelligence Project | MySQL · Power BI · Excel

---

> *"Analyzed 100,000+ real orders from Olist — Brazil's largest e-commerce marketplace — to uncover revenue trends, geographic concentration, product performance, and the direct impact of delivery failures on customer satisfaction."*

---

## 📌 Project Background

Olist is a Brazilian marketplace that connects small businesses to customers across Brazil. This project takes their real commercial transaction data from 2016–2018 and answers 12 business questions a data analyst would be expected to answer for the marketing and operations team.

This is a **real dataset, with real variation, telling a real business story.**

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL | Data storage, cleaning, joins, business queries |
| Power BI | Interactive 4-page dashboard |
| Excel | Initial data exploration |

---

## 📂 Dataset

- **Source:** [Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Size:** 100,000 real orders · 8 CSV files · 500K+ rows across all tables
- **Period:** September 2016 — August 2018
- **Tables Used:** orders · order_items · order_payments · order_reviews · customers · sellers · products · category_translation

---

## ❓ Business Questions Answered

**📊 Business Overview**
1. What is the order fulfillment rate across all status types?
2. What are the key revenue metrics — total revenue, average order value, total items sold?
3. How has monthly revenue trended from 2016 to 2018?

**🛍️ Product & Revenue Analysis**
4. Which product categories generate the highest revenue?
5. Which categories have the highest average order value?
6. Which categories have the worst freight-to-price ratio?

**🗺️ Geography**
7. Which Brazilian states generate the most revenue from customers and sellers?
8. Which cities have the highest order concentration?

**🚚 Delivery & Satisfaction**
9. What is average delivery performance vs estimated delivery dates?
10. Is there a correlation between late deliveries and low review scores?
11. What is the overall review score distribution?
12. Which product categories receive the worst customer ratings?

---

## 🔍 Key SQL Queries

All 12 analysis queries are documented in [`SQL/analysis_queries.sql`](SQL/analysis_queries.sql)

Sample query — Monthly Revenue Trend:
```sql
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') as month,
    COUNT(*) as total_orders,
    ROUND(SUM(oi.price), 2) as monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE order_status = 'delivered'
GROUP BY month
ORDER BY month ASC;
```

---

## 📈 Key Findings

### Revenue & Growth
- 📈 Olist grew from **3 orders in Sept 2016** to **8,000+ monthly orders by 2018** — a **2,600% increase**
- 💰 Total revenue: **R$13.59M** across **99,441 orders**
- 🛒 Average order value: **R$120.65** · Average basket size: **1.13 items per order**
- 🎯 **November 2017** shows a clear Black Friday spike approaching **R$1M in a single month**

### Product Performance
- 👑 **Health & Beauty** leads revenue at **R$1.23M** despite not having the highest average price
- 💻 **Computers** have the highest average order value at **R$1,099**
- 🪑 Furniture categories show freight costs consuming **25–36% of product price** — indicating margin pressure
- 🌸 **Flowers** have a 44% freight-to-price ratio — nearly half the product value consumed by shipping

### Geographic Concentration
- 🏙️ **São Paulo** accounts for **57% of all sellers** and **66% of total revenue**
- 🚨 Extreme geographic concentration — any SP disruption impacts two-thirds of revenue
- 📍 **Bahia** shows strong buyer demand with only **18 local sellers** — highest priority underserved market
- 🌆 **Rio de Janeiro** underperforms relative to its population — untapped growth opportunity

### Delivery & Customer Satisfaction
- ✅ **97.02%** of orders successfully delivered
- ⚡ Average actual delivery: **12.1 days** vs **23.4 days** estimated — consistently **11 days ahead**
- ⚠️ **8.11%** of orders delivered late — averaging **8.9 days** past promised date
- 💔 **1-star reviews** show **37.78% late delivery rate** vs just **3%** for 5-star reviews
- ⭐ **57.78%** of customers give 5-star reviews but **11.51%** give 1-star — disproportionately high

---

## 💡 Business Recommendations

| Priority | Recommendation | Impact |
|----------|---------------|--------|
| 🔴 High | Recruit sellers in Bahia — strong demand, critically low supply | Revenue growth |
| 🔴 High | Enforce stricter logistics SLAs — late delivery drives 37% of 1-star reviews | Customer retention |
| 🟡 Medium | Priority delivery for diapers and kitchen appliances — time-sensitive categories | Review score improvement |
| 🟡 Medium | Freight optimization for furniture — 25–36% freight-to-price ratio hurts margins | Profitability |
| 🟢 Low | Improve cross-sell — 1.13 avg basket size is low for a marketplace | Revenue per order |

---

## 📊 Dashboard

4-page interactive Power BI dashboard covering:

**Business Overview**
<img width="1918" height="970" alt="Screenshot 2026-06-14 230659" src="https://github.com/user-attachments/assets/68f312d6-9957-40c5-8b6b-e37ad25bbd15" />

**Product & Revenue**
<img width="1912" height="972" alt="Screenshot 2026-06-14 230647" src="https://github.com/user-attachments/assets/26ee4b84-dec3-493b-a1dc-486a7df4f695" />

**Geography**
<img width="1913" height="970" alt="Screenshot 2026-06-14 230603" src="https://github.com/user-attachments/assets/4e3015a0-add8-44f2-8ab8-cd00e7a38ff3" />

**Delivery & Satisfaction**
<img width="1912" height="973" alt="Screenshot 2026-06-14 230712" src="https://github.com/user-attachments/assets/c0473ac2-c6ae-48f8-a608-7f1ce141fd26" />

| Page | Focus |
|------|-------|
| Business Overview | KPI cards · Monthly trend · Order status breakdown |
| Product & Revenue | Revenue by category · Freight cost analysis |
| Geography | Customer state · Seller state distribution |
| Delivery & Satisfaction | Review score distribution · Late delivery vs rating correlation |

---

## 📁 Project Structure

```
Brazil_Ecommerce_Market_Analysis/
│
├── 📂 Data/
│   └── (Kaggle CSV files — not uploaded due to size)
│
├── 📂 SQL/
│   └── analysis_queries.sql
│
├── 📂 PowerBI/
│   └── Brazil_Ecommerce_Market_Analysis.pbix
│
└── README.md
```

---

## 🧠 Lessons Learned

- Validated dataset quality before analysis — caught uniform synthetic data in a previous dataset through pivot table checks
- Learned the importance of indexing in MySQL — reduced query time from 30+ second timeouts to under 2 seconds
- Built relational data model in Power BI across 8 tables using proper many-to-one relationships
- Discovered that delivery performance is the single most predictive variable for customer satisfaction

---

## 👤 Author

**Mukul**
Aspiring Data Analyst · Building toward AI & SaaS entrepreneurship

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://www.linkedin.com/in/mukulyadav1409/)


---

*This project is part of my Data Analytics learning path: Excel → SQL → Power BI → Python → Data Science → ML → AI*
