-- Qual o valor médio de pontos positivos por dia?

SELECT sum(qtdePontos) AS totalPontos,
       count(DISTINCT substr(DtCriacao,1,10)) AS diasUnicos,
       sum(qtdePontos) / count(DISTINCT substr(DtCriacao,1,10)) AS pontosDia 
FROM transacoes
WHERE qtdePontos > 0