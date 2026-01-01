SELECT 
       sum(QtdePontos) AS TotalDePontos,

       sum( CASE
            WHEN qtdePontos > 0 THEN QtdePontos
            END) AS PontosPositivos,

       sum( CASE
            WHEN qtdePontos < 0 THEN QtdePontos  
            END) AS PontosNegativos,

        count(CASE
              WHEN qtdePontos < 0 THEN QtdePontos
              END) AS qtdeTransacoesNegativas  

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'    
