WITH tabelaTemp AS
  (
	SELECT procedimento.id,
		obj.ano_atendimento,
		obj.numero_atendimento_automatico,
		obj.paciente,
		hospital.sigla AS hostialSigla,
		convenio.sigla AS convenioSigla,
		obj.plano,
		obj.guia_principal,
		obj.data_cadastro,
		obj.data_alta,
		obj.data_entrega,
		obj.guia_solicitacao_internacao,
		obj.situacaoAtendimento,
		obj.valor_total_atendimento,
		espelho.numero_espelho,
		complemento.descricao descComp,
		procedimento.data_inicio,
		procedimento.data_fim,
		procedimento.data_realizacao,
		itemDespesa.codigo,
		itemDespesa.descricao,
		obj.matricula_paciente,
		obj.senha,
		obj.numero_guia,
		cooperadoExecutante.nome,
		cooperadoRecebedorCobranca.nome AS cooperadoRecebedor,
		procedimento.valor_total,
		digitadosTab.digitados,
		espelhadosTab.espelhados,
		glosadosTab.glosados,
		faturadosTab.faturados,
		pagosTab.pagos,
		repassadosTab.repassados,
		excluidosTab.excluidos,
		pendenteTab.pendentes,
		inconsistenciaTab.inconsistentes,
		obj.id AS idatendimento,
		procedimento.pk_importacao,
		especialidade.descricao AS descricaoEspecialidade,
		procedimento.quantidade_CH,
		procedimento.valor_CH,
		procedimento.valor_honorario,
		procedimento.valor_custo_operacional,
		concatenado.campo AS repasse,
		motivoGlosaConcatenado.campo AS motivoGlosa,
		acomodacao.descricao AS acomodacao,
		grauParticipacao.descricao AS descricaoGrauParticipacao,
		tipoGuia.descricao AS tipoGuia,
		faturaConcatenado.campo AS faturas,
		glosadoUnimed.contaGlosa,
		espelhosPagosRepassadosTab.repassadosEspelhados,
		espelhosPagos.valorEspelhosPagos,
		procedimento.valor_desconto,
		procedimento.valor_acrescimo_convenio,
		(SELECT top 1 id FROM rl_atendimento_inconsistencia WHERE registro_ativo=1 AND fk_atendimento=obj.id) AS idInconsistencia,
		(SELECT top 1 id FROM rl_atendimento_tipo_pendencia	WHERE registro_ativo=1 AND fk_atendimento=obj.id) AS idPendencia,
		ROW_NUMBER() OVER (ORDER BY obj.ano_atendimento DESC, obj.numero_atendimento_automatico DESC) AS numeroColuna
FROM tb_atendimento obj
INNER JOIN rl_entidade_convenio entidadeConvenio ON (entidadeConvenio.id = obj.fk_convenio AND entidadeConvenio.ativo = 1)
INNER JOIN tb_convenio AS convenio ON (entidadeConvenio.fk_convenio = convenio.id AND convenio.registro_ativo = 1)
LEFT JOIN tb_hospital hospital ON (hospital.id = obj.fk_hospital AND hospital.registro_ativo = 1)
LEFT JOIN tb_espelho espelho ON (espelho.id = obj.fk_espelho AND espelho.registro_ativo = 1)
LEFT JOIN rl_entidadeconvenio_complemento complemento ON (complemento.id = obj.fk_complemento AND complemento.registro_ativo = 1)
LEFT JOIN tb_procedimento procedimento ON (obj.id = procedimento.fk_atendimento AND procedimento.registro_ativo=1)
LEFT JOIN tb_item_despesa itemDespesa ON (itemDespesa.id = procedimento.fk_item_despesa)
LEFT JOIN tb_cooperado cooperadoExecutante ON (procedimento.fk_cooperado_executante_complemento = cooperadoExecutante.id)
LEFT JOIN tb_cooperado cooperadoRecebedorCobranca ON (procedimento.fk_cooperado_recebedor_cobranca = cooperadoRecebedorCobranca.id)
LEFT JOIN rl_entidadecooperado_especialidade entidadeCooperadoEspecialidade ON (procedimento.fk_entidade_cooperado_especialidade = entidadeCooperadoEspecialidade.id)
LEFT JOIN tb_tabela_tiss especialidade ON (especialidade.id = entidadeCooperadoEspecialidade.fk_especialidade)
LEFT JOIN tb_tabela_tiss acomodacao ON (acomodacao.id = procedimento.fk_acomodacao AND acomodacao.registro_ativo = 1)
LEFT JOIN rl_entidade_grau_participacao entidadeGrauParticipacao ON (entidadeGrauParticipacao.id = procedimento.fk_grau_participacao AND entidadeGrauParticipacao.registro_ativo = 1)
LEFT JOIN tb_tabela_tiss grauParticipacao ON (grauParticipacao.id = entidadeGrauParticipacao.fk_grau_participacao AND grauParticipacao.registro_ativo = 1)
LEFT JOIN tb_tabela_tiss tipoGuia ON (tipoGuia.id = procedimento.fk_tipo_guia AND tipoGuia.registro_ativo = 1)
LEFT JOIN rl_atendimento_tipo_pendencia pendencia ON (pendencia.fk_atendimento = obj.id AND pendencia.registro_ativo = 1)
LEFT JOIN
	(SELECT procedimento.id, sum(procedimento.valor_total) digitados
		FROM tb_atendimento atendimentoTemporario
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		WHERE (atendimentoTemporario.fk_espelho IS NULL)
			AND atendimentoTemporario.situacaoAtendimento=0
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND procedimento.registro_ativo = 1
		GROUP BY procedimento.id) digitadosTab ON procedimento.id = digitadosTab.id
LEFT JOIN
	(SELECT procedimento.id, sum(pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto) espelhados
		FROM tb_atendimento atendimentoTemporario
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_espelho espelho ON atendimentoTemporario.fk_espelho = espelho.id
		JOIN tb_pagamento_procedimento pagProcedimento ON pagProcedimento.fk_procedimento = procedimento.id
		LEFT JOIN tb_pagamento_espelho pagamentoEspelho ON (pagamentoEspelho.fk_espelho = atendimentoTemporario.fk_espelho AND pagamentoEspelho.registro_ativo=1)
		WHERE (pagProcedimento.fk_fatura IS NULL)
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND procedimento.registro_ativo = 1
			AND pagProcedimento.registro_ativo = 1
			AND espelho.registro_ativo = 1
			AND pagamentoEspelho.id IS NULL
		GROUP BY procedimento.id) espelhadosTab ON procedimento.id = espelhadosTab.id
LEFT JOIN
	(SELECT SUM(glosa.valor_honorario+glosa.valor_acrescimo+glosa.valor_custo_operacional+glosa.valor_filme-glosa.valor_desconto) glosados,	procedimento.id
		FROM tb_atendimento atendimentoTemporario
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio		AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN tb_glosa glosa ON glosa.fk_procedimento = procedimento.id
		WHERE ISNULL(glosa.situacao,0) NOT IN (4,5,6)
			AND glosa.registro_ativo = 1
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND procedimento.registro_ativo = 1
		GROUP BY procedimento.id) glosadosTab ON procedimento.id = glosadosTab.id
LEFT JOIN
	(SELECT sum(pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto) faturados, procedimento.id
		FROM tb_atendimento atendimentoTemporario
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_pagamento_procedimento pagProcedimento ON pagProcedimento.fk_procedimento = procedimento.id
		JOIN tb_fatura fatura ON pagProcedimento.fk_fatura = fatura.id
		LEFT JOIN tb_pagamento_fatura pagFatura ON pagFatura.fk_fatura = fatura.id
		WHERE (pagFatura.id IS NULL	OR pagFatura.registro_ativo = 0)
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND procedimento.registro_ativo = 1
			AND pagProcedimento.registro_ativo = 1
			AND fatura.registro_ativo = 1
		GROUP BY procedimento.id) faturadosTab ON procedimento.id = faturadosTab.id
LEFT JOIN
	(SELECT sum(pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto) pagos, procedimento.id
		FROM tb_atendimento atendimentoTemporario
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_pagamento_procedimento pagProcedimento ON pagProcedimento.fk_procedimento = procedimento.id
		JOIN tb_fatura fatura ON pagProcedimento.fk_fatura = fatura.id
		JOIN tb_pagamento_fatura pagFatura ON pagFatura.fk_fatura = fatura.id
		WHERE procedimento.registro_ativo = 1
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND pagProcedimento.registro_ativo = 1
			AND fatura.registro_ativo = 1
			AND pagFatura.registro_ativo = 1
			AND pagFatura.fk_repasse IS NULL
		GROUP BY procedimento.id) pagosTab ON procedimento.id = pagosTab.id
LEFT JOIN
	(SELECT sum(pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto) valorEspelhosPagos,	procedimento.id
		FROM tb_atendimento atendimentoTemporario
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_pagamento_procedimento pagProcedimento ON pagProcedimento.fk_procedimento = procedimento.id
		JOIN tb_pagamento_espelho pagamentoEspelho ON pagamentoEspelho.fk_espelho = atendimentoTemporario.fk_espelho
		WHERE procedimento.registro_ativo = 1
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND pagProcedimento.registro_ativo = 1
			AND pagProcedimento.fk_fatura IS NULL
			AND pagamentoEspelho.registro_ativo = 1
			AND pagamentoEspelho.fk_repasse IS NULL
		GROUP BY procedimento.id) espelhosPagos ON procedimento.id = espelhosPagos.id
LEFT JOIN
	(SELECT sum(pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto) repassados, procedimento.id
		FROM tb_atendimento atendimentoTemporario
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN tb_pagamento_procedimento pagProcedimento ON pagProcedimento.fk_procedimento = procedimento.id
		JOIN tb_fatura fatura ON pagProcedimento.fk_fatura = fatura.id
		JOIN tb_pagamento_fatura pagFatura ON pagFatura.fk_fatura = fatura.id
		JOIN tb_repasse repasse ON repasse.id = pagFatura.fk_repasse
		WHERE procedimento.registro_ativo = 1
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND pagProcedimento.registro_ativo = 1
			AND fatura.registro_ativo = 1
			AND pagFatura.registro_ativo = 1
			AND repasse.registro_ativo = 1
		GROUP BY procedimento.id) repassadosTab ON procedimento.id = repassadosTab.id
LEFT JOIN
	(SELECT sum(pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto) repassadosEspelhados, procedimento.id
		FROM tb_atendimento atendimentoTemporario 
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN tb_pagamento_procedimento pagProcedimento ON pagProcedimento.fk_procedimento = procedimento.id
		JOIN tb_pagamento_espelho pagEspelho ON pagEspelho.fk_espelho = atendimentoTemporario.fk_espelho
		JOIN tb_repasse repasse ON repasse.id = pagEspelho.fk_repasse
		WHERE procedimento.registro_ativo = 1
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND pagProcedimento.registro_ativo = 1
			AND pagEspelho.registro_ativo = 1
			AND repasse.registro_ativo = 1
		GROUP BY procedimento.id) espelhosPagosRepassadosTab ON procedimento.id = espelhosPagosRepassadosTab.id
LEFT JOIN
	(SELECT sum(atendimentoTemporario.valor_total_atendimento) excluidos, atendimentoTemporario.id
		FROM tb_atendimento atendimentoTemporario
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		WHERE atendimentoTemporario.situacaoAtendimento = 6
			AND entidadeConvenioTemp.fk_entidade= 2
			AND procedimento.registro_ativo = 1
			AND atendimentoTemporario.registro_ativo = 1
		GROUP BY atendimentoTemporario.id) excluidosTab ON obj.id = excluidosTab.id
LEFT JOIN
	(SELECT sum(atendimentoTemporario.valor_total_atendimento) pendentes, atendimentoTemporario.id pendenteId
		FROM tb_atendimento atendimentoTemporario
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN rl_atendimento_tipo_pendencia pendencia ON pendencia.fk_atendimento = atendimentoTemporario.id
		WHERE entidadeConvenioTemp.fk_entidade= 2 
			AND atendimentoTemporario.registro_ativo = 1
			AND pendencia.registro_ativo = 1
		GROUP BY atendimentoTemporario.id) pendenteTab ON obj.id = pendenteTab.pendenteId
LEFT JOIN
	(SELECT sum(atendimentoTemporario.valor_total_atendimento) inconsistentes, atendimentoTemporario.id inconsistenteId
		FROM tb_atendimento atendimentoTemporario
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	AND entidadeConvenioTemp.registro_ativo=1
		JOIN rl_atendimento_inconsistencia inconsistencia ON inconsistencia.fk_atendimento = atendimentoTemporario.id
		WHERE entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND inconsistencia.registro_ativo = 1
		GROUP BY atendimentoTemporario.id) inconsistenciaTab ON obj.id = inconsistenciaTab.inconsistenteId
LEFT JOIN
	(SELECT procedimento.id, count(glosa.id) AS contaGlosa
		FROM tb_atendimento atendimentoTemporario
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio
		AND entidadeConvenioTemp.registro_ativo=1
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN tb_glosa glosa ON glosa.fk_procedimento = procedimento.id
		WHERE glosa.registro_ativo = 1
			AND entidadeConvenioTemp.fk_entidade= 2
			AND atendimentoTemporario.registro_ativo = 1
			AND procedimento.registro_ativo = 1
			AND atendimentoTemporario.fk_importacao_unimed IS NOT NULL
	GROUP BY procedimento.id) glosadoUnimed ON procedimento.id = glosadoUnimed.id 
CROSS apply dbo.retornaRepasseConcatenato(procedimento.id) AS concatenado 
CROSS apply dbo.retornaMotivoGlosa(procedimento.id) AS motivoGlosaConcatenado 
CROSS apply retornaFaturaConcatenado(procedimento.id) faturaConcatenado
WHERE entidadeConvenio.fk_entidade = 16
    AND obj.registro_ativo = 1
    AND obj.autorizado_unimed = 1
    AND obj.situacaoatendimento <> 6
)
SELECT tabelaTemp.*,
       tabelaTemp.numeroColuna AS numb
FROM tabelaTemp
WHERE tabelaTemp.numeroColuna BETWEEN 1 AND 20