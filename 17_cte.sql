-- CTE - Commom tables expression

WITH tb_cliente_primeiro_dia AS (
    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_cliente_ultimo_dia AS (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'
),

tb_join AS (
    SELECT t1.idCliente AS clientesPrimeiroDia,
           t2.idCliente AS clientesUltimoDia

    FROM tb_cliente_primeiro_dia AS t1

    LEFT JOIN tb_cliente_ultimo_dia AS t2
    ON t1.IdCliente = t2.IdCliente
) 

SELECT count(clientesPrimeiroDia),
       count(clientesUltimoDia),
       1. * count(clientesUltimoDia) / count(clientesPrimeiroDia)
        
FROM tb_join


