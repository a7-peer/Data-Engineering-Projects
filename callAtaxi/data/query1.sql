select * from taxi-dep.taxi_dataset.taxi_table;
select DISTINCT count(*) from taxi-dep.taxi_dataset.taxi_table;
--creating a new table without pationed by
CREATE TABLE `taxi-dep.taxi_dataset.taxi_table_no_partition` AS
SELECT *
FROM `taxi-dep.taxi_dataset.taxi_table`;
--
CREATE TABLE `taxi-dep.taxi_dataset.taxi_table_with_ids`
PARTITION BY DATE(_PARTITIONTIME)  -- Preserve partitioning by _PARTITIONTIME
AS
SELECT 
    *,
    ROW_NUMBER() OVER (ORDER BY DATE(_PARTITIONTIME)) AS trip_id
FROM `taxi-dep.taxi_dataset.taxi_table`;

--adding id 
CREATE OR REPLACE TABLE `taxi-dep.taxi_dataset.taxi_table_with_trip_id`
AS
SELECT 
    *,
    ROW_NUMBER() OVER (order by tpep_pickup_datetime) AS trip_id 
FROM taxi-dep.taxi_dataset.taxi_table_no_partition;
