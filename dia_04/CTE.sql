-- Databricks notebook source
-- Lista de vendedores que estão no estado com mais clientes
SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico)
FROM
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY
  COUNT(DISTINCT idClienteUnico) DESC
-- LIMIT 1

-- COMMAND ----------

SELECT 
  idVendedor
FROM
  silver_olist.vendedor
WHERE descUF  = 'SP'

-- COMMAND ----------

-- juntando as duas com subquery
SELECT
  idVendedor,
  descUF
FROM
  silver_olist.vendedor
WHERE
  descUF = (
    SELECT
      descUF
    FROM
      silver_olist.cliente
    GROUP BY
      descUF
    ORDER BY
      COUNT(DISTINCT idClienteUnico) DESC
    LIMIT 1 -- é importante usar porque primeiro você vai fazer a query que busca a lista, e como você precisa que seja só o estado que tem mais, esse resultado precisa ser só 1 linha
  )

-- COMMAND ----------

-- lista de vendedores que estão nos 2 estados com mais clientes
SELECT
  idVendedor,
  descUF
FROM
  silver_olist.vendedor
WHERE
  descUF IN (
    SELECT
      descUF
    FROM
      silver_olist.cliente
    GROUP BY
      descUF
    ORDER BY
      COUNT(DISTINCT idClienteUnico) DESC
    LIMIT
      2
  )

-- COMMAND ----------

-- mas tem uma forma melhor: WITH cria uma tabela temporaria
-- CTE: common table expression
WITH tb_estados AS (
  SELECT descUF
  FROM silver_olist.cliente
  GROUP BY descUF
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 2
),
tb_vendedores AS (
  SELECT idVendedor, descUF
  FROM silver_olist.vendedor
  WHERE descUF IN (SELECT descUF FROM tb_estados)
)

SELECT * 
FROM tb_vendedores

-- COMMAND ----------

-- nota média dos pedidos dos vendedores de cada estado

WITH tb_pedido_nota AS (
  SELECT T1.idVendedor,
         T2.vlNota
  FROM silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.avaliacao_pedido AS T2
    ON T1.idPedido = T2.idPedido
),

tb_avg_vendedor AS (
  SELECT idVendedor, 
         AVG(vlNOTA) AS avgNotaVendedor
  FROM tb_pedido_nota
  GROUP BY idVendedor
),

tb_vendedor_UF AS (
  SELECT T1.*,
         T2.descUF
  FROM tb_avg_vendedor AS T1
  LEFT JOIN silver_olist.vendedor AS T2
  ON T1.idVendedor = T2.idVendedor
)

SELECT descUF,
       AVG(avgNotaVendedor) AS avgNotaUF
FROM tb_vendedor_UF
GROUP BY descUF
ORDER BY avgNotaUF DESC
