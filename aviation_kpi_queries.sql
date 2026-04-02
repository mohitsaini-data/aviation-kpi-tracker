-- Query 1: Average Turnaround Time by Airline
SELECT 
    airline,
    ROUND(AVG(turnaround_time_), 2) AS Avg_Turnaround_Mins,
    COUNT(flight_id) AS Total_Flights
FROM ops_data
GROUP BY airline
ORDER BY Avg_Turnaround_Mins ASC;

-- Query 2: Delay Analysis by Origin Airport
SELECT 
    origin,
    ROUND(AVG(delay_mins), 2) AS Avg_Delay_Mins,
    COUNT(flight_id) AS Total_Flights,
    SUM(CASE WHEN status = 'Delayed' THEN 1 ELSE 0 END) AS Delayed_Flights
FROM ops_data
GROUP BY origin
ORDER BY Avg_Delay_Mins DESC;

-- Query 3: OTP Percentage by Airline
SELECT 
    airline,
    COUNT(flight_id) AS Total_Flights,
    SUM(CASE WHEN status = 'On Time' THEN 1 ELSE 0 END) AS On_Time_Flights,
    ROUND(SUM(CASE WHEN status = 'On Time' THEN 1 ELSE 0 END) * 100.0 / COUNT(flight_id), 2) AS OTP_Percentage
FROM ops_data
GROUP BY airline
ORDER BY OTP_Percentage DESC;