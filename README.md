# Aviation Operations KPI Tracker
### SQL + Power BI Dashboard

## Project Overview
End-to-end aviation operations dashboard built using SQLite for data 
analysis and Power BI for visualisation. Analyses flight performance 
across Indian carriers — Air India and IndiGo — across 4 major airports.

## Key Findings
- **IndiGo** has a faster average turnaround time of **47 mins** vs 
  Air India's **56 mins** — a 9 minute gap driven by fleet standardisation
- **BOM (Mumbai)** has the worst delay rate at **62%** — attributed to 
  slot constraints at one of Asia's busiest single-runway airports
- **IndiGo OTP: 48.57%** vs **Air India OTP: 42.86%**

## Tools Used
- SQLite Online — data storage and querying
- SQL — turnaround analysis, delay analysis, OTP calculation
- Power BI — interactive dashboard with slicers and KPI cards

## Files in this Repository
- `aviation_kpi_queries.sql` — all 3 SQL queries used in the analysis
- `ops_data.csv` — mock dataset with 100 realistic Indian aviation records

## Dashboard Visuals
- KPI Card — Total Flights
- Bar Chart — Average Turnaround Time by Airline
- Bar Chart — Average Delay by Airport
- Donut Chart — OTP Percentage by Airline
- Interactive Slicer — filter by Airline

## Key SQL Queries
**Turnaround Time by Airline:**
```sql
SELECT airline,
ROUND(AVG(turnaround_time_), 2) AS Avg_Turnaround_Mins,
COUNT(flight_id) AS Total_Flights
FROM ops_data
GROUP BY airline
ORDER BY Avg_Turnaround_Mins ASC;
```

**OTP Percentage by Airline:**
```sql
SELECT airline,
COUNT(flight_id) AS Total_Flights,
ROUND(SUM(CASE WHEN status = 'On Time' THEN 1 ELSE 0 END) 
* 100.0 / COUNT(flight_id), 2) AS OTP_Percentage
FROM ops_data
GROUP BY airline
ORDER BY OTP_Percentage DESC;
```

## Dataset
Mock dataset generated to simulate realistic Indian aviation operations 
data including Air India and IndiGo flights across DEL, BOM, BLR 
and HYD airports.

## Tools & Technologies
![SQL]
![PowerBI]
