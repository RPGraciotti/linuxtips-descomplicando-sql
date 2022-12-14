-- Databricks notebook source
SELECT
  *,
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'fluminense'
    WHEN descuF = 'PR' THEN 'paranaense'
    ELSE 'outros'
  END AS descNacionalidade
FROM
  silver_olist.cliente
  
  -- CASE WHEN é case sensitive

-- COMMAND ----------

SELECT
  *,
  -- uma coluna nova
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'fluminense'
    WHEN descuF = 'PR' THEN 'paranaense'
    ELSE 'outros'
  END AS descNacionalidade,
  -- outra coluna nova
  CASE 
    WHEN descCidade LIKE '%sao%' THEN 'Tem são no nome'
    ELSE 'Não tem são no nome'
  END AS descCidadeSAO
FROM
  silver_olist.cliente
  
  -- CASE WHEN é case sensitive

-- COMMAND ----------

SELECT
  *,
  CASE
    WHEN descUF IN ('SP', 'MG', 'RJ', 'ES') THEN 'Sudeste'
  END AS descRegiao
FROM
  silver_olist.cliente
