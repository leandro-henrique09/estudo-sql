-- Qual categoria tem mais produtos vendidos?

-- minha resposta.
SELECT t1.DescCategoriaProduto,
       sum(t2.QtdeProduto) AS somaProdutos 
FROM produtos AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY t1.DescCategoriaProduto

ORDER BY somaProdutos DESC
LIMIT 1

-- resposta dada no vídeo
SELECT t2.DescCategoriaProduto,
       count(DISTINCT t1.IdTransacao)

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto