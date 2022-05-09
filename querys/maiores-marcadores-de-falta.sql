/* Query em ordem decrescente referente aos jogadores com cartões, seu clube e sua respectivas quantidades de cartões contados */
SELECT atleta, clube, COUNT(*) as quantidade_cartoes FROM cartoes
GROUP BY atleta, clube
HAVING COUNT(*) > 1
ORDER BY quantidade_cartoes DESC;

/* Fiz uma tabela referente a consulta com 'SELECT INTO', o nome da mesma é maiores_marcadores_faltas */
SELECT atleta, clube, COUNT(*) as quantidade_cartoes 
INTO maiores_marcadores_faltas
FROM cartoes
GROUP BY atleta, clube
HAVING COUNT(*) > 1
ORDER BY quantidade_cartoes DESC;