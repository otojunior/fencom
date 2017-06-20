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
		x.digitados,
		x.espelhados,
		x.glosados,
		x.faturados,
		x.pagos,
		x.repassados,
		x.excluidos,
		x.pendentes,
		x.inconsistentes,
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
		x.contaGlosa,
		x.repassadosEspelhados,
		x.valorEspelhosPagos,
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
	(
		SELECT 
			procedimento.id, 
			SUM(case when atendimentoTemporario.fk_espelho IS NULL THEN procedimento.valor_total ELSE 0 END) digitados,
			SUM(case when (
				pagProcedimento.fk_procedimento IS NOT NULL AND 
				pagProcedimento.fk_fatura IS NULL AND 
				pagamentoEspelho.id IS NULL
			) THEN pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto ELSE 0 END) espelhados,
			SUM(case when (
				glosa.fk_procedimento IS NOT NULL AND 
				ISNULL(glosa.situacao,0) NOT IN (4,5,6)
			) THEN glosa.valor_honorario+glosa.valor_acrescimo+glosa.valor_custo_operacional+glosa.valor_filme-glosa.valor_desconto ELSE 0 END) glosados,
			SUM(case when (
				pagProcedimento.fk_procedimento IS NOT NULL AND 
				pagProcedimento.fk_fatura IS NOT NULL AND 
				(pagFatura.id IS NULL OR pagFatura.registro_ativo = 0)
			) THEN pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto ELSE 0 END) faturados,
			SUM(case when (
				pagProcedimento.fk_procedimento IS NOT NULL AND 
				pagProcedimento.fk_fatura IS NOT NULL AND 
				pagFatura.fk_fatura IS NOT NULL AND 
				pagFatura.fk_repasse IS NULL
			) THEN pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto ELSE 0 END) pagos, --****
			SUM(case when (
				pagProcedimento.fk_procedimento IS NOT NULL AND 
				pagamentoEspelho.fk_espelho IS NOT NULL AND 
				pagProcedimento.fk_fatura IS NULL AND 
				pagamentoEspelho.fk_repasse IS NULL
			) THEN pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto ELSE 0 END) valorEspelhosPagos,
			SUM(case when (
				pagProcedimento.fk_procedimento IS NOT NULL AND 
				pagProcedimento.fk_fatura IS NOT NULL AND 
				repasse.id IS NOT NULL AND
				pagFatura.fk_repasse IS NOT NULL
			) THEN pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto ELSE 0 END) repassados,
			SUM(case when (
				pagProcedimento.fk_procedimento IS NOT NULL AND
				pagamentoEspelho.fk_espelho IS NOT NULL AND
				pagamentoEspelho.fk_repasse IS NOT NULL
			) THEN pagProcedimento.valor_custo_operacional+pagProcedimento.valor_honorario+pagProcedimento.valor_acrescimo-pagProcedimento.valor_desconto ELSE 0 END) repassadosEspelhados,
			SUM(case when atendimentoTemporario.situacaoAtendimento = 6 THEN atendimentoTemporario.valor_total_atendimento ELSE 0 END) excluidos,
			SUM(case when pendencia.fk_atendimento IS NOT NULL THEN atendimentoTemporario.valor_total_atendimento ELSE 0 END) pendentes,
			SUM(case when inconsistencia.fk_atendimento IS NOT NULL THEN atendimentoTemporario.valor_total_atendimento ELSE 0 END) inconsistentes,
			COUNT(case when atendimentoTemporario.fk_importacao_unimed IS NOT NULL THEN glosa.id END) contaGlosa
		FROM tb_atendimento atendimentoTemporario
		JOIN tb_procedimento procedimento ON procedimento.fk_atendimento = atendimentoTemporario.id
		JOIN rl_entidade_convenio entidadeConvenioTemp ON entidadeConvenioTemp.id=atendimentoTemporario.fk_convenio	
		LEFT JOIN tb_espelho espelho ON atendimentoTemporario.fk_espelho = espelho.id
		LEFT JOIN tb_pagamento_procedimento pagProcedimento ON pagProcedimento.fk_procedimento = procedimento.id
		LEFT JOIN tb_pagamento_espelho pagamentoEspelho ON pagamentoEspelho.fk_espelho = atendimentoTemporario.fk_espelho
		LEFT JOIN tb_glosa glosa ON glosa.fk_procedimento = procedimento.id
		LEFT JOIN tb_fatura fatura ON pagProcedimento.fk_fatura = fatura.id
		LEFT JOIN tb_pagamento_fatura pagFatura ON pagFatura.fk_fatura = fatura.id
		LEFT JOIN tb_repasse repasse ON repasse.id = pagFatura.fk_repasse
		LEFT JOIN tb_repasse repasse_esp ON repasse_esp.id = pagamentoEspelho.fk_repasse
		LEFT JOIN rl_atendimento_tipo_pendencia pendencia ON pendencia.fk_atendimento = atendimentoTemporario.id
		LEFT JOIN rl_atendimento_inconsistencia inconsistencia ON inconsistencia.fk_atendimento = atendimentoTemporario.id
		WHERE
			atendimentoTemporario.situacaoAtendimento=0
			AND atendimentoTemporario.registro_ativo = 1
			AND entidadeConvenioTemp.registro_ativo = 1
			AND entidadeConvenioTemp.fk_entidade = 2
			AND espelho.registro_ativo = 1
			AND fatura.registro_ativo = 1
			AND glosa.registro_ativo = 1
			AND inconsistencia.registro_ativo = 1
			AND pagamentoEspelho.registro_ativo=1
			AND pagFatura.registro_ativo = 1
			AND pagProcedimento.registro_ativo = 1
			AND pendencia.registro_ativo = 1
			AND procedimento.registro_ativo = 1
			AND repasse.registro_ativo = 1
			AND repasse_esp.registro_ativo = 1
		GROUP BY procedimento.id
	) x ON procedimento.id = x.id
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