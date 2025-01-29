--analyzing
select * from taxi-dep.data_modeling_taxi_dataset.fact_table limit 20;
--Analyze Total Revenue by Payment Type
SELECT 
    p.payment_type_id,
    SUM(f.total_amount) AS total_revenue
FROM 
    taxi-dep.data_modeling_taxi_dataset.fact_table AS f
JOIN 
    taxi-dep.data_modeling_taxi_dataset.payment_type_dim AS p
ON 
    f.payment_type_id = p.payment_type_id
GROUP BY 
    p.payment_type_id
ORDER BY 
    total_revenue DESC;
-- Top Pickup Locations by Trip Count
SELECT 
    pl.pickup_location_id,
    COUNT(f.trip_id) AS trip_count
FROM 
    taxi-dep.data_modeling_taxi_dataset.fact_table AS f
JOIN 
    taxi-dep.data_modeling_taxi_dataset.pickup_location_dim AS pl
ON 
    f.pickup_location_id = pl.pickup_location_id
GROUP BY 
    pl.pickup_location_id
ORDER BY 
    trip_count DESC
LIMIT 10;
--Average Tip Amount by Vendor
SELECT 
    f.VendorID,
    AVG(f.tip_amount) AS avg_tip
FROM 
    taxi-dep.data_modeling_taxi_dataset.fact_table AS f
GROUP BY 
    f.VendorID
ORDER BY 
    avg_tip DESC;
  --Trips by Time of Day
  SELECT 
    EXTRACT(HOUR FROM d.tpep_pickup_datetime) AS hour_of_day,
    COUNT(f.trip_id) AS trip_count
FROM 
    taxi-dep.data_modeling_taxi_dataset.fact_table AS f
JOIN 
    taxi-dep.data_modeling_taxi_dataset.datetime_dim AS d
ON 
    f.datetime_id = d.datetime_id
GROUP BY 
    hour_of_day
ORDER BY 
    hour_of_day;
  --Trip Distance Distribution
  SELECT 
    CASE 
        WHEN td.trip_distance <= 1 THEN '0-1 miles'
        WHEN td.trip_distance <= 5 THEN '1-5 miles'
        WHEN td.trip_distance <= 10 THEN '5-10 miles'
        ELSE '10+ miles'
    END AS distance_range,
    COUNT(f.trip_id) AS trip_count
FROM 
    taxi-dep.data_modeling_taxi_dataset.fact_table AS f
JOIN 
    taxi-dep.data_modeling_taxi_dataset.trip_distance_dim AS td
ON 
    f.trip_distance_id = td.trip_distance_id
GROUP BY 
    distance_range
ORDER BY 
    distance_range;
  -- Revenue by Dropoff Location
  SELECT 
    dl.dropoff_location_id,
    SUM(f.total_amount) AS total_revenue
FROM 
    taxi-dep.data_modeling_taxi_dataset.fact_table AS f
JOIN 
   taxi-dep.data_modeling_taxi_dataset.dropoff_location_dim AS dl
ON 
    f.dropoff_location_id = dl.dropoff_location_id
GROUP BY 
    dl.dropoff_location_id
ORDER BY 
    total_revenue DESC
LIMIT 10;
--Vendor Performance (Fare Amount vs. Tips)
SELECT 
    f.VendorID,
    SUM(f.fare_amount) AS total_fare,
    SUM(f.tip_amount) AS total_tips,
    SUM(f.tip_amount) / SUM(f.fare_amount) * 100 AS tip_percentage
FROM 
    taxi-dep.data_modeling_taxi_dataset.fact_table AS f
GROUP BY 
    f.VendorID
ORDER BY 
    total_tips DESC;






