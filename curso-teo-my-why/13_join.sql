SELECT *
FROM transacao_produto

INNER JOIN produtos
ON transacao_produto.IdProduto = produtos.IdProduto