# 🛒 Retail Sales Analytics Dashboard

## 📊 Overview
This project focuses on analyzing retail sales data using MySQL and Power BI. The goal is to design a structured database, build a dimensional model, and generate actionable business insights through SQL stored procedures and interactive dashboards.

The project simulates a real-world retail business operating across multiple regions, products, and customers.

## 🎯 Objectives
The project answers key business questions:

- 📈 Total and average sales trends (daily, monthly, yearly)
- 🛍️ Sales performance by product category and region
- 👥 Customer retention based on order frequency
- 💳 Payment method distribution in the top revenue-generating region

These analyses help understand revenue drivers, customer behavior, and operational efficiency.

## 🗂️ Data Model

The database follows a **star schema design**:

- **Fact Table:**
  - OrderItems (transaction-level data)

- **Dimension Tables:**
  - Customers
  - Products
  - Stores
  - Orders

This structure enables efficient analytical queries and reporting :contentReference[oaicite:0]{index=0}  

## 🛠️ Tools & Technologies
- MySQL (Database & Stored Procedures)
- Power BI (Dashboard & Visualization)
- SQL (Data Cleaning, Joins, Aggregations)
- GitHub (Project Hosting)

## 🔍 Key Features

### 1. Sales Trends Analysis
- Daily, monthly, and yearly sales patterns
- Identifies revenue growth and seasonality

### 2. Category & Region Performance
- Compares product categories across regions
- Highlights high-performing markets

### 3. Customer Retention Analysis
- Identifies loyal customers (≥ 32 orders)
- Calculates retention rate (~10%)

### 4. Payment Method Insights
- Identifies top revenue region (East)
- Analyzes payment distribution across methods

## 📈 Key Insights

- 🚀 Sales increased significantly in 2024 due to higher order volume
- 🌍 East region is the top-performing market
- 👥 Only ~10% of customers are highly retained
- 💳 Payment methods are evenly distributed, reducing dependency risk

These insights help businesses improve customer retention, optimize operations, and drive revenue growth :contentReference[oaicite:1]{index=1}

## 📊 Power BI Dashboard

The dashboard includes:

- Sales trend visualizations (daily, monthly, yearly)
- Category vs region performance charts
- Customer retention analysis
- Payment method distribution

## 📁 Project Structure
