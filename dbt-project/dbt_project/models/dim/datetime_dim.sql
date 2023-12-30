{{ config(materialized='table') }}

WITH raw_data AS (
    SELECT 
        tpep_pickup_datetime,
        tpep_dropoff_datetime
    FROM 's3://uber-data-analytics-2024-duckdb/raw/uber_data.csv' -- Atualize com o caminho do seu arquivo S3
    -- Certifique-se de que o DuckDB esteja configurado para acessar dados do S3
),

temp_table AS (
    SELECT DISTINCT
        tpep_pickup_datetime,
        tpep_dropoff_datetime
    FROM raw_data
),

datetime_dim AS (
    SELECT
        ROW_NUMBER() OVER() AS datetime_id,
        tpep_pickup_datetime,
        EXTRACT(hour FROM tpep_pickup_datetime) AS pick_hour,
        EXTRACT(day FROM tpep_pickup_datetime) AS pick_day,
        EXTRACT(month FROM tpep_pickup_datetime) AS pick_month,
        EXTRACT(year FROM tpep_pickup_datetime) AS pick_year,
        EXTRACT(dayofweek FROM tpep_pickup_datetime) AS pick_weekday,
        tpep_dropoff_datetime,
        EXTRACT(hour FROM tpep_dropoff_datetime) AS drop_hour,
        EXTRACT(day FROM tpep_dropoff_datetime) AS drop_day,
        EXTRACT(month FROM tpep_dropoff_datetime) AS drop_month,
        EXTRACT(year FROM tpep_dropoff_datetime) AS drop_year,
        EXTRACT(dayofweek FROM tpep_dropoff_datetime) AS drop_weekday
    FROM temp_table
)

SELECT * FROM datetime_dim
