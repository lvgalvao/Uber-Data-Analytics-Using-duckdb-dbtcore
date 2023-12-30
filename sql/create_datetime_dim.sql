-- Configurar acesso do S3

INSTALL httpfs;
LOAD httpfs;

-- Importa os dados do CSV para uma tabela temporária
CREATE TABLE temp_table AS
SELECT DISTINCT
    tpep_pickup_datetime,
    tpep_dropoff_datetime
FROM read_csv_auto('s3://uber-data-analytics-2024-duckdb/raw/uber_data.csv');

-- Cria a tabela datetime_dim a partir dos dados únicos da tabela temporária
CREATE TABLE datetime_dim AS
SELECT 
    ROW_NUMBER() OVER() AS datetime_id, -- Gera um ID sequencial
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
FROM temp_table;

-- Opcional: Excluir a tabela temporária após a criação da tabela datetime_dim
DROP TABLE temp_table;

-- Exibir nova tabela
SHOW datetime_dim;

-- Exibir quantidade de registros tabela
SELECT COUNT(*) FROM datetime_dim;

-- Exibir primeiros 100 registros
SELECT * FROM datetime_dim LIMIT 100;