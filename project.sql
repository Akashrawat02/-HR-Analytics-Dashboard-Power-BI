-- =========================================
-- HR ANALYTICS FULL PROJECT CODE
-- SQL + POWER BI + DAX
-- =========================================

-- =========================================
-- CREATE DATABASE
-- =========================================

CREATE DATABASE HR_Analytics;

USE HR_Analytics;

-- =========================================
-- CREATE TABLE
-- =========================================

CREATE TABLE EmployeeData (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Department VARCHAR(50),
    JobRole VARCHAR(100),
    Salary DECIMAL(10,2),
    Experience INT,
    Attrition VARCHAR(10),
    AttendancePercentage DECIMAL(5,2),
    PerformanceRating INT,
    JobSatisfaction INT,
    WorkLifeBalance INT,
    JoiningDate DATE
);

-- =========================================
-- INSERT SAMPLE DATA
-- =========================================

INSERT INTO EmployeeData VALUES
(101,'Rahul Sharma','Male',28,'Sales','Sales Executive',45000,3,'Yes',85,3,2,3,'2021-06-15'),

(102,'Priya Singh','Female',31,'HR','HR Manager',65000,6,'No',95,4,4,4,'2019-03-10'),

(103,'Amit Verma','Male',26,'IT','Data Analyst',55000,2,'No',92,5,5,4,'2022-01-12'),

(104,'Sneha Kapoor','Female',29,'Finance','Financial Analyst',60000,4,'No',90,4,4,5,'2020-07-18'),

(105,'Rohit Kumar','Male',35,'Sales','Sales Manager',75000,9,'Yes',78,2,2,2,'2017-09-22'),

(106,'Neha Joshi','Female',27,'IT','Power BI Developer',58000,3,'No',96,5,5,5,'2021-11-05'),

(107,'Vikas Mehta','Male',32,'Operations','Operations Executive',52000,5,'No',88,3,3,4,'2019-05-20'),

(108,'Anjali Gupta','Female',30,'HR','Recruiter',50000,4,'Yes',82,3,2,3,'2020-08-14');

-- =========================================
-- VIEW ALL DATA
-- =========================================

SELECT * FROM EmployeeData;

-- =========================================
-- KPI QUERIES
-- =========================================

-- Total Employees
SELECT COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeData;

-- Attrition Count
SELECT COUNT(EmployeeID) AS AttritionCount
FROM EmployeeData
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT
(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0
) / COUNT(*) AS AttritionRate
FROM EmployeeData;

-- Average Salary
SELECT AVG(Salary) AS AverageSalary
FROM EmployeeData;

-- Average Attendance
SELECT AVG(AttendancePercentage) AS AverageAttendance
FROM EmployeeData;

-- Average Performance Rating
SELECT AVG(PerformanceRating) AS AvgPerformance
FROM EmployeeData;

-- Employee Satisfaction
SELECT AVG(JobSatisfaction) AS AvgSatisfaction
FROM EmployeeData;

-- Work Life Balance
SELECT AVG(WorkLifeBalance) AS AvgWorkLifeBalance
FROM EmployeeData;

-- =========================================
-- DEPARTMENT ANALYSIS
-- =========================================

SELECT Department,
COUNT(EmployeeID) AS EmployeeCount
FROM EmployeeData
GROUP BY Department;

-- =========================================
-- ATTRITION ANALYSIS
-- =========================================

SELECT Department,
COUNT(EmployeeID) AS AttritionCount
FROM EmployeeData
WHERE Attrition = 'Yes'
GROUP BY Department;

-- =========================================
-- GENDER DISTRIBUTION
-- =========================================

SELECT Gender,
COUNT(EmployeeID) AS EmployeeCount
FROM EmployeeData
GROUP BY Gender;

-- =========================================
-- PERFORMANCE ANALYSIS
-- =========================================

SELECT EmployeeName,
Department,
PerformanceRating
FROM EmployeeData
ORDER BY PerformanceRating DESC;

-- =========================================
-- ATTENDANCE ANALYSIS
-- =========================================

SELECT Department,
AVG(AttendancePercentage) AS AvgAttendance
FROM EmployeeData
GROUP BY Department;

-- =========================================
-- SALARY DISTRIBUTION
-- =========================================

SELECT Department,
AVG(Salary) AS AvgSalary
FROM EmployeeData
GROUP BY Department;

-- =========================================
-- EXPERIENCE ANALYSIS
-- =========================================

SELECT Experience,
COUNT(EmployeeID) AS EmployeeCount
FROM EmployeeData
GROUP BY Experience
ORDER BY Experience;

-- =========================================
-- TOP PERFORMERS
-- =========================================

SELECT TOP 5 *
FROM EmployeeData
ORDER BY PerformanceRating DESC;

-- =========================================
-- POWER BI DAX MEASURES
-- =========================================

-- Total Employees
Total Employees =
COUNT(EmployeeData[EmployeeID])

-- Attrition Count
Attrition Count =
CALCULATE(
COUNT(EmployeeData[EmployeeID]),
EmployeeData[Attrition] = "Yes"
)

-- Attrition Rate
Attrition Rate =
DIVIDE(
[Attrition Count],
[Total Employees],
0
) * 100

-- Average Salary
Average Salary =
AVERAGE(EmployeeData[Salary])

-- Average Attendance
Average Attendance =
AVERAGE(EmployeeData[AttendancePercentage])

-- Average Performance Rating
Average Performance Rating =
AVERAGE(EmployeeData[PerformanceRating])

-- Employee Satisfaction Score
Employee Satisfaction Score =
AVERAGE(EmployeeData[JobSatisfaction])

-- Work Life Balance Score
Work Life Balance Score =
AVERAGE(EmployeeData[WorkLifeBalance])

-- Male Employees
Male Employees =
CALCULATE(
COUNT(EmployeeData[EmployeeID]),
EmployeeData[Gender] = "Male"
)

-- Female Employees
Female Employees =
CALCULATE(
COUNT(EmployeeData[EmployeeID]),
EmployeeData[Gender] = "Female"
)

-- Total Salary Expense
Total Salary Expense =
SUM(EmployeeData[Salary])

-- Average Age
Average Age =
AVERAGE(EmployeeData[Age])

-- High Satisfaction Employees
High Satisfaction Employees =
CALCULATE(
COUNT(EmployeeData[EmployeeID]),
EmployeeData[JobSatisfaction] >= 4
)

-- Low Attendance Employees
Low Attendance Employees =
CALCULATE(
COUNT(EmployeeData[EmployeeID]),
EmployeeData[AttendancePercentage] < 80
)

-- =========================================
-- POWER BI FRONT-END DASHBOARD
-- =========================================

/*

DASHBOARD 1 : HR OVERVIEW
---------------------------------
KPI Cards:
- Total Employees
- Attrition Rate
- Average Salary
- Average Attendance

Charts:
- Department Wise Employees → Bar Chart
- Gender Distribution → Pie Chart
- Age Group Analysis → Column Chart

Slicers:
- Department
- Gender
- Job Role


DASHBOARD 2 : ATTRITION ANALYSIS
---------------------------------
Charts:
- Attrition by Department
- Attrition by Experience
- Attrition by Salary

KPIs:
- Attrition Count
- Attrition Percentage


DASHBOARD 3 : PERFORMANCE DASHBOARD
---------------------------------
Charts:
- Top Performers
- Attendance vs Performance
- Department Performance

KPIs:
- Average Performance Rating
- Employee Satisfaction


DASHBOARD 4 : ATTENDANCE DASHBOARD
---------------------------------
Charts:
- Monthly Attendance Trend
- Department Attendance
- Work Life Balance

*/

-- =========================================
-- POWER QUERY TRANSFORMATIONS
-- =========================================

/*

1. Remove Null Values
2. Remove Duplicates
3. Change Data Types
4. Rename Columns
5. Create Conditional Columns
6. Format Date Columns
7. Clean Department Names

*/

-- =========================================
-- PROJECT END
-- =========================================