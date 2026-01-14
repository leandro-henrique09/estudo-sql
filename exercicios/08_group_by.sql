-- Qual o produto com mais pontos transacionados?

SELECT IdProduto,
       sum(vlProduto * QtdeProduto) AS qtdePontos,
       sum(QtdeProduto) AS qtdeVenda

FROM transacao_produto

GROUP BY IdProduto
ORDER BY sum(vlProduto) DESC