-- Databricks notebook source
-- Qual categoria tem produtos mais vendidos?
SELECT
  T1.idProduto,
  COUNT(*) -- contagem de linhas
FROM
  silver_olist.item_pedido AS T1 -- tabela de vendas
LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto
GROUP BY -- group by produto
  T1.idProduto
ORDER BY
  COUNT(*) DESC

-- COMMAND ----------

-- Qual categoria tem produtos mais vendidos?
SELECT
  T2.descCategoria, -- não é obrigatório se essa coluna só tiver em uma tabela, mas é uma boa prática deixar sempre explícito
  COUNT(*) -- contagem de linhas
FROM
  silver_olist.item_pedido AS T1 -- tabela de vendas
LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto
GROUP BY -- group by produto
  T2.descCategoria
ORDER BY
  COUNT(*) DESC

-- COMMAND ----------

-- Qual categoria tem produtos mais caros em média?
SELECT
  AVG(T1.vlPreco),
  T2.descCategoria
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.produto AS T2 ON T1.idProduto = T2.idProduto
GROUP BY T2.descCategoria
ORDER BY AVG(T1.vlPreco) DESC

-- COMMAND ----------

-- Os clientes de qual estado pagam mais frente?
SELECT
  T1.idPedido,
  T1.vlFrete,
  T2.idCliente,
  T3.descUF
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.pedido AS T2 ON T1.idPedido = T2.idPedido
  LEFT JOIN silver_olist.cliente AS T3 ON T2.idCliente = T3.idCliente

-- COMMAND ----------

-- Os clientes de qual estado pagam mais frente?
SELECT
  T3.descUF,
  AVG(T1.vlFrete)
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.pedido AS T2 ON T1.idPedido = T2.idPedido
  LEFT JOIN silver_olist.cliente AS T3 ON T2.idCliente = T3.idCliente
GROUP BY
  T3.descUF
ORDER BY
  AVG(T1.vlFrete) DESC

-- COMMAND ----------

-- usando having: fazendo um filtro de quem só tem acima de 40 reais
SELECT
  T3.descUF,
  AVG(T1.vlFrete) AS avgFrete
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.pedido AS T2 ON T1.idPedido = T2.idPedido
  LEFT JOIN silver_olist.cliente AS T3 ON T2.idCliente = T3.idCliente
GROUP BY
  T3.descUF
HAVING
  avgFrete > 40
ORDER BY
  avgFrete DESC
