-- 12. Dentre os clientes de janeiro/2025, quantos assistiram o curso de SQL?
WITH tb_clientes_janeiro AS (
    SELECT *
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) >= '2025-01-01'
    AND substr(DtCriacao, 1, 10) < '2025-02-01'
),

tb_alunos_presentes AS (
    SELECT t1.IdCliente
    FROM transacoes AS t1

    LEFT JOIN tb_clientes_janeiro AS t2
    ON t1.IdCliente = t2.IdCliente 

    WHERE substr(t1.DtCriacao, 1,10) >= '2025-08-25'
    AND substr(t1.DtCriacao, 1,10) <= '2025-08-29'
),

tb_total_alunos AS (
    SELECT count(DISTINCT idCliente)
    FROM tb_alunos_presentes
)

SELECT *
FROM tb_total_alunos
