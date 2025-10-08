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

