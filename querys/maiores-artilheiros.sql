
SELECT
    atleta AS Nome_do_Jogador,
    clube AS Time_do_Jogador,
    COUNT(atleta) AS Quantidade_de_gols_marcados
FROM tb_gols
GROUP BY atleta, clube
ORDER BY COUNT(atleta) DESC;
