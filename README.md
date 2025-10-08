# 🚀 Marketing-to-Revenue Funnel Analytics  
**Tech Stack:** Snowflake | dbt | Power BI | GitHub | SQL  

---

## 🧭 Project Overview
This project demonstrates an end-to-end **modern analytics pipeline** for an e-commerce company (“TheLook / Milo Store”).  
It shows how raw transactional data from multiple sources can be modeled, tested, and visualized to help executives answer key business questions such as:

- Where are we **losing potential revenue** in the funnel?  
- Which **products, countries, and customer segments** drive sustainable growth?  
- How do **returns, cancellations, and margins** affect profitability?  
- What are the **marketing conversion rates** across traffic sources and devices?

---

## 🧱 Architecture
```text
CSV / External Sources
        ↓
Snowflake (RAW Layer)
        ↓
dbt (STAGING → INTERMEDIATE → MARTS)
        ↓
Power BI (Executive Dashboards)
---

## 🎯 Executives & KPIs

| Executive | Focus Area | Key Metrics |
|------------|-------------|--------------|
| **CEO** | Company growth & profitability | Revenue YoY %, Customer Growth %, Margin % |
| **CMO** | Marketing funnel performance | View→Cart→Purchase %, Traffic Source ROI |
| **CFO** | Financial control | Cost vs Revenue, Return Rate %, Average Order Value |
| **COO** | Operations & fulfillment | Delivery Timeliness, Cancellations, Return Rate |

---

## 🧩 Schema Structure

### Facts
- **`fact_order_items`** – Revenue, cost, margin per SKU  
- **`fact_orders`** – Order-level performance  
- **`fact_funnel_sessions`** – Anonymous visitor stages  
- **`fact_funnel_days`** – Customer-level funnel tracking  
- **`fact_customer_growth`** – New customers & YoY trend  

### Dimensions
- **`dim_date`** – Calendar hierarchy  
- **`dim_products`** – Product metadata (brand, category, department)  
- **`dim_customers`** – Demographics & traffic source  

All models follow a **star schema** for Power BI reporting, ensuring clear relationships and efficient aggregation.

---

## 🧰 Tools Used

| Tool | Purpose |
|------|----------|
| **Snowflake** | Cloud data warehouse for scalable storage & compute |
| **dbt Core** | Data transformation, testing, and modular SQL modeling |
| **Power BI Desktop** | Executive dashboards and visual analytics |
| **Git + GitHub** | Version control and portfolio publishing |
| **Python (optional)** | Data validation and Snowflake automation |

---

