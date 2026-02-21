-- Qual cliente juntou mais pontos positivos em 2025-05?

SELECT idCliente,
       qtdePontos

FROM clientes

WHERE DtCriacao >= '2025-05-01'
AND DtCriacao < '2025-06-01' 
AND QtdePontos > 0

GROUP BY idCliente

ORDER BY sum(qtdePontos) DESC
