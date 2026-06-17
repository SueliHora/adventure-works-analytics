# Adventure Works Analytics - Modern Data Stack (MDS)

## Project Overview
This repository contains the complete implementation of a modern Data Warehouse for Adventure Works, a fast-growing bicycle manufacturer. The goal of this project is to transform raw transactional data into strategic data assets, turning the company into a data-driven enterprise.

This project represents the Final Capstone Project for the Analytics Engineering Certification by Indicium Academy.

---

## Architecture and Data Layers
The project follows the best practices of the Modern Data Stack methodology, leveraging dbt Cloud for transformation and governance, and Databricks as the underlying cloud data platform.

The pipeline is organized into distinct semantic layers:
* Staging (Bronze): Raw transactional data from the PostgreSQL source schema (adventure_works), cleaned, type-cast, and renamed into standard English.
* Intermediate (Silver): Complex business logic joins, bridges for many-to-many relationships, and the generation of surrogate keys.
* Marts (Gold): Production-ready dimensional modeling structured in a Star Schema optimized for analytics and BI consumption.

---

## Dimensional Modeling (Star Schema)
The analytical model is optimized to answer critical business questions regarding sales performance, customer behavior, top locations, and product margins.

* Fact Table: fact_sales (Granularity: Order line item level, secured by a custom Surrogate Key)
* Dimension Tables:
  * dim_customers: Customer profiling data.
  * dim_products: Detailed product catalog including categories and subcategories.
  * dim_locations: Geographic attributes (City, State, Country) for shipping analysis.
  * dim_credit_cards: Credit card payment types used in transactions.
  * dim_reasons and bridge_sales_reason: Mapping of multi-option purchase motivators.
  * dim_dates: Custom time series calendar for advanced time-intelligence metrics.

---

## Tech Stack
* Data Warehouse / Compute: Databricks (Free Edition)
* Data Transformation: dbt Cloud
* Version Control: GitHub
* Business Intelligence (BI): Power BI (Interactive Self-Service Dashboards)

---

## Critical Financial Validation
To satisfy the audit requirements from the executive board, a specific dbt data test was implemented to validate the data warehouse's mathematical accuracy.

* CEO Audit Criteria: Total gross sales for the year 2011 must equal exactly $12,646,112.16.
* Status: Passed. Data integrity verified against the internal accounting audit reports.

---

## Author
* Sueli da Hora Moreira - Trainee Analytics Engineer

---

## License
This project is licensed under the MIT License.