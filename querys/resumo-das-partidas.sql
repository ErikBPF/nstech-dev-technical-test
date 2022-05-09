/*
Primeira query para análise - resumo das partidas:
(Id da partida, Rodada, Data da partida, Hora da Partida, Dia da Semana, Clube mandante, 
Clube visitante, Quantidade de gols do clube mandante, Quantidade de gols do clube visitante,
Quantidade de gols totais, Quantidade de cartões recebidos pelo clube mandante, 
Quantidade de cartões recebidos pelo clube visitante, Quantidade de cartões recebidos totais)
*/

/*Análise dos gols para mandante e visitantes, além dos gols totais */

/* Uso do 'SELECT INTO' para criar tabela com qtd de gols'*/
SELECT partida_id, clube, COUNT(*) as quantidade_gols
INTO qtd_gols
FROM gols
GROUP BY partida_id, clube
HAVING COUNT(*) > 1
ORDER BY partida_id ASC;
/*Total de gols*/
SELECT SUM(quantidade_gols)
FROM qtd_gols;

/* Uso do 'SELECT INTO' para criar tabela com qtd de cartões*/
SELECT partida_id, clube, COUNT(*) as quantidade_cartoes
INTO qtd_cartoes
FROM cartoes
GROUP BY partida_id, clube
HAVING COUNT(*) > 1
ORDER BY partida_id ASC;
/*Total de cartões*/
SELECT SUM(quantidade_cartoes)
FROM qtd_cartoes;

/*
O comando 'LEFT JOIN' é usado para união dos dados das três tabelas (partidas, qtd_cartoes, qtd_gols)com base na partida_id e
se o clube é visitante ou mandante.
*/

/*Foram criadas duas tabelas referentes aos clubes mandantes e visitantes*/
SELECT partidas.id, partidas.rodada, partidas.data, partidas.hora, partidas.dia, partidas.mandante, partidas.visitante,
qtd_gols.quantidade_gols as gols_mandante,
qtd_cartoes.quantidade_cartoes as cartoes_mandante
INTO tabela_mandante
FROM partidas
LEFT JOIN qtd_gols ON
partidas.id = qtd_gols.partida_id AND partidas.mandante = qtd_gols.clube
LEFT JOIN qtd_cartoes ON
partidas.id = qtd_cartoes.partida_id AND partidas.mandante = qtd_cartoes.clube
ORDER BY partidas.id ASC;

SELECT partidas.id, partidas.rodada, partidas.data, partidas.hora, partidas.dia, partidas.mandante, partidas.visitante,
qtd_gols.quantidade_gols as gols_visitante, 
qtd_cartoes.quantidade_cartoes as cartoes_visitante
INTO tabela_visitante
FROM partidas
LEFT JOIN qtd_gols ON
partidas.id = qtd_gols.partida_id AND partidas.visitante = qtd_gols.clube
LEFT JOIN qtd_cartoes ON
partidas.id = qtd_cartoes.partida_id AND partidas.visitante = qtd_cartoes.clube
ORDER BY partidas.id ASC;

/*Por fim, faz-se a query de resumo das partidas*/
SELECT tabela_mandante.id, tabela_mandante.rodada, tabela_mandante.data, tabela_mandante.hora, tabela_mandante.dia, tabela_mandante.mandante, tabela_mandante.visitante,
tabela_mandante.gols_mandante, tabela_mandante.cartoes_mandante,
tabela_visitante.gols_visitante, tabela_visitante.cartoes_visitanteITON resumo_partidas
FROM tabela_mandante, tabela_visitante;





