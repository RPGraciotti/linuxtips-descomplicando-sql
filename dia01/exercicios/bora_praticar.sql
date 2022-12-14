-- Databricks notebook source
-- 01 Selecione todos os clientes paulistanos

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade = 'sao paulo'

-- COMMAND ----------

-- 02 Selecione todos os clientes paulistas
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descUF = 'SP'

-- COMMAND ----------

-- 03 selecione todos os vendedores cariocas
SELECT
  *
FROM
  silver_olist.vendedor
WHERE
  descCidade = 'rio de janeiro'
  OR descUF = 'sp'

-- COMMAND ----------

-- 04 Selecione todos os produtos de perfumaria e bebês com altura maior que 5 cm

SELECT *
FROM silver_olist.
