SELECT *
FROM tb_atendimento obj
LEFT JOIN tb_procedimento procedimento ON (obj.id = procedimento.fk_atendimento AND procedimento.registro_ativo=1)
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

