-- Databricks notebook source
-- Exercício 01: Selecione todos os pedidos e marque se houve atraso ou não
SELECT
  *
FROM
  silver_olist.pedido 
  CASE
    WHEN DATEDIFF(dtEstimativaEntrega, dtEntregue) < 0 THEN 'atraso'
  END AS 'Condição'

-- COMMAND ----------


