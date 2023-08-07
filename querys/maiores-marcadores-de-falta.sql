
SELECT
    atleta AS Nome_do_Jogador,
    clube AS Time_do_Jogador,
    COUNT(cartao) AS Quantidade_de_cartoes_recebidos
FROM tb_cartoes
GROUP BY atleta, clube
ORDER BY COUNT(cartao) DESC;
