# Data Warehouse and Analytics Project

An end-to-end data warehouse built with SQL Server that integrates ERP and CRM sales data into a layered analytical architecture.

## Tech Stack Used:
**SQL Server · T-SQL · ETL/ELT · Data Modeling · Medallion Architecture**


## Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers

1. **Bronze Layer**: to Store the raw CSV data as-is from the source systems.
2. **Silver Layer**: Containing the cleaned, standardized/normalized data, fully prepared for analysis.
3. **Gold Layer**: Houses the "business-ready data", modeled into a dimensional star schema. trading some normalization/storage efficiency for simplicity, usability, and efficient analytical querying.

It's a minimal approach that I am most specialized in and often rely on in building Data Warehouses for the incremental data quality improvement and traceability it provides.   

---
## Project Overview

This project involves:

1. **Data Architecture**: I chose the Medallion Architecture for its simplicity and clear separation of data-processing stages.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.


#### Main Project Objective
Developing a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Importing data from two source systems (ERP and CRM) provided as CSV files that I came across online.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, business-ready and user-friendly data model.
- **Scope**: Focusing on up-to-date datasets only, avoiding unnecessary data historization.
- **Documentation**: Provide clear documentation of the data, given this projects is ultimately a portfolio project

## Key technical decisions

- **Bronze/Silver/Gold**: Chosen for it's minimalist, simple and functional nature.
- **star schema**: I picked it over the snowflake schema, to keep the analytical model simple, reduce join complexity, and make it easier   for BI tools and analysts to query.
- **Fact-Dimension Relationships**: Customer and product attributes are consolidated into dimensional tables using their business keys, while the sales fact table references these dimensions through surrogate keys.
- **particular quality checks**: Given it's importance to ensure the quality, I made sure to provide all the quality tests I used, you will find them all documented in the "tests" folder.

## Key Results ##:
**Number of source tables**: 6
**Number of records ingested**: 116292
**Number of records after cleaning**: 116283 (primarily due to duplicate and invalid records)
**Number of Gold-layer tables**: 3
**Important transformations performed**: CRM/ERP integration, Data cleansing, deduplication, NULL handling, type conversion, categorical standardization, derived columns, surrogate-key generation, Enrichment, Business logic and rules.
## Example analytical queries ##:-
**Top Performing Products**:
Mountain-200 Black- 46	With 1373454 Sales.
Mountain-200 Black- 42	With 1363128 Sales.
Mountain-200 Silver- 38	With 1339394 Sales.
Mountain-200 Silver- 46	With 1301029 Sales.
Mountain-200 Black- 38	With 1294854 Sales.
**Sales by year 2010-2014**:
2010	had 43419.
2011	had 7075088.
2012	had 5842231.
2013	had 16344878.
2014	had 45642.
## Example business insights ##:
**Product "Mountain-200 Black- 46" was the highest-revenue product, generating $1,719K and contributing the highest to total sales. suggesting it is a key revenue driver and should receive priority in inventory planning.**

---

## 📂 Repository Structure
```
Data-Warehouse-Project/
│
├── Datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── Docs/                               # Project documentation and architecture details
│   ├── Data_Catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── Naming_Conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── Scripts/                            # SQL scripts for ETL and transformations
│   ├── Bronze/                         # Scripts for extracting and loading raw data
│   ├── Silver/                         # Scripts for cleaning and transforming data
│   ├── Gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
```
---



### Credits to the Content Creator and Data Engineer "Data With Baraa" for Aspiring this project and aspiring me personally to become a Data Engineer. ###
## Noting that even so I own him credit for aspiring this project, this is not a copy-paste of his work and that I personally added and changed beyond the walkthrough, simplified and refined his work to fit the latest version of the Microsoft SQL Server.
