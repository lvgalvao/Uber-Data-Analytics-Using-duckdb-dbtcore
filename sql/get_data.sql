INSTALL httpfs;
LOAD httpfs;
CREATE TABLE uber_data AS SELECT * FROM read_csv_auto('s3://uber-data-analytics-2024-duckdb/raw/uber_data.csv');
SHOW uber_data;