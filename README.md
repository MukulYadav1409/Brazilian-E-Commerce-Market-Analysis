# 🇧🇷 Brazilian E-Commerce Market Analysis
### End-to-End Business Intelligence Project | MySQL · Power BI · Excel

> One number sums up this entire project: **37.78% of 1-star reviews are tied to late deliveries, compared to just 3% for 5-star reviews.** Everything below explains how I found that, and what else 100,000+ real orders revealed about revenue, geography, and product performance on Brazil's largest online marketplace.

---

## 📌 Project Background

Olist is a Brazilian marketplace that connects small businesses to customers across the country. This project uses Olist's real commercial transaction data from 2016–2018 to answer 12 business questions a data analyst would be expected to answer for a marketing and operations team — covering revenue, product performance, geography, and delivery satisfaction.

This is a real dataset, with real variation, telling a real business story — not a cleaned-up tutorial dataset.

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
- **Tables used:** orders · order_items · order_payments · order_reviews · customers · sellers · products · category_translation

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

## 📈 Key Findings

### Revenue & Growth
- Olist grew from 3 orders in September 2016 to 8,000+ monthly orders by 2018 — a 2,600% increase
- Total revenue: **R$13.59M** across **99,441 orders**
- Average order value: **R$120.65** · Average basket size: **1.13 items per order**
- November 2017 shows a clear Black Friday spike, approaching R$1M in a single month

### Product Performance
- **Health & Beauty** leads revenue at R$1.23M, despite not having the highest average price
- **Computers** have the highest average order value at R$1,099
- Furniture categories show freight costs consuming **25–36%** of product price — a clear margin pressure point
- **Flowers** carry a 44% freight-to-price ratio — nearly half the product's value is consumed by shipping alone

### Geographic Concentration
- **São Paulo** accounts for 57% of all sellers and 66% of total revenue
- This concentration is a real business risk — any disruption in São Paulo affects two-thirds of total revenue
- **Bahia** shows strong buyer demand but only 18 local sellers — the highest-priority underserved market for seller recruitment
- **Rio de Janeiro** underperforms relative to its population, suggesting an untapped growth opportunity

### Delivery & Customer Satisfaction
- 97.02% of orders were successfully delivered
- Average actual delivery time was 12.1 days vs. 23.4 days estimated — Olist consistently delivers about 11 days ahead of its own promise
- 8.11% of orders were delivered late, averaging 8.9 days past the promised date
- **1-star reviews show a 37.78% late delivery rate, compared to just 3% for 5-star reviews** — the single strongest predictor of customer dissatisfaction in this dataset
- 57.78% of customers give 5-star reviews, but 11.51% give 1-star — a disproportionately high share of extreme dissatisfaction for a marketplace with a 97% delivery success rate

---

## 💡 Business Recommendations

| Priority | Recommendation | Impact |
|----------|-----------------|--------|
| 🔴 High | Recruit sellers in Bahia — strong demand, critically low local supply | Revenue growth |
| 🔴 High | Enforce stricter logistics SLAs — late delivery drives 37% of 1-star reviews | Customer retention |
| 🟡 Medium | Prioritize delivery for time-sensitive categories like diapers and kitchen appliances | Review score improvement |
| 🟡 Medium | Optimize freight pricing for furniture — 25–36% freight-to-price ratio hurts margins | Profitability |
| 🟢 Low | Improve cross-sell to raise the 1.13 average basket size | Revenue per order |

---

## 📊 Dashboard

4-page interactive Power BI dashboard covering business overview, product and revenue performance, geographic distribution, and delivery satisfaction.

**Business Overview** — KPI cards, monthly revenue trend, order status breakdown
<img width="1918" height="970" alt="Screenshot 2026-06-14 230659" src="https://github.com/user-attachments/assets/68f312d6-9957-40c5-8b6b-e37ad25bbd15" />

**Product & Revenue** — Revenue by category, freight cost analysis
<img width="1912" height="972" alt="Screenshot 2026-06-14 230647" src="https://github.com/user-attachments/assets/26ee4b84-dec3-493b-a1dc-486a7df4f695" />

**Geography** — Customer and seller distribution by state

<img width="1913" height="970" alt="Screenshot 2026-06-14 230603" src="https://github.com/user-attachments/assets/4e3015a0-add8-44f2-8ab8-cd00e7a38ff3" />

**Delivery & Satisfaction** — Review score distribution, late delivery vs. rating correlation
<img width="1912" height="973" alt="Screenshot 2026-06-14 230712" src="https://github.com/user-attachments/assets/c0473ac2-c6ae-48f8-a608-7f1ce141fd26" />


---

## 🔍 Key SQL Query

All 12 analysis queries are documented in [`MySQL/analysis_queries.sql`](MySQL/analysis_queries.sql).

Sample query — Monthly Revenue Trend:

```sql
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(*) AS total_orders,
    ROUND(SUM(oi.price), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE order_status = 'delivered'
GROUP BY month
ORDER BY month ASC;
```

---

## 📁 Project Structure

```
Brazilian-E-Commerce-Market-Analysis/
│
├── Data/
│   └── (Kaggle CSV files — not uploaded due to size; see Dataset section for source link)
│
├── MySQL/
│   └── analysis_queries.sql
│
├── PowerBI/
│   ├── Brazil_Ecommerce_Market_Analysis.pbix
│   └── (dashboard screenshots)
│
└── README.md
```

---

## 🧠 Lessons Learned

- Validated dataset quality before analysis — caught uniform synthetic data in an earlier dataset through pivot table checks, which shaped how carefully I now sanity-check new data before drawing conclusions
- Learned the practical importance of indexing in MySQL — reduced query time from 30+ second timeouts to under 2 seconds on large joins
- Built a relational data model in Power BI across 8 tables using proper many-to-one relationships
- The strongest finding in the entire project wasn't a revenue number — it was that delivery performance is the single most predictive variable for customer satisfaction, which reframed how I think about what actually drives reviews in e-commerce

---

## 👤 Author

**Mukul** — Aspiring Data Analyst, building toward AI & SaaS entrepreneurship

[LinkedIn](https://www.linkedin.com/in/mukulyadav1409/)

*This project is part of my Data Analytics learning path: Excel → SQL → Power BI → Python → Statistics → Data Science → ML → AI*
