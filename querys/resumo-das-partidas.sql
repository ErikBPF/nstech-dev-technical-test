
SELECT
    p.ID AS id_partida,
    p.rodada,
    p.data,
    p.hora,
    p.dia,
    p.mandante AS clube_mandante,
    p.visitante AS clube_visitante,
    p.mandante_placar AS gols_mandante,
    p.visitante_placar AS gols_visitante,
    (p.mandante_placar + p.visitante_placar) AS gols_totais,
    COUNT(c1.cartao) AS cartoes_mandante,
    COUNT(c2.cartao) AS cartoes_visitante,
    (COUNT(c1.cartao) + COUNT(c2.cartao)) AS cartoes_totais
FROM tb_partidas p
LEFT JOIN tb_cartoes c1 ON p.ID = c1.partida_id AND c1.clube = p.mandante
LEFT JOIN tb_cartoes c2 ON p.ID = c2.partida_id AND c2.clube = p.visitante
GROUP BY p.ID;
