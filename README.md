# Data Warehouse and Analytics Project

An end-to-end data warehouse built with SQL Server that integrates ERP and CRM sales data into a layered analytical architecture.

## Tech Stack Used:
** SQL Server · T-SQL · ETL/ELT · Data Modeling · Medallion Architecture **

--
-
## Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers

1. **Bronze Layer**: to Store the raw CSV data as-is from the source systems.
2. **Silver Layer**: Containing the cleaned, standardized/normalized data, fully prepared for analysis.
3. **Gold Layer**: Houses the "business-ready data", modeled into a dimensional star schema.

It's A minimal approach that I am most specialized in and often rely on in building Data Warehouses  

---
## Project Overview

This project involves:

1. **Data Architecture**: Choice fell on the Medallion Architecture for it's minimalism and simplicity.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.

## Project Objectives

### Building the Data Warehouse (Data Engineering)

#### Main Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Importing data from two source systems (ERP and CRM) provided as CSV files that I came across online.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, business-ready and user-friendly data model.
- **Scope**: Focusing on up-to-date datasets only, avoiding unnecessary data historization.
- **Documentation**: Provide clear documentation of the data, given this projects is ultimately a portfolio project

## Key technical decisions

- **Bronze/Silver/Gold**: Chosen for it's minimalist, simple and functional nature.
- **star schema**: I picked it over the snowflake schema, as I Favored speed over storage. 
- **particular fact/dimension relationships**: All of the customers information from the silver layer was combined through their IDs,            where the products information was through their given product keys then both linked to the Sales Details forming the star schema.
-**particular quality checks**: Given it's importance I didn't hold back on quality checks, you will find them all documented in the "tests" folder.

---

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
```
---
