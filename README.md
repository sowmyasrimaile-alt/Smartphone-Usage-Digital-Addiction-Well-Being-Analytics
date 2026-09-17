# 📱 Smartphone Usage & Addiction Analytics

This repository contains an end-to-end data analytics project using **MySQL** and **Power BI** to study how daily smartphone habits (screen time, social media browsing, mobile gaming) impact a user's sleep metrics, stress levels, and addiction classification status.

---

## 📂 Project Architecture

```text
├── Report/
│   ├── definition/
│   │   ├── pages/               # Visual layout layout profiles
│   │   ├── report.json          # Core dashboard configuration model
│   │   └── version.json         # Dashboard version log
│   └── StaticResources/         # Shared canvas layout UI themes
├── schema.sql                   # Table schemas and setup queries
└── README.md                    # Core project documentation (This file)
```

---

## 📊 Dataset Columns

The main table `smartphone_usage` holds the tracking information matching these data metrics:

* **User Profiles:** `user_id`, `age`, `gender`
* **Daily Habits:** `daily_screen_time_hours`, `social_media_hours`, `gaming_hours`, `weekend_screen_time`
* **Engagement Activity:** `notifications_per_day`, `app_opens_per_day`
* **Life Impact:** `sleep_hours`, `stress_level` (Low, Medium, High), `academic_work_impact` (Yes/No)
* **Addiction Status:** `addiction_level` (None, Mild, Moderate, Severe), `addicted_label` (0 = No, 1 = Yes)

---

## 🗄️ Database Setup & Data Ingestion

### 1. Create the MySQL Database & Schema
Open MySQL Workbench or your terminal shell and run this DDL block to establish the table schema layout structure:

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
If you have your raw dataset saved locally as a CSV file named `smartphone_dataset.csv`, populate your table with the following bulk upload option command script:

```sql
LOAD DATA INFILE '/path/to/smartphone_dataset.csv' 
INTO TABLE smartphone_usage 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```
*Note: You can also use the graphical **Table Data Import Wizard** by right-clicking on the table inside MySQL Workbench instead of using the raw file loading script.*

---

## 🔍 Perform SQL Operations

Execute these core operational data analytics commands to parse metrics straight from your SQL client compiler engine window pane layout option list:

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

### 4. Productivity Drop vs Application Categories Use
```sql
SELECT academic_work_impact, AVG(daily_screen_time_hours), AVG(social_media_hours), AVG(gaming_hours) 
FROM smartphone_usage 
GROUP BY academic_work_impact;
```

---

## 📊 Power BI Connection & Data Prep

### 1. Connect the SQL Database with Power BI
* Launch **Power BI Desktop**.
* Navigate to the top Home ribbon tab layer bar area line list framework box setup, click **Get Data**, and select **MySQL database**.
* Input your targeted connection credentials (typically `localhost` for a local configuration layout profile machine) and link database string name `smartphone`.
* Check the checkbox list box next to table selection target `smartphone_usage` and click on button **Transform Data** to open the Power Query modeling panel environment window.

### 2. Clean Data Using Power Query
* **Verify Column Data Types:** Make sure the decimal duration parameters display as a decimal numbers structure type system profile context icon layout. Convert status flag `addicted_label` into a binary True/False logic block field map choice pattern step.
* **Handle Null Columns:** Drop trailing or empty entries to guard dashboard report page canvases from data aggregation logic errors.
* **Apply Changes Pipeline Ingestion:** Hit the top-left option link tab button labeled **Close & Apply** to import your refined dataset directly into the local data analytics model canvas workspace area panel.

---

## 🖥️ Interactive Dashboard Visualizations

The target folder dashboard template asset files path layout matching `/Report` framework folders enables interactive dashboard usage layers highlighting:

* **Addiction Level Distribution Breakdown charts:** Track risk shifts running across groups from None up to Severe status levels.
* **Habit Matrix comparisons:** Visualize overlapping patterns comparing nightly sleep rest duration lines straight against rolling mobile screen time records.
* **Stress Factor Alert metrics tracker monitors:** Track how app opens and high daily push notification alerts trigger high-stress level outputs.

To edit or interact with the template dashboard layout panels, launch your local installation version of Power BI Desktop tool software and open the template definitions document file situated inside path location `Report/definition/report.json`.
