-- Databricks notebook source
SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY
  2 -- segunda coluna da consulta

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY
  qtClienteEstado -- NEM TODOS OS SGDB ACEITAM UTILIZAR A COLUNA QUE VOCÊ CRIOU

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY
  COUNT(DISTINCT idClienteUnico) -- menos propensa a erros

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY
  COUNT(DISTINCT idClienteUnico) DESC -- decrescente
LIMIT 1
