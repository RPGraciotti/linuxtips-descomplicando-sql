-- Databricks notebook source
-- * = selecione tudo
-- from = de onde
-- . vem do formato recursivo

-- COMMAND ----------

SELECT * FROM silver_olist.pedido
-- leia-se selecione TUDO da tabela silver_olist.pedido

-- COMMAND ----------

SELECT
  idPedido
FROM
  silver_olist.pedido -- leia-se: selecione a coluna idPedido da tabela silver_olist.pedido

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao
FROM
  silver_olist.pedido -- leia-se: selecione as colunas idPedido e descSituacao da tabela silver_olist.pedido

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao
FROM
  silver_olist.pedido
LIMIT
  5 
  -- leia-se: selecione as 5 primeiras linhas das colunas idPedido e descSituacao da tabela silver_olist.pedido
  -- LIMIT não necessariamente é na ordem

-- COMMAND ----------

SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega
FROM
  silver_olist.pedido
  
LIMIT 5
  
-- leia-se : estime a diferença entre a data de estimativa de entrega e data de entrega real e renomeie essa coluna a ser adicionada
-- AS para renomear é opcional, mas é importante colocar 
