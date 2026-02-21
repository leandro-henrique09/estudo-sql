--  11. Quem iniciou o curso no primeiro dia, em média assistiu quantas aulas?

WITH tb_prim_dia AS(
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(dtCriacao,1,10) = '2025-08-25'
),

tb_dias_curso AS (
    SELECT DISTINCT
           IdCliente,
           substr(DtCriacao,1,10) AS presente_dia
    FROM transacoes 
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    ORDER BY idCliente, presente_dia
),

tb_cliente_dias AS(

    SELECT t1.IdCliente,
        count(DISTINCT t2.presente_dia) AS qtdeDias
    FROM tb_prim_dia AS t1

    LEFT JOIN tb_dias_curso AS t2
    ON t1.idCliente = t2.idCliente

    GROUP BY t1.idCliente

)

SELECT avg(qtdeDias)
FROM tb_cliente_dias