-- Databricks notebook source
-- Exercicio 01: lista de pedidos com mais de um item
SELECT
  *
FROM
  silver_olist.item_pedido
WHERE 
  idPedidoItem > 1

-- COMMAND ----------

-- Exercicio 02: Lista de pedidos que o frete é mais caro que o item
SELECT
  *,
  vlFrete - vlPreco AS diffPreco
FROM
  silver_olist.item_pedido
WHERE
  vlFrete > vlPreco

-- COMMAND ----------

-- Exercicio 03: lista de pedidos que ainda não foram enviados
-- identificando as classes
SELECT
  descSituacao,
  COUNT(descSituacao)
FROM 
  silver_olist.pedido
GROUP BY 
  descSituacao

-- COMMAND ----------

-- solucao: selecionar todos que não sejam "delivered" ou "shipped", != signica "diferente de"
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao != 'delivered'
  AND descSituacao != 'shipped'

-- COMMAND ----------

-- conferindo solucao
SELECT
  descSituacao,
  COUNT(descSituacao)
FROM
  silver_olist.pedido
WHERE
  descSituacao != 'delivered'
  AND descSituacao != 'shipped'
GROUP BY
  descSituacao

-- COMMAND ----------

-- Exercicio 04: lista de pedidos que foram entregues com atraso
SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS diffPromessaEntrega
FROM
  silver_olist.pedido
WHERE
  DATEDIFF(dtEstimativaEntrega, dtEntregue) < 0


-- COMMAND ----------

-- Exercicio 05: lista de pedidos que foram entregues com 2 dias de antecedência
SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS diffPromessaEntrega
FROM
  silver_olist.pedido
WHERE
  DATEDIFF(dtEstimativaEntrega, dtEntregue) = 2

-- COMMAND ----------

-- Exercício 06: Lista de pedidos feitos em Dezembro de 2017 e entregues com atraso
SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS diffPromessaEntrega
FROM
  silver_olist.pedido
WHERE
  DATEDIFF(dtEstimativaEntrega, dtEntregue) < 0
  AND descSituacap = 'delivered'
  AND YEAR(dtPedido) = '2017'
  AND MONTH(dtPedido) = '12'

-- COMMAND ----------

-- Exercício 07: Lista de pedidos com avaliação maior ou igual que 4
SELECT
  *
FROM
  silver_olist.avaliacao_pedido
WHERE
  vlNota >= 4

-- COMMAND ----------

-- Exercício 08: Lista de pedidos com 2 ou mais parcelas menores que 20,00
SELECT
  *
FROM
  silver_olist.pagamento_pedido
WHERE
  nrPacelas >= 2
  AND vlPagamento < 20 -- está tudo certo, não tem pedido que cumpra essas condições
