/* Query em ordem decrescente referente aos maiores artilheiros, seu clube e sua respectivas quantidades de gols contadas*/
SELECT atleta, clube, COUNT(*) as quantidade_gols FROM gols
GROUP BY atleta, clube
HAVING COUNT(*) > 1
ORDER BY quantidade_gols DESC;

/*Fiz uma tabela referente a consulta com 'SELECT INTO', o nome da mesma é maiores_artilheiros*/
SELECT atleta as nome_jogador, clube as time_jogador, COUNT(*) as quantidade_gols 
INTO maiores_artilheiros
FROM gols
GROUP BY atleta, clube
HAVING COUNT(*) > 1
ORDER BY quantidade_gols DESC;
