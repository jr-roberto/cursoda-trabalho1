-- SELECT COUNT(*) FROM execucao_financeira;

-- SELECT * FROM execucao_financeira LIMIT 1000;

-- select distinct dsc_item_elemento from public.execucao_financeira ORDER BY dsc_item_elemento;

-- select distinct dsc_item_categoria from public.execucao_financeira;

-- -- SHOW COLUMNS FROM execucao_financeira;

-- CREATE SCHEMA teste;

-- SELECT DISTINCT codigo_orgao, dsc_orgao  FROM execucao_financeira;

-- SELECT DISTINCT codigo_orgao,dsc_orgao  FROM execucao_financeira ORDER BY codigo_orgao;

-- SELECT DISTINCT codigo_orgao,dsc_orgao  FROM execucao_financeira ORDER BY dsc_orgao;

-- SELECT
-- 	dsc_item_categoria,
-- 	count(*)
-- FROM



-- SELECT sigla, dsc_orgao
-- FROM execucao_financeira 
-- WHERE sigla LIKE '%CRS%' order by sigla
-- LIMIT 10;

-- SELECT DISTINCT sigla FROM execucao_financeira;

-- SELECT DISTINCT sigla, dsc_orgao FROM execucao_financeira ORDER BY sigla;

-- SELECT DISTINCT codigo_orgao, sigla FROM execucao_financeira ORDER BY sigla;

-- SELECT DISTINCT sigla, codigo_orgao FROM execucao_financeira ORDER BY sigla;


-- SELECT DISTINCT codigo_orgao FROM execucao_financeira; -- 925
-- SELECT DISTINCT sigla FROM execucao_financeira; -- 928

-- SELECT sigla, COUNT(*) as total FROM
-- (SELECT DISTINCT sigla, codigo_orgao FROM execucao_financeira) AS suquery
-- group by sigla;

-- SELECT DISTINCT sigla, codigo_orgao FROM execucao_financeira;


-- SELECT DISTINCT sigla, codigo_orgao FROM execucao_financeira;

-- SELECT DISTINCT dsc_orgao FROM execucao_financeira;

SELECT
	id,
	num_ano,
	codigo_orgao,
	sigla,
	dsc_orgao,
	dsc_item_elemento,
	dsc_item_categoria,
	vlr_empenho,
	valorpago,
	dth_empenho,
	dth_pagamento
FROM execucao_financeira LIMIT 10;
