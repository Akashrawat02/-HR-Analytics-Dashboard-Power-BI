# HR Analytics Dashboard – Power BI

## Project Overview
This project is an interactive HR Analytics Dashboard developed using Power BI to analyze employee attrition, attendance, performance, salary distribution, and workforce trends.

The dashboard helps HR teams make data-driven decisions by providing insights into employee behavior, department performance, and employee retention.

---

# Features
- Employee Attrition Analysis
- Department-wise Performance Tracking
- Attendance Monitoring
- Salary Insights
- Employee Satisfaction Analysis
- Interactive KPI Dashboard
- Dynamic Filters & Slicers
- Automated Reporting

---

# Tools & Technologies Used
- Power BI
- SQL
- DAX
- Power Query
- Excel
- Data Visualization

---

# Project Structure

```bash
HR-Analytics-PowerBI/
│
├── Dataset/
│   └── HR_Data.xlsx
│
├── SQL/
│   └── hr_queries.sql
│
├── PowerBI_Dashboard/
│   └── HR_Analytics_Dashboard.pbix
│
├── Screenshots/
│   ├── HR_Overview.png
│   ├── Attrition_Analysis.png
│   ├── Performance_Dashboard.png
│   └── Attendance_Dashboard.png
│
└── README.md
```

---

# SQL Queries Used

## Total Employees

```sql
SELECT COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeData;
```

## Attrition Count

```sql
SELECT COUNT(EmployeeID) AS AttritionCount
FROM EmployeeData
WHERE Attrition = 'Yes';
```

## Average Salary

```sql
SELECT AVG(Salary) AS AverageSalary
FROM EmployeeData;
```

---

# DAX Measures

## Total Employees

```DAX
Total Employees = COUNT(EmployeeData[EmployeeID])
```

## Attrition Rate

```DAX
Attrition Rate =
DIVIDE(
    [Attrition Count],
    [Total Employees],
    0
) * 100
```

## Average Attendance

```DAX
Average Attendance =
AVERAGE(EmployeeData[AttendancePercentage])
```

---

# Dashboard Pages

## 1. HR Overview Dashboard
- Total Employees
- Attrition Rate
- Department Distribution
- Gender Distribution

## 2. Employee Performance Dashboard
- Top Performers
- Department-wise Performance
- Attendance vs Performance

## 3. Attrition Analysis Dashboard
- Attrition by Department
- Attrition by Salary
- Attrition by Experience

## 4. Attendance Dashboard
- Average Attendance
- Monthly Attendance Trends

---

# Key Insights
- High attrition observed in the Sales department
- Employees with low satisfaction scores had higher attrition
- Attendance positively affected performance ratings
- Automated HR reporting reduced manual work

---

# Future Improvements
- Real-time database integration
- Predictive attrition analysis using Machine Learning
- Cloud deployment using Power BI Service

---

# Author
Akash Rawat

## Connect With Me
- LinkedIn: Add Your LinkedIn URL
- GitHub: Add Your GitHub URL

---

# License
This project is open-source and available under the MIT License.
