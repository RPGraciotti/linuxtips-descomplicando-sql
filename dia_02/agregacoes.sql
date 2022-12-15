-- Databricks notebook source
SELECT
  COUNT(*) AS nrLinhasNaoNulas -- linhas não nulas
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas,
  -- linhas não nulas
  COUNT(idCliente) AS nrIdClienteNaoNulo,
  -- id de clientes não nulos
  COUNT(DISTINCT idCliente) AS nrIdeClientesDistintos 
  -- id de clientes distintos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas,
  -- linhas não nulas
  COUNT(idCliente) AS nrIdClienteNaoNulo,
  -- id de clientes não nulos
  COUNT(DISTINCT idCliente) AS nrIdeClientesDistintos,
  -- id de clientes distintos
  COUNT(DISTINCT idClienteUnico) AS nrIdClienteUnicoDistintos
  -- id de clientes unicos distintos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*),
  COUNT(DISTINCT idCliente) AS qtClientes,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicos
FROM
  silver_olist.cliente
WHERE
  descCidade IN ('presidente prudente', 'curitiba')

-- COMMAND ----------

SELECT
  AVG(vlPreco) AS avgPreco, -- media da coluna vlpreco = preço médio dos produtos
  PERCENTILE(vlPreco, 0.5) AS medianPreco, -- mediana do preco
  MAX(vlPreco) AS maxPreco, -- maximo
  MIN(vlPreco) AS minPreco, -- minimo
  AVG(vlFrete) AS avgFrete, 
  PERCENTILE(vlFrete, 0.5) AS medianFrete,
  MAX(vlFrete) AS maxFrete,
  MIN(vlFrete) AS minFrete
FROM
  silver_olist.item_pedido

-- COMMAND ----------

-- ROUND para arredondar as casas decimais
-- INT converte para integer
SELECT
  ROUND(AVG(vlPreco), 2) AS avgPreco, -- media da coluna vlpreco = preço médio dos produtos
  INT(PERCENTILE(vlPreco, 0.5)) AS medianPreco, -- mediana do preco
  MAX(vlPreco) AS maxPreco, -- maximo
  MIN(vlPreco) AS minPreco, -- minimo
  AVG(vlFrete) AS avgFrete, 
  PERCENTILE(vlFrete, 0.5) AS medianFrete,
  MAX(vlFrete) AS maxFrete,
  MIN(vlFrete) AS minFrete
FROM
  silver_olist.item_pedido

-- COMMAND ----------

SELECT
  COUNT(*)
FROM
  silver_olist.cliente
WHERE
  descUF = 'SP'
