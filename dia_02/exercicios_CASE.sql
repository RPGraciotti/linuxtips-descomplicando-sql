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

-- Case 02:
SELECT
  *,
  vlPreco + vlFrete AS vlTotal,
  vlFrete / (vlPreco + vlFrete) AS pctFrete,
  CASE
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.1 THEN '10%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% A 25%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN '25% a 50%'
    ELSE '+50%'
  END AS DescFretePct
FROM
  silver_olist.item_pedido
