-- Prepara a tabela de faixas salariais usada no JOIN do queries.sql.
-- Pode ser rodado mais de uma vez: apaga a tabela antiga antes de recriar.

DROP TABLE IF EXISTS faixa_salarial;

CREATE TABLE faixa_salarial (
  faixa_min INTEGER,
  faixa_max INTEGER,
  rotulo TEXT
);

INSERT INTO faixa_salarial VALUES
  (0, 3000, 'Baixa'),
  (3001, 8000, 'Media'),
  (8001, 20000, 'Alta');