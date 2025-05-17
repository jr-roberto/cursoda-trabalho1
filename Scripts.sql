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

-- GERANDO ODS
-- INICIA AQUI
CREATE SCHEMA ods;
DROP TABLE IF EXISTS ods.base;
CREATE TABLE ods.base AS
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
FROM public.execucao_financeira;

-- TRATAMENTO DE DADOS

-- DADOS UNICOS DE CATEGORIA
SELECT DISTINCT dsc_item_categoria FROM ods.base;

-- CRIANDO UMA TABELA AUXILIAR QUE VAI FAZER UM DE PARA
CREATE TABLE ods.categoria_de_para (
	como_esta varchar(100),
	como_fica varchar(100)
)

-- POPULANDO TABELA DE PARA NO CAMPO 'como_esta'
INSERT INTO ods.categoria_de_para (como_esta)
SELECT DISTINCT dsc_item_categoria FROM ods.base;

-- POPULANDO TABELA DE PARA NO CAMPO 'como_fica' DESPESA DE CAPITAL **VERIFICAR DADOS MANUAL**
UPDATE ods.categoria_de_para
SET como_fica = 'DESPESA DE CAPITAL'
WHERE como_esta IN ('DESPESA DE CAPITAL','DESPESAS DE CAPITAL');

-- POPULANDO TABELA DE PARA NO CAMPO 'como_fica' DESPESA CORRENTE **VERIFICAR DADOS MANUAL**
UPDATE ods.categoria_de_para
SET como_fica = 'DESPESA CORRENTE'
WHERE como_esta IN ('DESPESA CORRENTE','DESPESAS CORRENTES');




-- SELECT BASE TRATADA
SELECT
	b.id,
	b.num_ano,
	b.codigo_orgao,
	b.sigla,
	b.dsc_orgao,
	b.dsc_item_elemento,
	ba.como_fica AS categoria, -- CATEGORIA TRATADA
	b.vlr_empenho,
	b.valorpago,
	b.dth_empenho,
	b.dth_pagamento
	FROM ods.base AS b
	LEFT JOIN ods.categoria_de_para AS ba ON ba.como_esta = b.dsc_item_categoria GROUP BY ba.como_fica LIMIT 10;
	

-- FIM
