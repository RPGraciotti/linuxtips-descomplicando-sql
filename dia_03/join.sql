-- Databricks notebook source
-- tabela fatos: pedidos
SELECT
  T1.*,
  T2.descUF -- selecione todas da T1 e selecione só a UF da T2
FROM
  silver_olist.pedido AS T1
  LEFT JOIN silver_olist.cliente AS T2 
  ON T1.idCliente = T2.idCliente -- pegar o idcliente da tabela 1 e fazer a correspondencia com a tabela 2

-- teste update
