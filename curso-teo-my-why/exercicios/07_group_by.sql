-- Qual o produto mais transacionado?

SELECT IdProduto,
       sum(QtdeProduto) AS qtdeProdutos 

FROM transacao_produto

GROUP BY IdProduto
ORDER BY qtdeProdutos DESC
LIMIT 1