-- Databricks notebook source
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao = 'delivered' 
LIMIT
  100
  
-- leia-se: selecione 100 linhas de todas as colunas da tabela silver onde a situação do pedido seja "delivered"

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao = 'delivered'
  AND year(dtPedido) = '2018'
--LIMIT
 -- 100 
-- leia-se: selecione 100 linhas de todas as colunas da tabela silver onde a situação do pedido seja "delivered" em 2018

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  (
    descSituacao = 'shipped'
    OR descSituacao = 'canceled'
  )
  AND year(dtPedido) = '2018' --LIMIT
  -- 100
  -- leia-se: selecione 100 linhas de todas as colunas da tabela silver onde a situação do pedido seja "shipped" OU "canceled" em 2018

-- COMMAND ----------

SELECT
  *,
  datediff(dtEstimativaEntrega, dtAprovado) AS diffDatasAprovadoPrevisao
FROM
  silver_olist.pedido
WHERE
  descSituacao IN ('shipped', 'canceled')
  AND year(dtPedido) = '2018'
  AND datediff(dtEstimativaEntrega, dtAprovado) > 30 -- selecione todas as colunas a partir da tabela pedido aonde o pedido esteja em situação shiped ou canceled e a data seja em 2018 e a diferença entre a estimativa de entrega e a data de aprovação seja maior que 30 dias
