# 📱 Smartphone Usage & Addiction Analytics

This repository contains an end-to-end data analytics project using **MySQL** and **Power BI** to study how daily smartphone habits (screen time, social media browsing, mobile gaming) impact a user's sleep metrics, stress levels, and addiction classification status.

---

## 📂 Project Architecture

```text
├── 1.Project Initilization and Planning/  # Core roadmap and scope definitions
├── 2.Data Collection and Preprocessing/   # Scripts for ingestion data workflows
├── 3.Data Visualization/                  # Analytical logic charts and raw graphs
├── 4.Dashboard/                           # Frontend staging interface configurations
├── 5.Report/                              # Power BI Report configuration files
│   ├── definition/
│   │   ├── pages/                         # Visual canvas layout profiles
│   │   ├── report.json                    # Core dashboard configuration model
│   │   └── version.json                   # Dashboard version log
│   └── StaticResources/                   # Shared canvas UI themes
├── Smartphone_Dataset.csv                 # Raw relational tracking dataset
├── smartphone.pbix                        # Core compiled Power BI workbook
└── smartphone_sql_queries.sql             # Table schemas and setup queries
```

---

## 📊 Dataset Columns

The main table data held inside `Smartphone_Dataset.csv` tracks these specific parameters:

* **User Profiles:** `user_id`, `age`, `gender`
* **Daily Habits:** `daily_screen_time_hours`, `social_media_hours`, `gaming_hours`, `weekend_screen_time`
* **Engagement Activity:** `notifications_per_day`, `app_opens_per_day`
* **Life Impact:** `sleep_hours`, `stress_level` (Low, Medium, High), `academic_work_impact` (Yes/No)
* **Addiction Status:** `addiction_level` (None, Mild, Moderate, Severe), `addicted_label` (0 = No, 1 = Yes)

---

## 🗄️ Database Setup & Data Ingestion

### 1. Create the MySQL Database & Schema
Open MySQL Workbench or your terminal shell and run this DDL block from `smartphone_sql_queries.sql` to establish the table structure:

```sql
CREATE DATABASE smartphone;
USE smartphone;

CREATE TABLE smartphone_usage (
    transaction_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50),
    age INT,
    gender VARCHAR(20),
    daily_screen_time_hours DECIMAL(4,2),
    social_media_hours DECIMAL(4,2),
    gaming_hours DECIMAL(4,2),
    work_study_hours DECIMAL(4,2),
    sleep_hours DECIMAL(4,2),
    notifications_per_day INT,
    app_opens_per_day INT,
    weekend_screen_time DECIMAL(4,2),
    stress_level VARCHAR(20),
    academic_work_impact VARCHAR(10),
    addiction_level VARCHAR(20),
    addicted_label TINYINT(1)
);
```

### 2. Load the Dataset Records
Populate your database table by running a bulk upload command pointed toward your local data path:

```sql
LOAD DATA INFILE '/path/to/Smartphone_Dataset.csv' 
INTO TABLE smartphone_usage 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```
*Note: You can also use the graphical **Table Data Import Wizard** by right-clicking the table inside MySQL Workbench instead of using the raw script.*

---

## 🔍 SQL Analytical Queries

Execute these operational analytics commands from `smartphone_sql_queries.sql` to parse metrics straight from your SQL compiler:

### 1. Check Row Ingestion Completion
```sql
SELECT COUNT(*) FROM smartphone_usage;
```

### 2. Addiction Concentration Rates Segmented by Gender
```sql
SELECT gender, COUNT(*), SUM(CASE WHEN addicted_label = 1 THEN 1 ELSE 0 END) AS addicted_count 
FROM smartphone_usage 
GROUP BY gender;
```

### 3. Usage Threshold Baselines & High-Stress Incidences
```sql
SELECT AVG(daily_screen_time_hours), AVG(sleep_hours), AVG(stress_level = 'High') 
FROM smartphone_usage;
```

### 4. Productivity Drop vs Application Use Categories
```sql
SELECT academic_work_impact, AVG(daily_screen_time_hours), AVG(social_media_hours), AVG(gaming_hours) 
FROM smartphone_usage 
GROUP BY academic_work_impact;
```

---

## 📊 Power BI Connection & Data Prep

### 1. Connect the SQL Database with Power BI
* Launch **Power BI Desktop** and open `smartphone.pbix`.
* Navigate to the top **Home** tab ribbon, click **Get Data**, and select **MySQL database**.
* Input your database credentials (typically `localhost` for local machines) and enter the database name `smartphone`.
* Check the box next to table `smartphone_usage` and click **Transform Data** to launch the Power Query Editor.

### 2. Clean Data Using Power Query
* **Verify Column Data Types:** Confirm that decimal duration parameters display as a decimal number format. Convert status flag `addicted_label` into a binary True/False logic field.
* **Handle Null Columns:** Drop any trailing or empty entries to protect your charts from mathematical calculation errors.
* **Apply Changes:** Click the top-left button labeled **Close & Apply** to import your refined dataset directly into the visualization canvas workspace.

---

## 🖥️ Interactive Dashboard Visualizations

The template asset files located inside the `5.Report/` folder enable interactive dashboards highlighting three core insight areas:

* **Addiction Level Distributions:** Track risk shifts running across user segments from None up to Severe status levels.
* **Habit Matrix Models:** Contrast patterns comparing nightly sleep rest hours straight against daily screen time records.
* **Stress Factor Alert Flags:** Monitor how high application open frequencies and push notification volumes trigger high-stress level outputs.

To edit or interact with the template dashboard panels, open Power BI Desktop and load the workbook file `smartphone.pbix` or inspect the underlying report layout definitions nested inside `5.Report/definition/report.json`.
