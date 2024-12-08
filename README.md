# 🛍️ Retail Order Data Analyst Project

## 📋 Project Overview
This project demonstrates an end-to-end data analysis pipeline for retail order data. It involves retrieving data from Kaggle, cleaning and transforming it using Python, uploading it to a MySQL database, and performing advanced SQL queries to derive business insights.

---

## 📂 Table of Contents
- 📋 Project Overview  
- 🔧 Technologies Used  
- 📊 Dataset  
- 🚀 Project Workflow  
- 🔍 Key Analyses  

---

## 🔧 Technologies Used
- 🐍 **Python:** For data cleaning and analysis.  
- 🧳 **Pandas:** For efficient data manipulation.  
- 🗄️ **MySQL:** To store and query the transformed data.  
- 🛠️ **Kaggle API:** For dataset retrieval.  
- 🔗 **SQLAlchemy:** For Python-MySQL integration.  
- 📓 **Jupyter Notebook:** For interactive analysis.  

---

## 📊 Dataset
- **Source:** 🛍️ Kaggle Dataset - Retail Orders  
- **Key Features:**  
  - 📦 **Order Details:** Includes order IDs, customer segments, and order dates.  
  - 💰 **Pricing Data:** List price, discounts, and sale prices.  
  - 🚚 **Shipping Data:** Modes of shipment and delivery timelines.  

---

## 🚀 Project Workflow
1. **📥 Data Collection:**  
   - Retrieved the dataset from Kaggle using the Kaggle API.

2. **🧹 Data Cleaning & Transformation:**  
   - Handled missing values and standardized column names.  
   - Created new columns for Discount, Sale Price, and Profit.  
   - Converted date formats and dropped unnecessary columns.  

3. **🗄️ Database Integration:**  
   - Connected to MySQL using SQLAlchemy.  
   - Uploaded cleaned data into a structured database table for analysis.  

4. **🔍 SQL Analysis:**  
   - Conducted queries to uncover business insights.  

---

## 🔍 Key Analyses
1. 💸 **Top 10 Revenue Generating Products:** Identified the products contributing the highest sales revenue.  
2. 🌍 **Regional Sales Trends:** Found the top 5 highest-selling products in each region.  
3. 📅 **Yearly Sales Comparison:** Analyzed month-over-month sales for 2022 and 2023.  
4. 📊 **Category Sales Peaks:** Determined peak sales months for each category.  
5. 📈 **Profit Growth Analysis:** Identified sub-categories with the highest profit growth between 2022 and 2023.  

---  
This project showcases how to combine Python and SQL effectively for impactful data analysis in the retail domain. ✨
