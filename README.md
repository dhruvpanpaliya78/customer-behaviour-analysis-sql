# Customer Behaviour Analysis using SQL

## Project Overview

This project analyzes customer purchasing behaviour using SQL to identify patterns in customer spending, purchase frequency, product preferences, payment methods, referral sources, coupon usage, and sales performance.

The analysis is performed on a retail transaction dataset containing **1,200 orders**.

## Business Objectives

The project aims to answer key business questions such as:

* Who are the highest-value customers?
* Which products generate the most revenue?
* What is the average order value?
* Which customers are repeat buyers?
* Which payment methods are most frequently used?
* Which referral sources generate the most revenue?
* How does coupon usage affect order behaviour?
* How does cart size relate to order value?
* What are the monthly sales trends?
* Which customers contribute the most to overall revenue?

## SQL Skills Used

* Data cleaning and validation
* Aggregate functions
* GROUP BY and HAVING
* CASE statements
* Subqueries
* Common Table Expressions (CTEs)
* Window functions
* RANK() and DENSE_RANK()
* Date functions
* Customer segmentation
* Business-oriented analysis

## Dataset

The dataset contains transaction-level information including:

* Order ID
* Date
* Customer ID
* Product
* Quantity
* Unit Price
* Payment Method
* Order Status
* Items in Cart
* Coupon Code
* Referral Source
* Total Price

## Tools

**MySQL | SQL | GitHub**

## Project Objective

The objective of this project is to demonstrate practical SQL skills by transforming raw transaction data into actionable customer and business insights.

## Key Business Insights

* The dataset contains **1,200 orders from 1,189 unique customers**, generating total revenue of **₹12,64,761.96** with an average order value of **₹1,053.97**.
* Customer retention is very low: **1,178 customers (99.07%)** made only one purchase, while only **11 customers (0.93%)** were repeat buyers.
* **Chair** generated the highest product revenue at **₹1,95,620.11**, while **Printer** recorded the highest number of orders with **181 orders**.
* **Online payments** had the highest order volume with **258 orders**, while **Credit Card** payments generated the highest revenue of **₹2,63,847.63** and the highest average order value of **₹1,127.55**.
* **Instagram** was the strongest referral source, generating **₹2,75,285.45** in revenue from **259 orders**.
* **Facebook** generated the highest average order value among referral sources at **₹1,098.29**.
* Monthly revenue peaked in **June 2024 at ₹68,068.54**, while **September 2023** recorded the lowest monthly revenue at **₹29,526.67**.
* The analysis highlights a significant **customer-retention opportunity** due to the very low repeat-purchase rate.

## Project Structure

```text
customer-behaviour-analysis-sql/
│
├── README.md
├── customer_behaviour.csv
│
├── 01_data_quality.sql
├── 02_customer_analysis.sql
├── 03_business_analysis.sql
└── 04_advanced_analysis.sql
```

The objective of this project is to demonstrate practical SQL skills by transforming raw transaction data into actionable customer and business insights.
