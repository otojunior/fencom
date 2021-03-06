USE [master]
GO
/****** Object:  Database [sasc]    Script Date: 16/06/2017 11:02:35 ******/
CREATE DATABASE [sasc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sasc_producao', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sasc.mdf' , SIZE = 11493376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sasc_producao_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sasc_log.ldf' , SIZE = 17592896KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sasc] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sasc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sasc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sasc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sasc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sasc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sasc] SET ARITHABORT OFF 
GO
ALTER DATABASE [sasc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sasc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sasc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sasc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sasc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sasc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sasc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sasc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sasc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sasc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sasc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sasc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sasc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sasc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sasc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sasc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sasc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sasc] SET RECOVERY BULK_LOGGED 
GO
ALTER DATABASE [sasc] SET  MULTI_USER 
GO
ALTER DATABASE [sasc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sasc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sasc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sasc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sasc] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sasc]
GO
/****** Object:  User [sasc]    Script Date: 16/06/2017 11:02:35 ******/
CREATE USER [sasc] FOR LOGIN [sasc] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sasc]
GO
/****** Object:  Table [dbo].[atendimento_data_alta_temp]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atendimento_data_alta_temp](
	[fk_entidade_temp] [bigint] NULL,
	[numero_atendimento] [bigint] NULL,
	[data_alta] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ctm_consultaAtendimento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ctm_consultaAtendimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_procedimento] [varchar](10) NOT NULL,
	[codigo_tabela] [int] NOT NULL,
	[data_atendimento] [datetime2](7) NOT NULL,
	[tipo_consulta] [int] NOT NULL,
	[valor_procedimento] [numeric](10, 2) NOT NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ctm_consultaAtendimento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ctm_consultaAtendimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_procedimento] [varchar](10) NULL,
	[codigo_tabela] [int] NULL,
	[data_atendimento] [datetime2](7) NULL,
	[tipo_consulta] [int] NULL,
	[valor_procedimento] [numeric](10, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[deMotivoGlosaWebParaANS]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deMotivoGlosaWebParaANS](
	[ans] [varchar](10) NULL,
	[codigoMotivoWeb] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[despesas_temp_importacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[despesas_temp_importacao](
	[discriminator] [varchar](31) NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[numero_auxiliares] [int] NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[quantidade_filme] [numeric](19, 4) NULL,
	[valor_custo_operacional] [numeric](19, 3) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[grupo] [varchar](255) NULL,
	[sub_grupo] [varchar](255) NULL,
	[data_final_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[situacao] [bit] NULL,
	[ch_moeda] [varchar](255) NULL,
	[desconsiderar_apartamento] [bit] NULL,
	[desconsiderar_enfermaria] [bit] NULL,
	[desconsiderar_externo] [bit] NULL,
	[desconsiderar_urgencia] [bit] NULL,
	[valor_acrescimo_tabela] [numeric](19, 2) NULL,
	[valor_porte_anestesia] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_especialidade] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[codigo_fk_item_fator] [varchar](500) NULL,
	[codigo_fk_item_despesa] [varchar](500) NULL,
	[descricao_fk_item_despesa] [varchar](500) NULL,
	[codigo_fk_item_porte_anestesia] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[edicao_fator_porte_temp_importacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[edicao_fator_porte_temp_importacao](
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[valoresEm] [int] NULL,
	[observacao] [varchar](500) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sigla_temp] [varchar](255) NULL,
	[edicao_temp] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[edicao_tabela_honorarios_temp_importacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[edicao_tabela_honorarios_temp_importacao](
	[discriminator] [varchar](31) NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[adicional_apartamento] [numeric](19, 2) NULL,
	[adicional_enfermaria] [numeric](19, 2) NULL,
	[adicional_externo] [numeric](19, 2) NULL,
	[adicional_urgencia] [numeric](19, 2) NULL,
	[data_cadastro] [date] NULL,
	[edicao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[valor_auxiliar_anestesista] [numeric](19, 2) NULL,
	[valor_outro_auxiliar] [numeric](19, 2) NULL,
	[valor_primeiro_auxiliar] [numeric](19, 2) NULL,
	[valores_em] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tabela_honorarios] [bigint] NULL,
	[sigla_fk_tabela_honorarios] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feriadoTempImportadorWeb]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feriadoTempImportadorWeb](
	[dataFeriado] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hibernate_sequences]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hibernate_sequences](
	[sequence_name] [varchar](255) NOT NULL,
	[next_val] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[sequence_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[item_despesa_temp_importacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[item_despesa_temp_importacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo_item_despesa] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[descricao] [varchar](500) NULL,
	[pk_importacao] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVINFO]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVINFO](
	[REV] [int] IDENTITY(1,1) NOT NULL,
	[REVTSTMP] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_atendimento_inconsistencia]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_atendimento_inconsistencia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[pk_importacao_fk_atendimento] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_atendimento_inconsistencia_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_atendimento_inconsistencia_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_atendimento_motivo_exclusao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_atendimento_motivo_exclusao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[informacao_complementar] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_motivo_exclusao_guias] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_atendimento_motivo_exclusao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_atendimento_motivo_exclusao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[informacao_complementar] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_motivo_exclusao_guias] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_atendimento_tipo_pendencia]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_atendimento_tipo_pendencia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dataCadastro] [datetime2](7) NULL,
	[observacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_tipo_pendencia] [bigint] NULL,
	[pk_importacao_fk_tipo_pendencia] [varchar](500) NULL,
	[pk_importacao_fk_atendimento] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[codPes_temp_fk_atendimento] [varchar](500) NULL,
	[fk_num_aten_fk_atendimento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_atendimento_tipo_pendencia_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_atendimento_tipo_pendencia_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dataCadastro] [datetime2](7) NULL,
	[observacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_tipo_pendencia] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_coluna_relatorio_resumo_repasse]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_coluna_relatorio_resumo_repasse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao_coluna] [varchar](255) NULL,
	[posicao_coluna] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_coluna_relatorio_resumo_repasse_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_coluna_relatorio_resumo_repasse_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao_coluna] [varchar](255) NULL,
	[posicao_coluna] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_convenio_despesa_acomodacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_convenio_despesa_acomodacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_acomodacao] [bigint] NULL,
	[fk_entidade_convenio_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_convenio_despesa_acomodacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_convenio_despesa_acomodacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_acomodacao] [bigint] NULL,
	[fk_entidade_convenio_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_cooperado_cbo]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_cooperado_cbo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_final_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[numero_cbo] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_fk_entidade_cooperado] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[numeroCBOManad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_cooperado_cbo_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_cooperado_cbo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_final_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[numero_cbo] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_cooperado_movimentacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_cooperado_movimentacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_movimentacao] [datetime2](7) NULL,
	[matricula] [bigint] NULL,
	[valor_movimentacao] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_tipo_movimentacao] [bigint] NULL,
	[pk_importacao_fk_tipo_movimentacao] [varchar](500) NULL,
	[fk_entidade_fk_entidade_cooperado] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_cooperado_movimentacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_cooperado_movimentacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_movimentacao] [datetime2](7) NULL,
	[matricula] [bigint] NULL,
	[valor_movimentacao] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_tipo_movimentacao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_darf_emitida]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_darf_emitida](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_receita] [bigint] NULL,
	[data_apuracao] [datetime2](7) NULL,
	[data_emissao] [datetime2](7) NULL,
	[data_vencimento] [datetime2](7) NULL,
	[data_vencimento_real] [datetime2](7) NULL,
	[numero_compensacao] [bigint] NULL,
	[numero_semana] [bigint] NULL,
	[texto_outros] [varchar](255) NULL,
	[valor_base] [numeric](19, 2) NULL,
	[valor_compensacao] [numeric](19, 2) NULL,
	[valor_darf] [numeric](19, 2) NULL,
	[valor_juros] [numeric](19, 2) NULL,
	[valor_multa] [numeric](19, 2) NULL,
	[valor_outros] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[valor_total_darf] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_darf] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_darf_emitida_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_darf_emitida_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_receita] [bigint] NULL,
	[data_apuracao] [datetime2](7) NULL,
	[data_emissao] [datetime2](7) NULL,
	[data_vencimento] [datetime2](7) NULL,
	[data_vencimento_real] [datetime2](7) NULL,
	[numero_compensacao] [bigint] NULL,
	[numero_semana] [bigint] NULL,
	[texto_outros] [varchar](255) NULL,
	[valor_base] [numeric](19, 2) NULL,
	[valor_compensacao] [numeric](19, 2) NULL,
	[valor_darf] [numeric](19, 2) NULL,
	[valor_juros] [numeric](19, 2) NULL,
	[valor_multa] [numeric](19, 2) NULL,
	[valor_outros] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[valor_total_darf] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_darf] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_de_para_tuss]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_de_para_tuss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1990] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1992] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1996] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1999] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_CBHPM_3] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_CBHPM_4] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_CBHPM_5] [bigint] NULL,
	[fk_item_despesa_tuss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_de_para_tuss_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_de_para_tuss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1990] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1992] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1996] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_AMB_1999] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_CBHPM_3] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_CBHPM_4] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_CBHPM_5] [bigint] NULL,
	[fk_item_despesa_tuss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_despesa_removida_da_entidade_tabela]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_despesa_removida_da_entidade_tabela](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_despesa_tabela_honorarios_removida] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_despesa_removida_da_entidade_tabela_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_despesa_removida_da_entidade_tabela_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_despesa_tabela_honorarios_removida] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_dias_semana_horario_trabalho]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_dias_semana_horario_trabalho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dia_semana] [int] NULL,
	[fim_intervalo_1] [time](7) NULL,
	[fim_intervalo_2] [time](7) NULL,
	[inicio_intervalo_1] [time](7) NULL,
	[inicio_intervalo_2] [time](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_horario_trabalho] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_dias_semana_horario_trabalho_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_dias_semana_horario_trabalho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dia_semana] [int] NULL,
	[fim_intervalo_1] [time](7) NULL,
	[fim_intervalo_2] [time](7) NULL,
	[inicio_intervalo_1] [time](7) NULL,
	[inicio_intervalo_2] [time](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_horario_trabalho] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_dias_semana_horario_trabalho_usuario]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dia_semana] [int] NULL,
	[fim_intervalo_1] [time](7) NULL,
	[fim_intervalo_2] [time](7) NULL,
	[inicio_intervalo_1] [time](7) NULL,
	[inicio_intervalo_2] [time](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_horario_trabalho] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_dias_semana_horario_trabalho_usuario_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dia_semana] [int] NULL,
	[fim_intervalo_1] [time](7) NULL,
	[fim_intervalo_2] [time](7) NULL,
	[inicio_intervalo_1] [time](7) NULL,
	[inicio_intervalo_2] [time](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_horario_trabalho] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_dirf_capital]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_dirf_capital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_capital] [numeric](19, 2) NULL,
	[valor_movimentacao_capital] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf_cooperados] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_dirf_capital_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_dirf_capital_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_capital] [numeric](19, 2) NULL,
	[valor_movimentacao_capital] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf_cooperados] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_dirf_cooperado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_dirf_cooperado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_dirf] [bigint] NULL,
	[ano_calendario] [int] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_dirf_cooperado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_dirf_cooperado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_dirf] [bigint] NULL,
	[ano_calendario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_dirf_lancamento_repasse]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_dirf_lancamento_repasse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_dirf_lancamento_repasse_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_dirf_lancamento_repasse_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_dirf_lancamento_valores]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_dirf_lancamento_valores](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf_cooperados] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_dirf_lancamento_valores_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_dirf_lancamento_valores_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf_cooperados] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_dirf_valores]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_dirf_valores](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[mes] [int] NULL,
	[valor_csll_pj] [numeric](19, 2) NULL,
	[valor_cofins_pj] [numeric](19, 2) NULL,
	[valor_deducoes] [numeric](19, 2) NULL,
	[valor_dependentes] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[valor_imposto_retido] [numeric](19, 2) NULL,
	[valor_lucros] [numeric](19, 2) NULL,
	[valor_outros] [numeric](19, 2) NULL,
	[valor_pensao] [numeric](19, 2) NULL,
	[valor_pis_pj] [numeric](19, 2) NULL,
	[valor_prolabore] [numeric](19, 2) NULL,
	[valor_retencao_trimestral] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf_cooperados] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_dirf_valores_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_dirf_valores_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[mes] [int] NULL,
	[valor_csll_pj] [numeric](19, 2) NULL,
	[valor_cofins_pj] [numeric](19, 2) NULL,
	[valor_deducoes] [numeric](19, 2) NULL,
	[valor_dependentes] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[valor_imposto_retido] [numeric](19, 2) NULL,
	[valor_lucros] [numeric](19, 2) NULL,
	[valor_outros] [numeric](19, 2) NULL,
	[valor_pensao] [numeric](19, 2) NULL,
	[valor_pis_pj] [numeric](19, 2) NULL,
	[valor_prolabore] [numeric](19, 2) NULL,
	[valor_retencao_trimestral] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf_cooperados] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_enderecotmp_entidade]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_enderecotmp_entidade](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_enderecoTmp] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_enderecotmp_entidade_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_enderecotmp_entidade_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_enderecoTmp] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_acomodacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_acomodacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[tipoAcomodacao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_entidade_temp] [varchar](255) NULL,
	[codigo_ans_duplicado] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_acomodacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_acomodacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[tipoAcomodacao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_acomodacao_integracao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_acomodacao_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[tipoAcomodacao] [int] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_acomodacao_integracao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_acomodacao_integracao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_classificacao_espelho]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_classificacao_espelho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_classificacao_espelho_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_classificacao_espelho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_conselho_profissional]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_conselho_profissional](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_conselho_profissional] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[sigla_fk_conselho_profissional] [varchar](500) NULL,
	[discriminator_fk_conselho_profissional] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_fk_conselho_profissional] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_conselho_profissional_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_conselho_profissional_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_conselho_profissional] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_convenio]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[alterar_cooperado_atendimento_espelho_fatura] [bit] NULL,
	[ativo] [bit] NULL,
	[descricao_lancamento_custo_op] [varchar](500) NULL,
	[descricao_lancamento_honorarios] [varchar](500) NULL,
	[dias_retorno] [int] NULL,
	[intervalo_final] [bigint] NULL,
	[intervalo_inicial] [bigint] NULL,
	[marcar_atendimento_espelhado_faturar] [bit] NULL,
	[numero_digitos_guia] [int] NULL,
	[numero_digitos_matricula] [int] NULL,
	[numero_guia_atual] [bigint] NULL,
	[observacao] [varchar](5000) NULL,
	[percentual_alteracao_despesa] [numeric](19, 2) NULL,
	[percentual_custeio] [numeric](19, 2) NULL,
	[permitir_digitacao_atendimento_pj] [bit] NULL,
	[quantidade_mes_anterior_procedimento] [int] NULL,
	[realizar_calculo_urgencia] [bit] NULL,
	[reducao_acrescimo_tiss] [numeric](19, 2) NULL,
	[taxa_entidade] [numeric](19, 2) NULL,
	[tipo_item_despesa] [int] NULL,
	[tipo_numero_guia] [int] NULL,
	[urgencia_sp_sadt] [int] NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_lancamento_custo_op] [bigint] NULL,
	[fk_lancamento_honorario] [bigint] NULL,
	[pk_importacao_composta_CodPesEnt_temp_fk_impostos] [varchar](500) NULL,
	[pk_importacao_composta_CodPesCon_temp_fk_impostos] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_convenio] [varchar](500) NULL,
	[utilizar_tuss_padrao_digitacao] [bit] NULL,
	[tipo_redutor_acrescimo] [int] NULL,
	[pk_importacao_fk_lancamento_honorario] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_custo_op] [varchar](500) NULL,
	[alteraTemp] [char](1) NULL,
	[intervaloFinalTemp] [bigint] NULL,
	[enviarTAGMembroEquipeSPSAPDTTISS] [bit] NULL,
	[codigo_do_prestador_na_operadora] [varchar](255) NULL,
	[porte] [bigint] NULL,
	[realizar_mudanca_porte_aproximacao] [bit] NULL,
	[codigo_tabela_ans] [varchar](255) NULL,
	[apresentar_acrescimo_tabela_arquivo_xml] [bit] NULL,
	[apresentar_acrescimo_tabela_capa_fatura] [bit] NULL,
	[apresentar_custeio_arquivo_xml] [bit] NULL,
	[apresentar_custeio_capa_fatura] [bit] NULL,
	[somar_acrescimo_tabela_honorario_medico] [bit] NULL,
	[somar_custeio_honorario_medico] [bit] NULL,
	[apresentar_filme_capa_fatura] [bit] NULL,
	[somar_filme_honorario_medico] [bit] NULL,
	[opcao_origem_contratado] [int] NULL,
	[copiar_campo_guia_principal_para_guias_e_senha] [bit] NULL,
	[permitir_pagar_espelho] [bit] NULL,
	[copiar_campo_guia_para_guia_procedimento] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[acrescimo_tabela] [numeric](19, 2) NULL,
	[acrescimo_tabela_custo_operacional] [bit] NULL,
	[acrescimo_tabela_material_medicamento] [bit] NULL,
	[alterar_despesa_atendimento_espelho_fatura] [bit] NULL,
	[calculo_termo_aditivo] [int] NULL,
	[calculo_uco] [int] NULL,
	[cbo_receita_federal] [bit] NULL,
	[codigo_ans] [varchar](255) NULL,
	[desconto_convenio] [numeric](19, 2) NULL,
	[dias_atraso] [int] NULL,
	[exige_confirmacao_alteracao_cooperado] [bit] NULL,
	[hora_final_trabalho_sab] [time](7) NULL,
	[hora_final_trabalho_seg_sex] [time](7) NULL,
	[hora_inicio_trabalho_sab] [time](7) NULL,
	[hora_inicio_trabalho_seg_sex] [time](7) NULL,
	[mudanca_porte_aproximacao] [bit] NULL,
	[mudanca_porte_zero] [int] NULL,
	[percentual_cobranca_video] [numeric](19, 2) NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[percentual_juros_mora] [numeric](19, 2) NULL,
	[periodicidade] [int] NULL,
	[processar_sefip] [bit] NULL,
	[quantidade_mes_anterior_repasse] [int] NULL,
	[tipoCobrancaVideo] [int] NULL,
	[valor_fator_custo_operacional] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_tipo_item_despesa] [bigint] NULL,
	[cd_federativo_temp_fk_lancamento_honorario] [varchar](500) NULL,
	[cd_federativo_temp_fk_lancamento_custo_op] [varchar](500) NULL,
	[apresentar_texto_base_iss_capa_fatura] [bit] NULL,
	[permitir_pagar_fatura_zerada] [int] NULL,
	[tipo_redutor_acrescimo_anterior] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_convenio_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[alterar_cooperado_atendimento_espelho_fatura] [bit] NULL,
	[ativo] [bit] NULL,
	[descricao_lancamento_custo_op] [varchar](500) NULL,
	[descricao_lancamento_honorarios] [varchar](500) NULL,
	[dias_retorno] [int] NULL,
	[intervalo_final] [bigint] NULL,
	[intervalo_inicial] [bigint] NULL,
	[marcar_atendimento_espelhado_faturar] [bit] NULL,
	[numero_digitos_guia] [int] NULL,
	[numero_digitos_matricula] [int] NULL,
	[numero_guia_atual] [bigint] NULL,
	[observacao] [varchar](5000) NULL,
	[percentual_alteracao_despesa] [numeric](19, 2) NULL,
	[percentual_custeio] [numeric](19, 2) NULL,
	[permitir_digitacao_atendimento_pj] [bit] NULL,
	[quantidade_mes_anterior_procedimento] [int] NULL,
	[realizar_calculo_urgencia] [bit] NULL,
	[reducao_acrescimo_tiss] [numeric](19, 2) NULL,
	[taxa_entidade] [numeric](19, 2) NULL,
	[tipo_item_despesa] [int] NULL,
	[tipo_numero_guia] [int] NULL,
	[urgencia_sp_sadt] [int] NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_lancamento_custo_op] [bigint] NULL,
	[fk_lancamento_honorario] [bigint] NULL,
	[utilizar_tuss_padrao_digitacao] [bit] NULL,
	[tipo_redutor_acrescimo] [int] NULL,
	[enviarTAGMembroEquipeSPSAPDTTISS] [bit] NULL,
	[codigo_do_prestador_na_operadora] [varchar](255) NULL,
	[porte] [bigint] NULL,
	[realizar_mudanca_porte_aproximacao] [bit] NULL,
	[codigo_tabela_ans] [varchar](255) NULL,
	[apresentar_acrescimo_tabela_arquivo_xml] [bit] NULL,
	[apresentar_acrescimo_tabela_capa_fatura] [bit] NULL,
	[apresentar_custeio_arquivo_xml] [bit] NULL,
	[apresentar_custeio_capa_fatura] [bit] NULL,
	[somar_acrescimo_tabela_honorario_medico] [bit] NULL,
	[somar_custeio_honorario_medico] [bit] NULL,
	[apresentar_filme_capa_fatura] [bit] NULL,
	[somar_filme_honorario_medico] [bit] NULL,
	[opcao_origem_contratado] [int] NULL,
	[copiar_campo_guia_principal_para_guias_e_senha] [bit] NULL,
	[permitir_pagar_espelho] [bit] NULL,
	[copiar_campo_guia_para_guia_procedimento] [bit] NULL,
	[acrescimo_tabela] [numeric](19, 2) NULL,
	[acrescimo_tabela_custo_operacional] [bit] NULL,
	[acrescimo_tabela_material_medicamento] [bit] NULL,
	[alterar_despesa_atendimento_espelho_fatura] [bit] NULL,
	[calculo_termo_aditivo] [int] NULL,
	[calculo_uco] [int] NULL,
	[cbo_receita_federal] [bit] NULL,
	[codigo_ans] [varchar](255) NULL,
	[desconto_convenio] [numeric](19, 2) NULL,
	[dias_atraso] [int] NULL,
	[exige_confirmacao_alteracao_cooperado] [bit] NULL,
	[hora_final_trabalho_sab] [time](7) NULL,
	[hora_final_trabalho_seg_sex] [time](7) NULL,
	[hora_inicio_trabalho_sab] [time](7) NULL,
	[hora_inicio_trabalho_seg_sex] [time](7) NULL,
	[mudanca_porte_aproximacao] [bit] NULL,
	[mudanca_porte_zero] [int] NULL,
	[percentual_cobranca_video] [numeric](19, 2) NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[percentual_juros_mora] [numeric](19, 2) NULL,
	[periodicidade] [int] NULL,
	[processar_sefip] [bit] NULL,
	[quantidade_mes_anterior_repasse] [int] NULL,
	[tipoCobrancaVideo] [int] NULL,
	[valor_fator_custo_operacional] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_tipo_item_despesa] [bigint] NULL,
	[apresentar_texto_base_iss_capa_fatura] [bit] NULL,
	[permitir_pagar_fatura_zerada] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_convenio_dados_bancarios]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_convenio_dados_bancarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[codigo_lancamento] [varchar](255) NULL,
	[conta] [varchar](255) NULL,
	[data_vinculo] [date] NULL,
	[numero_convenio] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[numero_banco_fk_banco] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[fk_entidade_daddos_bancarios] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_convenio_dados_bancarios_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_convenio_dados_bancarios_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[codigo_lancamento] [varchar](255) NULL,
	[conta] [varchar](255) NULL,
	[data_vinculo] [date] NULL,
	[numero_convenio] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_daddos_bancarios] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio_tipo_espelho] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio_tipo_espelho] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_cooperado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_cooperado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acumular_ir_pj] [bit] NULL,
	[auditor_sistema] [bit] NULL,
	[calcular_ir] [bit] NULL,
	[data_cadastro] [date] NULL,
	[descontar_taxa_administrativa] [bit] NULL,
	[email] [varchar](255) NULL,
	[matricula] [bigint] NULL,
	[observacao] [varchar](5000) NULL,
	[percentual_ir_pj] [numeric](19, 2) NULL,
	[repasse_100] [bit] NULL,
	[senha] [varchar](255) NULL,
	[situacao_cooperado] [int] NULL,
	[taxa_administracao] [numeric](19, 2) NULL,
	[tipo_desconto_hospital] [int] NULL,
	[valor_capital] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_cooperado] [varchar](500) NULL,
	[numero_cbo] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
	[fk_especialidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_cooperado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_cooperado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acumular_ir_pj] [bit] NULL,
	[auditor_sistema] [bit] NULL,
	[calcular_ir] [bit] NULL,
	[data_cadastro] [date] NULL,
	[descontar_taxa_administrativa] [bit] NULL,
	[email] [varchar](255) NULL,
	[matricula] [bigint] NULL,
	[observacao] [varchar](5000) NULL,
	[percentual_ir_pj] [numeric](19, 2) NULL,
	[repasse_100] [bit] NULL,
	[senha] [varchar](255) NULL,
	[situacao_cooperado] [int] NULL,
	[taxa_administracao] [numeric](19, 2) NULL,
	[tipo_desconto_hospital] [int] NULL,
	[valor_capital] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[numero_cbo] [varchar](255) NULL,
	[fk_especialidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_cooperado_conversao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_cooperado_conversao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_final] [date] NULL,
	[data_inicial] [date] NULL,
	[todas_as_contas] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_cooperado_destino] [bigint] NULL,
	[fk_entidade_cooperado_origem] [bigint] NULL,
	[destinoCodPesEnt] [int] NULL,
	[destinoCodPesCoo] [int] NULL,
	[origemCodPesEnt] [int] NULL,
	[origemCodPesCoo] [int] NULL,
	[fk_cooperado_destino] [bigint] NULL,
	[fk_cooperado_origem] [bigint] NULL,
	[pk_importacao_fk_cooperado_origem] [varchar](255) NULL,
	[pk_importacao_fk_cooperado_destino] [varchar](255) NULL,
	[id_temporario] [bigint] NULL,
	[pk_importacao_fk_cooperado_destino_se] [varchar](255) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_cooperado_conversao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_cooperado_conversao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_final] [date] NULL,
	[data_inicial] [date] NULL,
	[todas_as_contas] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_cooperado_destino] [bigint] NULL,
	[fk_entidade_cooperado_origem] [bigint] NULL,
	[fk_cooperado_destino] [bigint] NULL,
	[fk_cooperado_origem] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_cooperado_dados_bancarios]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_cooperado_dados_bancarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[codigo_lancamento] [varchar](255) NULL,
	[conta] [varchar](255) NULL,
	[data_vinculo] [date] NULL,
	[numero_convenio] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_fk_entidade_cooperado] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado] [varchar](500) NULL,
	[numero_banco_fk_banco] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_cooperado_dados_bancarios_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_cooperado_dados_bancarios_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[codigo_lancamento] [varchar](255) NULL,
	[conta] [varchar](255) NULL,
	[data_vinculo] [date] NULL,
	[numero_convenio] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_dados_bancarios]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_dados_bancarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[codigo_lancamento] [varchar](255) NULL,
	[conta] [varchar](255) NULL,
	[data_vinculo] [date] NULL,
	[numero_convenio] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo] [varchar](255) NULL,
	[tipoCNAB] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[numero_banco_fk_banco] [varchar](500) NULL,
	[banco_selecionado] [bit] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_dados_bancarios_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_dados_bancarios_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[codigo_lancamento] [varchar](255) NULL,
	[conta] [varchar](255) NULL,
	[data_vinculo] [date] NULL,
	[numero_convenio] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo] [varchar](255) NULL,
	[tipoCNAB] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[banco_selecionado] [bit] NULL,
	[fk_entidade_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_edicao_tabela_honorarios]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_edicao_tabela_honorarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_edicao_tabela_honorarios_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_edicao_tabela_honorarios_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_feriado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_feriado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_feriado] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_feriado] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_feriado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_feriado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_feriado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_grau_participacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_grau_participacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[entidade_fk_tb_tabela_tiss_temp] [varchar](255) NULL,
	[codigo_ans_duplicado] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_grau_participacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_grau_participacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_grau_participacao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_grupo_cooperado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_grupo_cooperado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[grupo_cooperado] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_grupo_cooperado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_grupo_cooperado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[grupo_cooperado] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_grupo_cooperado] [bigint] NULL,
	[fk_entidade_fk_entidade_grupo_cooperado] [varchar](500) NULL,
	[pk_importacao_fk_entidade_grupo_cooperado] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado] [varchar](500) NULL,
	[fk_entidade_fk_entidade_cooperado] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_grupo_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_hospital]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_hospital] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[vl_fator_dh] [numeric](19, 2) NULL,
	[vl_percentual] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_hospital_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_hospital_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[vl_fator_dh] [numeric](19, 2) NULL,
	[vl_percentual] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_hospital_item_despesa]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_hospital_item_despesa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_tipo_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_hospital_item_despesa_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_hospital_item_despesa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_tipo_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_hospital_procedimento_calculo]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_hospital_procedimento_calculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_hospital_procedimento_calculo_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_hospital_procedimento_calculo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_importacao_unimed]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_importacao_unimed](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[honorario] [numeric](19, 2) NULL,
	[servico_adicional] [numeric](19, 2) NULL,
	[taxa_fencom] [numeric](19, 2) NULL,
	[total_adequacao] [numeric](19, 2) NULL,
	[total_credito] [numeric](19, 2) NULL,
	[total_debito] [numeric](19, 2) NULL,
	[total_glosa] [numeric](19, 2) NULL,
	[total_lancamento_eventual] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[numero_total_glosas] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_importacao_unimed_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_importacao_unimed_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[honorario] [numeric](19, 2) NULL,
	[servico_adicional] [numeric](19, 2) NULL,
	[taxa_fencom] [numeric](19, 2) NULL,
	[total_adequacao] [numeric](19, 2) NULL,
	[total_credito] [numeric](19, 2) NULL,
	[total_debito] [numeric](19, 2) NULL,
	[total_glosa] [numeric](19, 2) NULL,
	[total_lancamento_eventual] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[numero_total_glosas] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_lancamento_repasse]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_lancamento_repasse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[contra_partida] [varchar](255) NULL,
	[credora] [varchar](255) NULL,
	[devedora] [varchar](255) NULL,
	[frequencia_incidencia_lancamento] [int] NULL,
	[historico] [varchar](255) NULL,
	[natureza_contabil] [int] NULL,
	[percentual] [numeric](19, 2) NULL,
	[prioridade_estorno] [bigint] NULL,
	[situacao] [bit] NULL,
	[tipo_calculo_lancamento] [int] NULL,
	[tipo_calculo_sistema] [int] NULL,
	[valor_fixo] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_coluna_relatorio_resumo_repasse] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_inss] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_lancamento_repasse_estorno] [bigint] NULL,
	[fk_tabela_calculo] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](255) NULL,
	[pk_importacao_fk_tabela_calculo] [varchar](255) NULL,
	[pk_importacao_fk_lancamento_repasse] [varchar](255) NULL,
	[incide_em_pf] [bit] NULL,
	[incide_em_pj] [bit] NULL,
	[tabelaCalculoPkImport] [varchar](255) NULL,
	[tabelaTabelaResumo] [varchar](255) NULL,
	[id_fk_inss_temp] [varchar](255) NULL,
	[pk_importacao_fk_lancamento_repasse_estorno] [varchar](500) NULL,
	[pk_importacao_fk_coluna_relatorio_resumo_repasse] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[cd_federativo_temp_fk_lancamento_repasse] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_lancamento_repasse_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_lancamento_repasse_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[contra_partida] [varchar](255) NULL,
	[credora] [varchar](255) NULL,
	[devedora] [varchar](255) NULL,
	[frequencia_incidencia_lancamento] [int] NULL,
	[historico] [varchar](255) NULL,
	[natureza_contabil] [int] NULL,
	[percentual] [numeric](19, 2) NULL,
	[prioridade_estorno] [bigint] NULL,
	[situacao] [bit] NULL,
	[tipo_calculo_lancamento] [int] NULL,
	[tipo_calculo_sistema] [int] NULL,
	[valor_fixo] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_coluna_relatorio_resumo_repasse] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_inss] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_lancamento_repasse_estorno] [bigint] NULL,
	[fk_tabela_calculo] [bigint] NULL,
	[incide_em_pf] [bit] NULL,
	[incide_em_pj] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_lancamento_repasse_INSS]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_lancamento_repasse_INSS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_inss] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_lancamento_repasse_INSS_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_lancamento_repasse_INSS_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_inss] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_motivo_exclusao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_motivo_exclusao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_motivo_exclusao_guias] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_motivo_exclusao_guias] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_motivo_exclusao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_motivo_exclusao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_motivo_exclusao_guias] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_motivo_glosa]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_motivo_glosa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[observacao] [varchar](500) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_motivo_glosa] [bigint] NULL,
	[vinculo_entidade] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_motivo_glosa_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_motivo_glosa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[observacao] [varchar](500) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_motivo_glosa] [bigint] NULL,
	[vinculo_entidade] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_perfil_acesso]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_perfil_acesso](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_perfil_acesso] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_perfil_acesso_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_perfil_acesso_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_perfil_acesso] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_perfil_acesso_caso_uso]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_caso_uso] [bigint] NULL,
	[fk_entidade_perfil_acesso] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_perfil_acesso_caso_uso_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_caso_uso] [bigint] NULL,
	[fk_entidade_perfil_acesso] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_usuario]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_usuario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[gestor] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_usuario_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_usuario_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[gestor] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidade_usuario_perfil_acesso]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidade_usuario_perfil_acesso](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_perfil_acesso] [bigint] NULL,
	[fk_entidade_usuario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidade_usuario_perfil_acesso_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidade_usuario_perfil_acesso_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_perfil_acesso] [bigint] NULL,
	[fk_entidade_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_carater_atendimento] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_carater_atendimento] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_complemento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_complemento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[valor_acrescimo_tabela] [numeric](19, 2) NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_ch] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_complemento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_complemento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[valor_acrescimo_tabela] [numeric](19, 2) NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_ch] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_historico_tabela_honorario]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acrescimo_tabela] [numeric](19, 2) NULL,
	[acrescimo_tabela_custo_operacional] [bit] NULL,
	[calculo_termo_aditivo] [int] NULL,
	[calculo_uco] [int] NULL,
	[codigo_ans] [varchar](255) NULL,
	[data_final_vigencia] [date] NULL,
	[data_hora_inclusao] [datetime2](7) NULL,
	[data_inicio_vigencia] [date] NULL,
	[desconto_convenio] [numeric](19, 2) NULL,
	[hora_trabalho_final_sabado] [varchar](255) NULL,
	[hora_trabalho_final_segunda_a_sexta] [varchar](255) NULL,
	[hora_trabalho_inicial_sabado] [varchar](255) NULL,
	[hora_trabalho_inicial_segunda_a_sexta] [varchar](255) NULL,
	[mudanca_porte_aproximacao] [bit] NULL,
	[mudanca_porte_zero] [int] NULL,
	[percentual_cobranca_video] [numeric](19, 2) NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[tipo_cobranca_video] [int] NULL,
	[validar_numero_auxiliares] [bit] NULL,
	[valor_fator_custo_operacional] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_entidade_acomodacao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_ch_operacional] [bigint] NULL,
	[fk_entidade_convenio_complemento] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[pk_importacao_fk_ch] [varchar](500) NULL,
	[edicao_fk_edicao_tabela_honorarios] [varchar](500) NULL,
	[sigla_fk_edicao_tabela_honorarios] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[fk_tabela_tiss] [bigint] NULL,
	[edicao_temp_fk_edicao_fator_porte] [varchar](500) NULL,
	[sigla_temp_fk_edicao_fator_porte] [varchar](500) NULL,
	[fk_tipo_tabela_tiss] [bigint] NULL,
	[acrescimo_convenio] [numeric](19, 2) NULL,
	[acumular_acrescimo_honorario] [bit] NULL,
	[acumular_custo_operacional_honorario] [bit] NULL,
	[acumular_filme_honorario] [bit] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[codigo_usuario_inclusao] [bigint] NULL,
	[sigla_tabela] [varchar](255) NULL,
	[valor_percentual_fator_CBHPM] [numeric](19, 2) NULL,
	[fk_tabela_edicao] [bigint] NULL,
	[codigo_fk_ch] [varchar](500) NULL,
	[fk_convenio_fk_ch] [varchar](500) NULL,
	[fk_entidade_fk_ch] [varchar](500) NULL,
	[vigente_fk_ch] [varchar](500) NULL,
	[gerar_inconsistencia_quantidade_auxiliares_excedida] [bit] NULL,
	[zerar_procedimentos_quando_exceder_auxiliares] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_historico_tabela_honorario_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acrescimo_tabela] [numeric](19, 2) NULL,
	[acrescimo_tabela_custo_operacional] [bit] NULL,
	[calculo_termo_aditivo] [int] NULL,
	[calculo_uco] [int] NULL,
	[codigo_ans] [varchar](255) NULL,
	[data_final_vigencia] [date] NULL,
	[data_hora_inclusao] [datetime2](7) NULL,
	[data_inicio_vigencia] [date] NULL,
	[desconto_convenio] [numeric](19, 2) NULL,
	[hora_trabalho_final_sabado] [varchar](255) NULL,
	[hora_trabalho_final_segunda_a_sexta] [varchar](255) NULL,
	[hora_trabalho_inicial_sabado] [varchar](255) NULL,
	[hora_trabalho_inicial_segunda_a_sexta] [varchar](255) NULL,
	[mudanca_porte_aproximacao] [bit] NULL,
	[mudanca_porte_zero] [int] NULL,
	[percentual_cobranca_video] [numeric](19, 2) NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[tipo_cobranca_video] [int] NULL,
	[validar_numero_auxiliares] [bit] NULL,
	[valor_fator_custo_operacional] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_entidade_acomodacao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_ch_operacional] [bigint] NULL,
	[fk_entidade_convenio_complemento] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_tabela_tiss] [bigint] NULL,
	[fk_tipo_tabela_tiss] [bigint] NULL,
	[acrescimo_convenio] [numeric](19, 2) NULL,
	[acumular_acrescimo_honorario] [bit] NULL,
	[acumular_custo_operacional_honorario] [bit] NULL,
	[acumular_filme_honorario] [bit] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[codigo_usuario_inclusao] [bigint] NULL,
	[sigla_tabela] [varchar](255) NULL,
	[valor_percentual_fator_CBHPM] [numeric](19, 2) NULL,
	[fk_tabela_edicao] [bigint] NULL,
	[gerar_inconsistencia_quantidade_auxiliares_excedida] [bit] NULL,
	[zerar_procedimentos_quando_exceder_auxiliares] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_material_medicamento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_material_medicamento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[tipo_ch_moeda] [int] NULL,
	[tipo_item_despesa] [varchar](255) NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_material_medicamento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_material_medicamento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[tipo_ch_moeda] [int] NULL,
	[tipo_item_despesa] [varchar](255) NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_termo_aditivo]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_termo_aditivo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_termo_aditivo] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[piso] [date] NULL,
	[pk_importacao_web_fk_termo_aditivo] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_termo_aditivo_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_termo_aditivo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[percentual] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_termo_aditivo] [bigint] NULL,
	[piso] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_tabela_ans] [varchar](255) NULL,
	[tipo_item_despesa] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_tabela_ans] [varchar](255) NULL,
	[tipo_item_despesa] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_tipo_espelho]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_tipo_espelho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acomodacao_externa] [bit] NULL,
	[acomodacao_interna] [bit] NULL,
	[atendimento_urgencia] [bit] NULL,
	[cooperado_pessoa_fisica] [bit] NULL,
	[cooperado_pessoa_juridica] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sequencia] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[fk_tipo_espelho] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadeconvenio_tipo_espelho_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadeconvenio_tipo_espelho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acomodacao_externa] [bit] NULL,
	[acomodacao_interna] [bit] NULL,
	[atendimento_urgencia] [bit] NULL,
	[cooperado_pessoa_fisica] [bit] NULL,
	[cooperado_pessoa_juridica] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sequencia] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_tipo_espelho] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadecooperado_calculo]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_calculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_entidadeconvenio] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_ch_operacional] [bigint] NULL,
	[fk_entidadeconvenio_complemento] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidadecooperado_calculo_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_calculo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_entidadeconvenio] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_ch_operacional] [bigint] NULL,
	[fk_entidadeconvenio_complemento] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidadecooperado_especialidade]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_especialidade](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[principal] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_especialidade] [bigint] NULL,
	[pk_importacao_fk_especialidade] [varchar](500) NULL,
	[discriminator_fk_especialidade] [varchar](500) NULL,
	[fk_entidade_fk_entidade_cooperado] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadecooperado_especialidade_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_especialidade_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[principal] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_especialidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidadecooperado_hospital]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_entidade_fk_entidade_hospital] [varchar](500) NULL,
	[fk_hospital_fk_entidade_hospital] [varchar](500) NULL,
	[fk_entidade_fk_entidade_cooperado] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[fk_hospital] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadecooperado_hospital_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_hospital_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_entidadecooperado_local_atendimento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_local_atendimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_local_atendimento] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_entidadecooperado_local_atendimento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_entidadecooperado_local_atendimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_local_atendimento] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_fencom_despesa_removida_da_entidade_tabela]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_removida] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_fencom_despesa_removida_da_entidade_tabela_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fencom_despesa_tabela_honorarios_removida] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_grupo_convenio_entidade_convenio]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_grupo_convenio_entidade_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_grupo_convenio] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_grupo_convenio_entidade_convenio_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_grupo_convenio_entidade_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_grupo_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_grupo_despesa_item_despesa]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_grupo_despesa_item_despesa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_grupo_despesa] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[codigo_item_despesa_temp] [varchar](255) NULL,
	[descricao_item_despesa_temp] [varchar](255) NULL,
	[pk_importacao_fk_grupo_despesa] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_grupo_despesa_item_despesa_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_grupo_despesa_item_despesa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_grupo_despesa] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_grupo_endereco_convenio]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_grupo_endereco_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_grupo_endereco] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_grupo_endereco_convenio_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_grupo_endereco_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_grupo_endereco] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_integracao_sus_valores]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_integracao_sus_valores](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aih] [varchar](255) NULL,
	[cnes_entidade] [varchar](255) NULL,
	[cnes_hospital] [varchar](255) NULL,
	[competencia] [varchar](255) NULL,
	[complexidade_nao_encontrada] [varchar](255) NULL,
	[cpf_cns_executante] [varchar](255) NULL,
	[cpf_medico] [varchar](255) NULL,
	[crm] [varchar](255) NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[data_realizacao] [date] NULL,
	[faec] [varchar](255) NULL,
	[fin] [varchar](255) NULL,
	[nome_hospital] [varchar](255) NULL,
	[nome_medico] [varchar](255) NULL,
	[nome_paciente] [varchar](255) NULL,
	[procedimento] [int] NULL,
	[quantidade] [int] NULL,
	[valor_aih] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_complexidade] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_executante] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_recebedor] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_integracao_sus_valores_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_integracao_sus_valores_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aih] [varchar](255) NULL,
	[cnes_entidade] [varchar](255) NULL,
	[cnes_hospital] [varchar](255) NULL,
	[competencia] [varchar](255) NULL,
	[complexidade_nao_encontrada] [varchar](255) NULL,
	[cpf_cns_executante] [varchar](255) NULL,
	[cpf_medico] [varchar](255) NULL,
	[crm] [varchar](255) NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[data_realizacao] [date] NULL,
	[faec] [varchar](255) NULL,
	[fin] [varchar](255) NULL,
	[nome_hospital] [varchar](255) NULL,
	[nome_medico] [varchar](255) NULL,
	[nome_paciente] [varchar](255) NULL,
	[procedimento] [int] NULL,
	[quantidade] [int] NULL,
	[valor_aih] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_complexidade] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_executante] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_recebedor] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_itemdespesa_tuss]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_itemdespesa_tuss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_de_para_tuss] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_tuss_versao_tiss] [bigint] NULL,
	[codigo_fk_tuss_versao_tiss] [varchar](500) NULL,
	[codigo_fk_item_despesa] [varchar](500) NULL,
	[descricao_fk_item_despesa] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_itemdespesa_tuss_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_itemdespesa_tuss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_de_para_tuss] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_tuss_versao_tiss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_itemdespesa_tuss_temp_importacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_itemdespesa_tuss_temp_importacao](
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_de_para_tuss] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_tuss_versao_tiss] [bigint] NULL,
	[codigo_fk_item_despesa] [varchar](500) NULL,
	[descricao_fk_item_despesa] [varchar](500) NULL,
	[codigo_fk_tuss_versao_tiss] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_lancamento_repasse_cooperado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_lancamento_repasse_cooperado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[descricao_para_lancamento_eventual] [varchar](255) NULL,
	[percentual] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[tipo_calculo_lancamento] [int] NULL,
	[valor_fixo] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_tabela_calculo] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](255) NULL,
	[pk_importacao_fk_tabela_calculo] [varchar](255) NULL,
	[pk_importacao_fk_lancamento_repasse] [varchar](255) NULL,
	[pk_importacao_fk_cooperado] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
	[cd_federativo_temp_fk_lancamento_repasse] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_lancamento_repasse_cooperado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_lancamento_repasse_cooperado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[descricao_para_lancamento_eventual] [varchar](255) NULL,
	[percentual] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[tipo_calculo_lancamento] [int] NULL,
	[valor_fixo] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_tabela_calculo] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_lancamento_servico_especial_fixo]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_lancamento_servico_especial_fixo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_lancamento] [date] NULL,
	[numero_lancamento] [bigint] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_participantes_composicao_servico_especial] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_lancamento_servico_especial_fixo_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_lancamento_servico_especial_fixo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_lancamento] [date] NULL,
	[numero_lancamento] [bigint] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_participantes_composicao_servico_especial] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_movimentacao_saldo_devedor]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_movimentacao_saldo_devedor](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_saldo_devedor] [bigint] NULL,
	[numero_repasse_importado] [varchar](255) NULL,
	[tipo_movimentacao_saldo_devedor] [int] NULL,
	[pk_importacao_fk_saldo_devedor] [varchar](500) NULL,
	[pk_importacao_fk_repasse] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web_fk_repasse] [varchar](500) NULL,
	[pk_importacao_web_fk_saldo_devedor] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_saldo_devedor] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_movimentacao_saldo_devedor_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_movimentacao_saldo_devedor_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_saldo_devedor] [bigint] NULL,
	[numero_repasse_importado] [varchar](255) NULL,
	[tipo_movimentacao_saldo_devedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_base_calculo_incidente]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_base_calculo_incidente](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[natureza_contabil] [int] NULL,
	[valor_base_calculo] [numeric](19, 2) NULL,
	[valor_calculo] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[pk_importacao_fk_cooperado] [varchar](500) NULL,
	[pk_importacao_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web_fk_repasse] [varchar](500) NULL,
	[cd_federativo_temp_fk_lancamento_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_repasse] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_base_calculo_incidente_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_repasse_base_calculo_incidente_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[natureza_contabil] [int] NULL,
	[valor_base_calculo] [numeric](19, 2) NULL,
	[valor_calculo] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_repasse_calculado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_calculado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[natureza_contabil] [int] NULL,
	[percentual_inss] [numeric](19, 2) NULL,
	[processa_saldo_devedor] [bit] NULL,
	[tipo_demonstrativo] [int] NULL,
	[tipo_lancamento_repasse] [int] NULL,
	[tipo_servico] [int] NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[valor_origem] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_cooperado_lancamento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_saldo_devedor] [bigint] NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_cooperado_lancamento] [varchar](500) NULL,
	[pk_importacao_fk_convenio] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse] [varchar](500) NULL,
	[pk_importacao_fk_saldo_devedor] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web_fk_saldo_devedor] [varchar](500) NULL,
	[pk_importacao_web_fk_repasse] [varchar](500) NULL,
	[cd_federativo_temp_fk_lancamento_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_saldo_devedor] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_calculado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_repasse_calculado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[natureza_contabil] [int] NULL,
	[percentual_inss] [numeric](19, 2) NULL,
	[processa_saldo_devedor] [bit] NULL,
	[tipo_demonstrativo] [int] NULL,
	[tipo_lancamento_repasse] [int] NULL,
	[tipo_servico] [int] NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[valor_origem] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_cooperado_lancamento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_saldo_devedor] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_repasse_controle_saldo_devedor]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_controle_saldo_devedor](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_inicial_saldo_devedor] [numeric](19, 2) NULL,
	[valor_pago_saldo_devedor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_repasse_calculado] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_controle_saldo_devedor_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_repasse_controle_saldo_devedor_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_inicial_saldo_devedor] [numeric](19, 2) NULL,
	[valor_pago_saldo_devedor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_repasse_calculado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_repasse_conversao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_conversao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_conversao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_repasse_conversao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_repasse_credito]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_credito](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_pagamento] [date] NULL,
	[foi_gerado_CNAB] [bit] NULL,
	[valor_credito] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_credito_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_repasse_credito_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_pagamento] [date] NULL,
	[foi_gerado_CNAB] [bit] NULL,
	[valor_credito] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_repasse_dependente]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_dependente](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[desconto_pensao_sobre] [int] NULL,
	[percentual_desconto_pensao] [numeric](19, 2) NULL,
	[tipo_desconto_pensao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade_cooperado_dependente] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_dependente_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_dependente_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade_cooperado_dependente] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[desconto_pensao_sobre] [int] NULL,
	[percentual_desconto_pensao] [numeric](19, 2) NULL,
	[tipo_desconto_pensao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_lancamento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_lancamento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_lancamento] [datetime2](7) NULL,
	[desconto_hospitalar] [numeric](19, 2) NULL,
	[tipo_servico] [int] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_cooperado_lancamento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_lancamento_repasse_eventual] [bigint] NULL,
	[fk_pagamento_fatura] [bigint] NULL,
	[fk_pagamento_procedimento] [bigint] NULL,
	[fk_participante_composicao_servico_especial] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[pk_importacao_fk_procedimento] [varchar](255) NULL,
	[pk_importacao_fk_fatura] [varchar](255) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_hospital] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse_eventual] [varchar](500) NULL,
	[pk_importacao_fk_cooperado_lancamento] [varchar](500) NULL,
	[pk_importacao_fk_convenio] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse] [varchar](500) NULL,
	[pk_importacao_fk_pagamento_fatura] [varchar](500) NULL,
	[fk_pagamento_espelho] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_fk_espelho] [varchar](255) NULL,
	[pk_importacao_web_fk_repasse] [varchar](500) NULL,
	[pk_importacao_web_fk_lancamento_repasse_eventual] [varchar](500) NULL,
	[cd_federativo_temp_fk_lancamento_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_lancamento_repasse_eventual] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_lancamento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_repasse_lancamento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_lancamento] [datetime2](7) NULL,
	[desconto_hospitalar] [numeric](19, 2) NULL,
	[tipo_servico] [int] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_cooperado_lancamento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_lancamento_repasse_eventual] [bigint] NULL,
	[fk_pagamento_fatura] [bigint] NULL,
	[fk_pagamento_procedimento] [bigint] NULL,
	[fk_participante_composicao_servico_especial] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_pagamento_espelho] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_repasse_memoria_calculo]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_repasse_memoria_calculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aliquota_ir_repasse] [numeric](19, 2) NULL,
	[aliquota_ir_temp_repasse] [numeric](19, 2) NULL,
	[base_bruta_total_mes] [numeric](19, 2) NULL,
	[base_calculo_bruto_ir_repasse] [numeric](19, 2) NULL,
	[base_calculo_liquido_ir_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_bruto_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_ir_inss_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_ir_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_liquido_repasse] [numeric](19, 2) NULL,
	[base_ir_temp_repasse] [numeric](19, 2) NULL,
	[liquido_repasse] [numeric](19, 2) NULL,
	[parcela_deducao_ir_repasse] [numeric](19, 2) NULL,
	[parcela_deducao_ir_temp_repasse] [numeric](19, 2) NULL,
	[valor_credito_total_mes] [numeric](19, 2) NULL,
	[valor_credito_total_repasse] [numeric](19, 2) NULL,
	[valor_debito_total_mes] [numeric](19, 2) NULL,
	[valor_debito_total_repasse] [numeric](19, 2) NULL,
	[valor_dependente_total_mes] [numeric](19, 2) NULL,
	[valor_inss_repasse] [numeric](19, 2) NULL,
	[valor_inss_total_mes] [numeric](19, 2) NULL,
	[valor_ir_repasse] [numeric](19, 2) NULL,
	[valor_ir_temp_repasse] [numeric](19, 2) NULL,
	[valor_ir_total_mes] [numeric](19, 2) NULL,
	[valor_pensao_repasse] [numeric](19, 2) NULL,
	[valor_pensao_total_mes] [numeric](19, 2) NULL,
	[valor_recebido_total_mes] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[pk_importacao_fk_cooperado] [varchar](500) NULL,
	[pk_importacao_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[valor_demonstrativo_cooperado_total_mes] [numeric](19, 2) NULL,
	[valor_demonstrativo_cooperado_total_repasse] [numeric](19, 2) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_repasse] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_repasse_memoria_calculo_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_repasse_memoria_calculo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aliquota_ir_repasse] [numeric](19, 2) NULL,
	[aliquota_ir_temp_repasse] [numeric](19, 2) NULL,
	[base_bruta_total_mes] [numeric](19, 2) NULL,
	[base_calculo_bruto_ir_repasse] [numeric](19, 2) NULL,
	[base_calculo_liquido_ir_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_bruto_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_ir_inss_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_ir_repasse] [numeric](19, 2) NULL,
	[base_calculo_pensao_liquido_repasse] [numeric](19, 2) NULL,
	[base_ir_temp_repasse] [numeric](19, 2) NULL,
	[liquido_repasse] [numeric](19, 2) NULL,
	[parcela_deducao_ir_repasse] [numeric](19, 2) NULL,
	[parcela_deducao_ir_temp_repasse] [numeric](19, 2) NULL,
	[valor_credito_total_mes] [numeric](19, 2) NULL,
	[valor_credito_total_repasse] [numeric](19, 2) NULL,
	[valor_debito_total_mes] [numeric](19, 2) NULL,
	[valor_debito_total_repasse] [numeric](19, 2) NULL,
	[valor_dependente_total_mes] [numeric](19, 2) NULL,
	[valor_inss_repasse] [numeric](19, 2) NULL,
	[valor_inss_total_mes] [numeric](19, 2) NULL,
	[valor_ir_repasse] [numeric](19, 2) NULL,
	[valor_ir_temp_repasse] [numeric](19, 2) NULL,
	[valor_ir_total_mes] [numeric](19, 2) NULL,
	[valor_pensao_repasse] [numeric](19, 2) NULL,
	[valor_pensao_total_mes] [numeric](19, 2) NULL,
	[valor_recebido_total_mes] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[valor_demonstrativo_cooperado_total_mes] [numeric](19, 2) NULL,
	[valor_demonstrativo_cooperado_total_repasse] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_saldo_devedor]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_saldo_devedor](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[valor_inicio] [numeric](19, 2) NULL,
	[valor_pago] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[pk_importacao_fk_cooperado] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web] [varchar](255) NULL,
	[cd_federativo_temp_fk_lancamento_repasse] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_saldo_devedor_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_saldo_devedor_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[valor_inicio] [numeric](19, 2) NULL,
	[valor_pago] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_saldo_repasse_fixo]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_saldo_repasse_fixo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_saldo] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_servico_especial] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_saldo_repasse_fixo_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_saldo_repasse_fixo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor_saldo] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_servico_especial] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_seguranca_entidade_perfil_acesso]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_seguranca_entidade_perfil_acesso](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[idFuncao] [bigint] NULL,
	[tipoFuncao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_perfil_acesso] [bigint] NULL,
	[fk_entidade_usuario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_seguranca_entidade_perfil_acesso_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_seguranca_entidade_perfil_acesso_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[idFuncao] [bigint] NULL,
	[tipoFuncao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_perfil_acesso] [bigint] NULL,
	[fk_entidade_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_termo_aditivo_grupo_despesa]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_termo_aditivo_grupo_despesa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[Valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_grupo_despesa] [bigint] NULL,
	[fk_termo_aditivo] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_fk_grupo_despesa] [varchar](500) NULL,
	[pk_importacao_web_fk_termo_aditivo] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_termo_aditivo_grupo_despesa_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_termo_aditivo_grupo_despesa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[Valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_grupo_despesa] [bigint] NULL,
	[fk_termo_aditivo] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rl_usuario_horario_trabalho]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rl_usuario_horario_trabalho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_horario_trabalho] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rl_usuario_horario_trabalho_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rl_usuario_horario_trabalho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_horario_trabalho] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tabela_honorarios_temp_importacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tabela_honorarios_temp_importacao](
	[discriminator] [varchar](31) NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_acareacao_inss]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_acareacao_inss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_recolhimento] [datetime2](7) NULL,
	[mes_ano] [varchar](255) NULL,
	[percentual] [numeric](19, 2) NULL,
	[repasse_web] [varchar](255) NULL,
	[valor_base_inss] [numeric](19, 2) NULL,
	[valor_diferenca] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[valor_inss_diferenca] [numeric](19, 2) NULL,
	[valor_previsto] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse_eventual] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_acareacao_inss_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_acareacao_inss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_recolhimento] [datetime2](7) NULL,
	[mes_ano] [varchar](255) NULL,
	[percentual] [numeric](19, 2) NULL,
	[repasse_web] [varchar](255) NULL,
	[valor_base_inss] [numeric](19, 2) NULL,
	[valor_diferenca] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[valor_inss_diferenca] [numeric](19, 2) NULL,
	[valor_previsto] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse_eventual] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_adequacao_unimed]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_adequacao_unimed](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_competencia] [datetime2](7) NULL,
	[motivo] [varchar](255) NULL,
	[valor_adequacao] [numeric](19, 2) NULL,
	[valor_item_despesa] [numeric](19, 2) NULL,
	[valor_pagamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_adequacao_unimed_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_adequacao_unimed_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_competencia] [datetime2](7) NULL,
	[motivo] [varchar](255) NULL,
	[valor_adequacao] [numeric](19, 2) NULL,
	[valor_item_despesa] [numeric](19, 2) NULL,
	[valor_pagamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_agendamento_dirf]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_agendamento_dirf](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ordenacao] [bigint] NULL,
	[pendente] [bit] NULL,
	[status] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_processamento_dirf] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_agendamento_dirf_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_agendamento_dirf_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ordenacao] [bigint] NULL,
	[pendente] [bit] NULL,
	[status] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_processamento_dirf] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_retorno_convenio]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_retorno_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[campo_comparacao] [varchar](255) NULL,
	[status_processamento] [int] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_retorno_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_retorno_convenio_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_retorno_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[campo_comparacao] [varchar](255) NULL,
	[status_processamento] [int] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_retorno_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_geracao] [datetime2](7) NULL,
	[tipoGeracaoTiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[numero_lote] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_geracao] [datetime2](7) NULL,
	[tipoGeracaoTiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[numero_lote] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado_erro]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado_erro](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arquivo_tiss_gerado] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado_erro_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado_erro_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arquivo_tiss_gerado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado_file]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado_file](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arquivo_tiss_gerado] [bigint] NULL,
	[descricao] [varchar](255) NULL,
	[tipo_arquivo_tiss] [int] NULL,
	[total_atendimentos] [bigint] NULL,
	[total_despesas] [bigint] NULL,
	[valor_total] [numeric](19, 2) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado_file_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado_file_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arquivo_tiss_gerado] [bigint] NULL,
	[descricao] [varchar](255) NULL,
	[tipo_arquivo_tiss] [int] NULL,
	[total_atendimentos] [bigint] NULL,
	[total_despesas] [bigint] NULL,
	[valor_total] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado_filtro]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado_filtro](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[numero] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arquivo_tiss_gerado] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arquivo_tiss_gerado_filtro_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_arquivo_tiss_gerado_filtro_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[numero] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arquivo_tiss_gerado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_arvore_funcao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arvore_funcao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arvore_funcao_pai] [bigint] NULL,
	[fk_url] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_arvore_funcao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_arvore_funcao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_arvore_funcao_pai] [bigint] NULL,
	[fk_url] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_atendimento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_atendimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ano_atendimento] [int] NULL,
	[data_alta] [date] NULL,
	[data_cadastro] [date] NULL,
	[data_entrega] [date] NULL,
	[data_internacao] [date] NULL,
	[data_validade] [date] NULL,
	[faturar] [bit] NULL,
	[guia_principal] [varchar](255) NULL,
	[guia_solicitacao_internacao] [varchar](255) NULL,
	[hora_alta] [time](7) NULL,
	[hora_internacao] [time](7) NULL,
	[hospital_dia] [bit] NULL,
	[matricula_paciente] [varchar](255) NULL,
	[numero_atendimento_automatico] [bigint] NULL,
	[numero_guia] [varchar](255) NULL,
	[numero_importacao] [bigint] NULL,
	[paciente] [varchar](255) NULL,
	[plano] [varchar](255) NULL,
	[rn] [bit] NULL,
	[senha] [varchar](255) NULL,
	[situacaoAtendimento] [int] NULL,
	[valor_total_atendimento] [numeric](19, 2) NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_hospital] [bigint] NOT NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
	[fk_motivo_alta] [bigint] NULL,
	[fk_tipo_atendimento] [bigint] NULL,
	[fk_num_aten_temp] [bigint] NULL,
	[fk_entidade_temp] [bigint] NULL,
	[fk_hospital_fk_entidade_hospital] [varchar](500) NULL,
	[fk_entidade_fk_entidade_hospital] [varchar](500) NULL,
	[pk_importacao_fk_complemento] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_atendimento] [varchar](500) NULL,
	[pk_importacao_fk_tipo_atendimento] [varchar](500) NULL,
	[fk_entidade_fk_convenio] [varchar](500) NULL,
	[fk_convenio_fk_convenio] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_motivo_alta] [varchar](500) NULL,
	[pk_importacao_fk_motivo_alta] [varchar](500) NULL,
	[pk_importacao_fk_espelho] [varchar](500) NULL,
	[pk_importacao_fk_hospital] [varchar](500) NULL,
	[autorizado_unimed] [bit] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[anoFoiAlterado] [bit] NULL,
	[valorDigitados] [numeric](19, 2) NULL,
	[valorEspelhados] [numeric](19, 2) NULL,
	[valorExcluidos] [numeric](19, 2) NULL,
	[valorFaturados] [numeric](19, 2) NULL,
	[valorPagos] [numeric](19, 2) NULL,
	[valorRepassados] [numeric](19, 2) NULL,
	[valorglosados] [numeric](19, 2) NULL,
	[numero_guia_origem_tiss] [bit] NULL,
	[hora_digitacao] [datetime2](7) NULL,
	[sql_update] [varchar](255) NULL,
	[fk_integracao_unimed] [bigint] NULL,
	[cid] [varchar](255) NULL,
	[total_atendimento] [varchar](255) NULL,
	[fk_entidade_fk_complemento] [varchar](500) NULL,
	[fk_com_con_fk_complemento] [varchar](500) NULL,
	[fk_convenio_fk_complemento] [varchar](500) NULL,
	[fk_entidade_fk_espelho] [varchar](500) NULL,
	[fk_num_fat_fk_espelho] [varchar](500) NULL,
	[numero_atendimento_automatico_anterior] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_atendimento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_atendimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ano_atendimento] [int] NULL,
	[data_alta] [date] NULL,
	[data_cadastro] [date] NULL,
	[data_entrega] [date] NULL,
	[data_internacao] [date] NULL,
	[data_validade] [date] NULL,
	[faturar] [bit] NULL,
	[guia_principal] [varchar](255) NULL,
	[guia_solicitacao_internacao] [varchar](255) NULL,
	[hora_alta] [time](7) NULL,
	[hora_internacao] [time](7) NULL,
	[hospital_dia] [bit] NULL,
	[matricula_paciente] [varchar](255) NULL,
	[numero_atendimento_automatico] [bigint] NULL,
	[numero_guia] [varchar](255) NULL,
	[numero_importacao] [bigint] NULL,
	[paciente] [varchar](255) NULL,
	[plano] [varchar](255) NULL,
	[rn] [bit] NULL,
	[senha] [varchar](255) NULL,
	[situacaoAtendimento] [int] NULL,
	[valor_total_atendimento] [numeric](19, 2) NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
	[fk_motivo_alta] [bigint] NULL,
	[fk_tipo_atendimento] [bigint] NULL,
	[autorizado_unimed] [bit] NULL,
	[valorDigitados] [numeric](19, 2) NULL,
	[valorEspelhados] [numeric](19, 2) NULL,
	[valorExcluidos] [numeric](19, 2) NULL,
	[valorFaturados] [numeric](19, 2) NULL,
	[valorPagos] [numeric](19, 2) NULL,
	[valorRepassados] [numeric](19, 2) NULL,
	[valorglosados] [numeric](19, 2) NULL,
	[numero_guia_origem_tiss] [bit] NULL,
	[hora_digitacao] [datetime2](7) NULL,
	[fk_integracao_unimed] [bigint] NULL,
	[cid] [varchar](255) NULL,
	[total_atendimento] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_atendimento_integracao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_atendimento_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[ano_atendimento] [int] NULL,
	[data_alta] [date] NULL,
	[data_cadastro] [date] NULL,
	[data_entrega] [date] NULL,
	[data_internacao] [date] NULL,
	[data_validade] [date] NULL,
	[guia_principal] [varchar](255) NULL,
	[guia_solicitacao_internacao] [varchar](255) NULL,
	[hora_alta] [time](7) NULL,
	[hora_internacao] [time](7) NULL,
	[hospital_dia] [bit] NULL,
	[matricula_paciente] [varchar](255) NULL,
	[numero_atendimento_automatico] [bigint] NULL,
	[numero_guia] [varchar](255) NULL,
	[numero_importacao] [bigint] NULL,
	[paciente] [varchar](255) NULL,
	[plano] [varchar](255) NULL,
	[rn] [bit] NULL,
	[senha] [varchar](255) NULL,
	[sequencial] [bigint] NULL,
	[situacaoAtendimento] [int] NULL,
	[valor_total_atendimento] [numeric](19, 2) NULL,
	[versao_tiss] [int] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_integracao] [bigint] NULL,
	[fk_motivo_alta] [bigint] NULL,
	[fk_tipo_atendimento] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_num_aten_temp] [varchar](255) NULL,
	[fk_entidade_temp] [varchar](255) NULL,
	[pk_importacao_fk_motivo_alta] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_motivo_alta] [varchar](500) NULL,
	[fk_com_con_fk_complemento] [varchar](500) NULL,
	[fk_convenio_fk_complemento] [varchar](500) NULL,
	[fk_entidade_fk_complemento] [varchar](500) NULL,
	[fk_entidade_fk_entidade_hospital] [varchar](500) NULL,
	[fk_hospital_fk_entidade_hospital] [varchar](500) NULL,
	[pk_importacao_fk_hospital] [varchar](500) NULL,
	[pk_importacao_fk_tipo_atendimento] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_atendimento] [varchar](500) NULL,
	[pk_importacao_fk_integracao] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_integracao] [varchar](500) NULL,
	[fk_convenio_fk_convenio] [varchar](500) NULL,
	[fk_entidade_fk_convenio] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_atendimento_integracao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_atendimento_integracao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_integracao] [bigint] NULL,
	[fk_tipo_atendimento] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_aviso_sistema]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_aviso_sistema](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_hora_fim] [datetime2](7) NULL,
	[data_hora_inicio] [datetime2](7) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[tipo_aviso_sus] [int] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_aviso_sistema_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_aviso_sistema_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_hora_fim] [datetime2](7) NULL,
	[data_hora_inicio] [datetime2](7) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[tipo_aviso_sus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_banco]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_banco](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[numero_banco] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_banco_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_banco_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[numero_banco] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_beneficiario_dados]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_beneficiario_dados](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[atendimentoRN] [int] NOT NULL,
	[nome_beneficiario] [varchar](70) NOT NULL,
	[numeroCNS] [varchar](15) NULL,
	[numero_carteira] [varchar](20) NOT NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_beneficiario_dados_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_beneficiario_dados_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[atendimentoRN] [int] NULL,
	[nome_beneficiario] [varchar](70) NULL,
	[numeroCNS] [varchar](15) NULL,
	[numero_carteira] [varchar](20) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_campo_fixo_digitacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_campo_fixo_digitacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_alta] [date] NULL,
	[data_entrega] [date] NULL,
	[data_inicio_atendimento] [date] NULL,
	[data_internacao] [date] NULL,
	[data_realizacao] [date] NULL,
	[data_termino_atendimento] [date] NULL,
	[data_validade] [date] NULL,
	[desconto_hospitalar] [bit] NULL,
	[forcar_atendimento] [bit] NULL,
	[forma_execucao] [int] NULL,
	[guia] [varchar](255) NULL,
	[guia_principal] [varchar](255) NULL,
	[guia_procedimento] [varchar](255) NULL,
	[guia_solicitacao_internacao] [varchar](255) NULL,
	[hora_alta] [time](7) NULL,
	[hora_final_procedimento] [time](7) NULL,
	[hora_inicial_procedimento] [time](7) NULL,
	[hora_internacao] [time](7) NULL,
	[hospital_dia] [bit] NULL,
	[matricula_paciente] [varchar](255) NULL,
	[paciente] [varchar](255) NULL,
	[plano] [varchar](255) NULL,
	[quantidade] [bigint] NULL,
	[recem_nascido] [bit] NULL,
	[registro_ativo] [bit] NULL,
	[senha] [varchar](255) NULL,
	[tipo_item_despesa] [int] NULL,
	[tuss] [bit] NULL,
	[urgencia] [bit] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_cooperado_executante] [bigint] NULL,
	[fk_cooperado_recebedor] [bigint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_cooperado_especialidade] [bigint] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_motivo_alta] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
	[fk_tecnica] [bigint] NULL,
	[fk_tipo_atendimento] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_unidade_medida] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_via_acesso] [bigint] NULL,
	[fixar_complemento] [bit] NULL,
	[fixar_plano] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[cbo] [varchar](255) NULL,
	[cid] [varchar](255) NULL,
	[fk_tipo_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_campo_fixo_digitacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_campo_fixo_digitacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_entidade_cooperado_especialidade] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_campos_fixos_integracao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_campos_fixos_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_complemento] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_campos_fixos_integracao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_campos_fixos_integracao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_carta_glosa]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_carta_glosa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_emissao] [date] NULL,
	[data_envio] [date] NULL,
	[data_vencimento] [date] NULL,
	[marcado_como_enviado] [bit] NULL,
	[numero_carta] [bigint] NULL,
	[observacao] [varchar](700) NULL,
	[protocolo_operadora] [varchar](12) NULL,
	[texto_inicializacao] [varchar](700) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[codEntidade_temp] [varchar](255) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_espelho] [varchar](500) NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_entidade_fk_espelho] [varchar](500) NULL,
	[fk_convenio_fk_espelho] [varchar](500) NULL,
	[fk_num_fat_fk_espelho] [varchar](500) NULL,
	[numero_lote_tiss] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_carta_glosa_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_carta_glosa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_emissao] [date] NULL,
	[data_envio] [date] NULL,
	[data_vencimento] [date] NULL,
	[marcado_como_enviado] [bit] NULL,
	[numero_carta] [bigint] NULL,
	[observacao] [varchar](700) NULL,
	[protocolo_operadora] [varchar](12) NULL,
	[texto_inicializacao] [varchar](700) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[numero_lote_tiss] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_caso_de_uso]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_caso_de_uso](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_modulo] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_caso_de_uso_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_caso_de_uso_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_modulo] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ch]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ch](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[valor_coeficiente_honorario] [numeric](19, 4) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ch_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ch_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[valor_coeficiente_honorario] [numeric](19, 4) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cid]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cid](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cid_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cid_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cidade]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cidade](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[numero_ibge] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_uf_fencom] [bigint] NULL,
	[descricao_fk_uf_fencom] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cidade_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cidade_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[numero_ibge] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_uf_fencom] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_complexidade]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_complexidade](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_complexidade_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_complexidade_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_composicao_servico_especial]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_composicao_servico_especial](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_final] [datetime2](7) NULL,
	[data_inclusao] [datetime2](7) NULL,
	[data_inicial] [datetime2](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_servico_especial] [bigint] NULL,
	[fk_servico_especial_temp] [bigint] NULL,
	[id_temporario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_entidade_importacao] [int] NULL,
	[discriminator_fk_servico_especial] [varchar](500) NULL,
	[pk_importacao_fk_servico_especial] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_composicao_servico_especial_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_composicao_servico_especial_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_final] [datetime2](7) NULL,
	[data_inclusao] [datetime2](7) NULL,
	[data_inicial] [datetime2](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_servico_especial] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_configuracao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_configuracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ultimo_id_cooperado] [bigint] NULL,
	[ultimo_id_inss] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sincroniza_cooperado] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_configuracao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_configuracao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ultimo_id_cooperado] [bigint] NULL,
	[ultimo_id_inss] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sincroniza_cooperado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_configuracao_digitacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_configuracao_digitacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[campo_digitacao] [int] NULL,
	[obrigatorio] [bit] NULL,
	[observacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_digitacao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_configuracao_digitacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_configuracao_digitacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ativo] [bit] NULL,
	[campo_digitacao] [int] NULL,
	[obrigatorio] [bit] NULL,
	[observacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_digitacao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_contratado_dados]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_contratado_dados](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnpj_contratado] [varchar](14) NULL,
	[codigo_prestador_operadora] [varchar](14) NULL,
	[cpf_contratado] [varchar](11) NULL,
	[nome_contratado] [varchar](70) NOT NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_contratado_dados_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_contratado_dados_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnpj_contratado] [varchar](14) NULL,
	[codigo_prestador_operadora] [varchar](14) NULL,
	[cpf_contratado] [varchar](11) NULL,
	[nome_contratado] [varchar](70) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_contratado_profissional_dados]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_contratado_profissional_dados](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cbos] [int] NOT NULL,
	[uf] [int] NOT NULL,
	[conselho_profissional] [int] NOT NULL,
	[nome_profissional] [varchar](70) NOT NULL,
	[numero_conselho_profissional] [varchar](15) NOT NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_contratado_profissional_dados_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_contratado_profissional_dados_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cbos] [int] NULL,
	[uf] [int] NULL,
	[conselho_profissional] [int] NULL,
	[nome_profissional] [varchar](70) NULL,
	[numero_conselho_profissional] [varchar](15) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_convenio]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnes] [varchar](255) NULL,
	[cnpj] [varchar](255) NULL,
	[codigo_ans] [varchar](255) NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[observacao] [varchar](1000) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo_empresa] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_lancamento_repasse_complemento_honorario] [bigint] NULL,
	[fk_lancamento_repasse_estorno_adequacao] [bigint] NULL,
	[fk_lancamento_repasse_servico_adicional] [bigint] NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_convenio_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnes] [varchar](255) NULL,
	[cnpj] [varchar](255) NULL,
	[codigo_ans] [varchar](255) NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[observacao] [varchar](1000) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo_empresa] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_lancamento_repasse_complemento_honorario] [bigint] NULL,
	[fk_lancamento_repasse_estorno_adequacao] [bigint] NULL,
	[fk_lancamento_repasse_servico_adicional] [bigint] NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_acomodacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_acomodacao](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_acomodacao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_entidade_temp] [varchar](50) NULL,
	[fk_acomodacao_temp] [varchar](50) NULL,
	[fk_entidade_cooperado_conversao_temp] [varchar](50) NULL,
	[pk_importacao_fk_entidade_cooperado_conversao] [varchar](500) NULL,
	[pk_importacao_entidade_temp_fk_entidade_acomodacao] [varchar](500) NULL,
	[pk_importacao_fk_entidade_acomodacao] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_acomodacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_acomodacao_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_acomodacao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_convenio]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_convenio](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_convenio_temp] [varchar](50) NULL,
	[fk_entidade_temp] [varchar](50) NULL,
	[fk_entidade_cooperado_conversao_temp] [varchar](50) NULL,
	[pk_importacao_fk_entidade_cooperado_conversao] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_convenio_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_convenio_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_grau_participacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_grau_participacao](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_entidade_grau_participacao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_grau_participacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_grau_participacao_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_entidade_grau_participacao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_hospital]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_hospital](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_hospital_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_hospital_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_internacao]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_internacao](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_internacao_preenchida_atendimento] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_internacao_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_internacao_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_procedimento]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_procedimento](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[tuss] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
	[fk_codigo_item_despesa_temp] [varchar](50) NULL,
	[fk_descricao_item_despesa_temp] [varchar](255) NULL,
	[fk_entidade_cooperado_conversao_temp] [varchar](50) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_conversao_procedimento_AUD]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_conversao_procedimento_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_cooperado_conversao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cooperado]    Script Date: 16/06/2017 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cooperado](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_unimed] [varchar](255) NULL,
	[cooperado_padrao_integracao] [bit] NULL,
	[cooperado_padrao_unimed] [bit] NULL,
	[cpf_cnpj] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[numero_conselho] [varchar](255) NULL,
	[observacao] [varchar](1000) NULL,
	[senha_portal] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[cns] [varchar](255) NULL,
	[data_nascimento] [datetime2](7) NULL,
	[estado_civil] [int] NULL,
	[inscricao_inss] [varchar](255) NULL,
	[nome_mae] [varchar](255) NULL,
	[numero_iss] [varchar](255) NULL,
	[rg] [varchar](255) NULL,
	[sexo] [int] NULL,
	[descontar_hospital_pessoa_fisica] [bit] NULL,
	[tipo_servico] [int] NULL,
	[verificar_data_realizacao] [bit] NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_conselho_profissional] [bigint] NULL,
	[fk_uf] [bigint] NULL,
	[fk_nacionalidade] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_especialidade] [bigint] NULL,
	[pk_importacao_fk_nacionalidade] [varchar](500) NULL,
	[username] [varchar](255) NULL,
	[cooperado_estrangeiro_numero_rne] [bigint] NULL,
	[cooperado_estrangeiro_casado_com_brasileiro] [int] NULL,
	[cooperado_estrangeiro_chegada_ao_brasil] [datetime2](7) NULL,
	[cooperado_estrangeiro_data_de_emissao] [datetime2](7) NULL,
	[cooperado_estrangeiro_naturalizacao] [datetime2](7) NULL,
	[cooperado_estrangeiro_orgao_emissor_rne] [int] NULL,
	[cooperado_estrangeiro_possui_filhos_brasileiros] [int] NULL,
	[data_emissao] [datetime2](7) NULL,
	[deficiencia_auditiva] [int] NULL,
	[deficiencia_fisica] [int] NULL,
	[deficiencia_intelectual] [int] NULL,
	[deficiencia_mental] [int] NULL,
	[deficiencia_visual] [int] NULL,
	[estado_de_nascimento] [varchar](255) NULL,
	[grau_de_instrucao] [int] NULL,
	[municipio] [varchar](255) NULL,
	[nome_pai] [varchar](255) NULL,
	[orgao_emissor] [int] NULL,
	[pis] [bigint] NULL,
	[raca_cor] [int] NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_nascimento_uf] [bigint] NULL,
	[id_temporario] [bigint] NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[data_emissao_conselho] [datetime2](7) NULL,
	[orgao_emissor_conselho] [int] NULL,
	[fk_pais] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[matricula] [varchar](255) NULL,
	[pk_importacao_fk_especialidade] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_especialidade] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cooperado_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cooperado_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_conselho_profissional] [bigint] NULL,
	[fk_uf] [bigint] NULL,
	[cns] [varchar](255) NULL,
	[data_nascimento] [datetime2](7) NULL,
	[estado_civil] [int] NULL,
	[inscricao_inss] [varchar](255) NULL,
	[nome_mae] [varchar](255) NULL,
	[numero_iss] [varchar](255) NULL,
	[rg] [varchar](255) NULL,
	[sexo] [int] NULL,
	[fk_nacionalidade] [bigint] NULL,
	[descontar_hospital_pessoa_fisica] [bit] NULL,
	[tipo_servico] [int] NULL,
	[verificar_data_realizacao] [bit] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_especialidade] [bigint] NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[cooperado_estrangeiro_numero_rne] [bigint] NULL,
	[cooperado_estrangeiro_casado_com_brasileiro] [int] NULL,
	[cooperado_estrangeiro_chegada_ao_brasil] [datetime2](7) NULL,
	[cooperado_estrangeiro_data_de_emissao] [datetime2](7) NULL,
	[cooperado_estrangeiro_naturalizacao] [datetime2](7) NULL,
	[cooperado_estrangeiro_orgao_emissor_rne] [int] NULL,
	[cooperado_estrangeiro_possui_filhos_brasileiros] [int] NULL,
	[data_emissao] [datetime2](7) NULL,
	[deficiencia_auditiva] [int] NULL,
	[deficiencia_fisica] [int] NULL,
	[deficiencia_intelectual] [int] NULL,
	[deficiencia_mental] [int] NULL,
	[deficiencia_visual] [int] NULL,
	[estado_de_nascimento] [varchar](255) NULL,
	[grau_de_instrucao] [int] NULL,
	[municipio] [varchar](255) NULL,
	[nome_pai] [varchar](255) NULL,
	[orgao_emissor] [int] NULL,
	[pis] [bigint] NULL,
	[raca_cor] [int] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_nascimento_uf] [bigint] NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
	[data_emissao_conselho] [datetime2](7) NULL,
	[orgao_emissor_conselho] [int] NULL,
	[fk_pais] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_correspondencia_endereco]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_correspondencia_endereco](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_endereco] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_correspondencia_endereco_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_correspondencia_endereco_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_dados_complementares]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dados_complementares](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[conselho_autorizado] [varchar](255) NULL,
	[data_autorizacao] [date] NULL,
	[data_fatura_hospital] [date] NULL,
	[data_validade_senha] [date] NULL,
	[indicador_doenca] [int] NULL,
	[informacoes_complementares] [varchar](255) NULL,
	[matricula_segurado] [varchar](255) NULL,
	[nome_segurado] [varchar](255) NULL,
	[numero_atendimento_hospital] [varchar](255) NULL,
	[numero_controle_hospital] [varchar](255) NULL,
	[numero_fatura_hospital] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[setor_hospital] [varchar](255) NULL,
	[tempo_doenca] [int] NULL,
	[tipo_autorizacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao_autorizada] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_indicador_acidente] [bigint] NULL,
	[fk_tipo_consulta] [bigint] NULL,
	[fk_tipo_espelho] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_uf_crm] [bigint] NULL,
	[descricao_acomodacao_temp] [varchar](255) NULL,
	[pk_importacao_fk_atendimento] [varchar](500) NULL,
	[sigla_fk_uf_crm] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_uf_crm] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_consulta] [varchar](500) NULL,
	[pk_importacao_fk_tipo_consulta] [varchar](500) NULL,
	[fk_convenio_fk_tipo_espelho] [varchar](500) NULL,
	[pk_importacao_fk_tipo_espelho] [varchar](500) NULL,
	[fk_entidade_fk_tipo_espelho] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_guia] [varchar](500) NULL,
	[pk_importacao_fk_tipo_guia] [varchar](500) NULL,
	[pk_importacao_entidade_temp_fk_acomodacao_autorizada] [varchar](500) NULL,
	[pk_importacao_fk_acomodacao_autorizada] [varchar](500) NULL,
	[codigo_ans_duplicado_fk_acomodacao_autorizada] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_indicador_acidente] [varchar](500) NULL,
	[pk_importacao_fk_indicador_acidente] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[codPes_temp_fk_atendimento] [varchar](500) NULL,
	[fk_num_aten_fk_atendimento] [varchar](500) NULL,
	[pk_importacao_fk_uf_crm] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_dados_complementares_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dados_complementares_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[conselho_autorizado] [varchar](255) NULL,
	[data_autorizacao] [date] NULL,
	[data_fatura_hospital] [date] NULL,
	[data_validade_senha] [date] NULL,
	[indicador_doenca] [int] NULL,
	[informacoes_complementares] [varchar](255) NULL,
	[matricula_segurado] [varchar](255) NULL,
	[nome_segurado] [varchar](255) NULL,
	[numero_atendimento_hospital] [varchar](255) NULL,
	[numero_controle_hospital] [varchar](255) NULL,
	[numero_fatura_hospital] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[setor_hospital] [varchar](255) NULL,
	[tempo_doenca] [int] NULL,
	[tipo_autorizacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao_autorizada] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_indicador_acidente] [bigint] NULL,
	[fk_tipo_consulta] [bigint] NULL,
	[fk_tipo_espelho] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_uf_crm] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_dados_complementares_integracao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dados_complementares_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[conselho_autorizado] [varchar](255) NULL,
	[data_autorizacao] [date] NULL,
	[data_fatura_hospital] [date] NULL,
	[data_validade_senha] [date] NULL,
	[indicador_doenca] [int] NULL,
	[informacoes_complementares] [varchar](255) NULL,
	[matricula_segurado] [varchar](255) NULL,
	[nome_segurado] [varchar](255) NULL,
	[numero_atendimento_hospital] [varchar](255) NULL,
	[numero_controle_hospital] [varchar](255) NULL,
	[numero_fatura_hospital] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[setor_hospital] [varchar](255) NULL,
	[tempo_doenca] [int] NULL,
	[tipo_autorizacao] [varchar](255) NULL,
	[fk_acomodacao_autorizada] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_indicador_acidente] [bigint] NULL,
	[fk_tipo_consulta] [bigint] NULL,
	[fk_tipo_espelho] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_uf_crm] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[descricao_acomodacao_temp] [varchar](255) NULL,
	[pk_importacao_fk_tipo_consulta] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_consulta] [varchar](500) NULL,
	[pk_importacao_fk_indicador_acidente] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_indicador_acidente] [varchar](500) NULL,
	[pk_importacao_fk_tipo_espelho] [varchar](500) NULL,
	[fk_convenio_fk_tipo_espelho] [varchar](500) NULL,
	[fk_entidade_fk_tipo_espelho] [varchar](500) NULL,
	[pk_importacao_fk_tipo_guia] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_guia] [varchar](500) NULL,
	[pk_importacao_fk_uf_crm] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_uf_crm] [varchar](500) NULL,
	[pk_importacao_fk_acomodacao_autorizada] [varchar](500) NULL,
	[pk_importacao_entidade_temp_fk_acomodacao_autorizada] [varchar](500) NULL,
	[codigo_ans_duplicado_fk_acomodacao_autorizada] [varchar](500) NULL,
	[codPes_temp_fk_atendimento] [varchar](500) NULL,
	[fk_num_aten_fk_atendimento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_dados_complementares_integracao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dados_complementares_integracao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_acomodacao_autorizada] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_indicador_acidente] [bigint] NULL,
	[fk_tipo_consulta] [bigint] NULL,
	[fk_tipo_espelho] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_uf_crm] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_dados_solicitacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dados_solicitacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cid_solicitacao] [varchar](255) NULL,
	[data_solicitacao] [datetime2](7) NULL,
	[indicacao_clinica] [varchar](255) NULL,
	[quantidade_autorizada] [bigint] NULL,
	[quantidade_solicitada] [bigint] NULL,
	[urgencia] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_cooperado_solicitante] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_tabela_ans] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_dados_solicitacao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dados_solicitacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cid_solicitacao] [varchar](255) NULL,
	[data_solicitacao] [datetime2](7) NULL,
	[indicacao_clinica] [varchar](255) NULL,
	[quantidade_autorizada] [bigint] NULL,
	[quantidade_solicitada] [bigint] NULL,
	[urgencia] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_cooperado_solicitante] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_tabela_ans] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_darf]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_darf](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acao_classe] [varchar](255) NULL,
	[complemento_DTCF] [bigint] NULL,
	[complemento_receita] [bigint] NULL,
	[descricao] [varchar](255) NULL,
	[dia_vencimento] [bigint] NULL,
	[grupo_tributo] [bigint] NULL,
	[identificador_deposito] [varchar](255) NULL,
	[nome_autor] [varchar](255) NULL,
	[numero_DTCF] [bigint] NULL,
	[numeroProcesso] [varchar](255) NULL,
	[numero_receita] [bigint] NULL,
	[percentual] [numeric](19, 2) NULL,
	[periodicidade] [varchar](255) NULL,
	[REU] [varchar](255) NULL,
	[secao] [varchar](255) NULL,
	[tipo_base_calculo] [int] NULL,
	[vara] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_darf_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_darf_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acao_classe] [varchar](255) NULL,
	[complemento_DTCF] [bigint] NULL,
	[complemento_receita] [bigint] NULL,
	[descricao] [varchar](255) NULL,
	[dia_vencimento] [bigint] NULL,
	[grupo_tributo] [bigint] NULL,
	[identificador_deposito] [varchar](255) NULL,
	[nome_autor] [varchar](255) NULL,
	[numero_DTCF] [bigint] NULL,
	[numeroProcesso] [varchar](255) NULL,
	[numero_receita] [bigint] NULL,
	[percentual] [numeric](19, 2) NULL,
	[periodicidade] [varchar](255) NULL,
	[REU] [varchar](255) NULL,
	[secao] [varchar](255) NULL,
	[tipo_base_calculo] [int] NULL,
	[vara] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_data_sync_inss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_data_sync_inss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acao] [int] NULL,
	[cpf_cnpj] [varchar](255) NULL,
	[data_hora_criacao] [date] NULL,
	[data_sincronizacao] [date] NULL,
	[processado_web] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_declaracao_inss] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_data_sync_inss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_data_sync_inss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acao] [int] NULL,
	[cpf_cnpj] [varchar](255) NULL,
	[data_hora_criacao] [date] NULL,
	[data_sincronizacao] [date] NULL,
	[processado_web] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_declaracao_inss] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_de_para_tuss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_de_para_tuss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_de_para_tuss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_de_para_tuss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_de_para_tuss_convenio]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_de_para_tuss_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_tabela_tiss] [bigint] NULL,
	[fk_convenio_temp] [int] NULL,
	[fk_tipo_tabela_tiss_fk_tabela_tiss] [varchar](500) NULL,
	[pk_importacao_fk_tabela_tiss] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_de_para_tuss_convenio_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_de_para_tuss_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_tabela_tiss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_de_para_tuss_hospital]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_de_para_tuss_hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_tabela_tiss] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_de_para_tuss_hospital_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_de_para_tuss_hospital_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_tabela_tiss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_de_para_tuss_temp_importacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_de_para_tuss_temp_importacao](
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_declaracao_inss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_declaracao_inss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[cnpj] [varchar](255) NULL,
	[data] [date] NULL,
	[data_hora_criacao] [datetime2](7) NULL,
	[id_declaracao_web] [bigint] NULL,
	[nome_empresa] [varchar](255) NULL,
	[numero_repasse_web] [bigint] NULL,
	[percentual_calculo] [numeric](19, 2) NULL,
	[sincronizar] [bit] NULL,
	[sistema_origem_dados] [int] NULL,
	[tipo_declaracao] [int] NULL,
	[valor_devolucao] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_declaracao_inss_rastreio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_usuario_criacao] [bigint] NULL,
	[fk_repasse_devolucao_inss] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_declaracao_inss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_declaracao_inss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[cnpj] [varchar](255) NULL,
	[data] [date] NULL,
	[data_hora_criacao] [datetime2](7) NULL,
	[id_declaracao_web] [bigint] NULL,
	[nome_empresa] [varchar](255) NULL,
	[numero_repasse_web] [bigint] NULL,
	[percentual_calculo] [numeric](19, 2) NULL,
	[sincronizar] [bit] NULL,
	[sistema_origem_dados] [int] NULL,
	[tipo_declaracao] [int] NULL,
	[valor_devolucao] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_declaracao_inss_rastreio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[fk_usuario_criacao] [bigint] NULL,
	[fk_repasse_devolucao_inss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_declaracao_inss_inconsistente]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_declaracao_inss_inconsistente](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[cnpj] [varchar](255) NULL,
	[cpf_cooperado] [varchar](255) NULL,
	[data] [date] NULL,
	[data_hora_criacao] [datetime2](7) NULL,
	[inconsistencia] [varchar](255) NULL,
	[nome_cooperado] [varchar](255) NULL,
	[nome_empresa] [varchar](255) NULL,
	[numero_conselho_cooperado] [varchar](255) NULL,
	[percentual_calculo] [numeric](19, 2) NULL,
	[tipo_declaracao] [int] NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_declaracao_inss_rastreio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_criacao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_declaracao_inss_inconsistente_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_declaracao_inss_inconsistente_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[cnpj] [varchar](255) NULL,
	[cpf_cooperado] [varchar](255) NULL,
	[data] [date] NULL,
	[data_hora_criacao] [datetime2](7) NULL,
	[inconsistencia] [varchar](255) NULL,
	[nome_cooperado] [varchar](255) NULL,
	[nome_empresa] [varchar](255) NULL,
	[numero_conselho_cooperado] [varchar](255) NULL,
	[percentual_calculo] [numeric](19, 2) NULL,
	[tipo_declaracao] [int] NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_declaracao_inss_rastreio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_criacao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_declaracao_inss_rastreio]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_declaracao_inss_rastreio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [datetime2](7) NULL,
	[data_inicio] [datetime2](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_declaracao_inss_rastreio_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_declaracao_inss_rastreio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [datetime2](7) NULL,
	[data_inicio] [datetime2](7) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_despesa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_despesa](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[numero_auxiliares] [int] NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[quantidade_filme] [numeric](19, 4) NULL,
	[valor_custo_operacional] [numeric](19, 3) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[grupo] [varchar](255) NULL,
	[sub_grupo] [varchar](255) NULL,
	[data_final_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[situacao] [bit] NULL,
	[ch_moeda] [varchar](255) NULL,
	[desconsiderar_apartamento] [bit] NULL,
	[desconsiderar_enfermaria] [bit] NULL,
	[desconsiderar_externo] [bit] NULL,
	[desconsiderar_urgencia] [bit] NULL,
	[valor_acrescimo_tabela] [numeric](19, 2) NULL,
	[valor_porte_anestesia] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_especialidade] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[codigo_fk_item_despesa] [varchar](500) NULL,
	[descricao_fk_item_despesa] [varchar](500) NULL,
	[codigo_fk_item_porte_anestesia] [varchar](500) NULL,
	[quantidade_ch] [numeric](19, 2) NULL,
	[quantidade_uco] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[codigo_fk_item_fator] [varchar](500) NULL,
	[codigo_item_despesa_temp] [varchar](20) NULL,
	[descricao_item_despesa_temp] [varchar](255) NULL,
	[fk_hospital_fk_entidade_hospital] [varchar](500) NULL,
	[fk_entidade_fk_entidade_hospital] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[pk_importacao_fk_complemento] [varchar](500) NULL,
	[pk_importacao_fk_ch] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[percentual_fator_cbhpm] [numeric](19, 2) NULL,
	[reducao_porte_anestesia] [int] NULL,
	[tipo_ch_moeda] [int] NULL,
	[desconsiderar_acrescimo] [bit] NULL,
	[desconsiderar_custeio] [bit] NULL,
	[tp_grupo_subgrupo] [varchar](255) NULL,
	[fk_fator] [bigint] NULL,
	[fk_porte_anestesia] [bigint] NULL,
	[pk_importacao_fk_hospital_fk_entidade_hospital] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_entidade_hospital] [varchar](500) NULL,
	[pk_importacao_fk_especialidade] [varchar](500) NULL,
	[discriminator_fk_especialidade] [varchar](500) NULL,
	[fk_com_con_fk_complemento] [varchar](500) NULL,
	[fk_convenio_fk_complemento] [varchar](500) NULL,
	[fk_entidade_fk_complemento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_despesa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_despesa_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[numero_auxiliares] [int] NULL,
	[percentual_fator] [numeric](19, 2) NULL,
	[quantidade_filme] [numeric](19, 4) NULL,
	[valor_custo_operacional] [numeric](19, 3) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[situacao] [bit] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[grupo] [varchar](255) NULL,
	[sub_grupo] [varchar](255) NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_ch] [bigint] NULL,
	[fk_complemento] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[data_final_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[fk_especialidade] [bigint] NULL,
	[ch_moeda] [varchar](255) NULL,
	[desconsiderar_apartamento] [bit] NULL,
	[desconsiderar_enfermaria] [bit] NULL,
	[desconsiderar_externo] [bit] NULL,
	[desconsiderar_urgencia] [bit] NULL,
	[valor_acrescimo_tabela] [numeric](19, 2) NULL,
	[valor_porte_anestesia] [numeric](19, 2) NULL,
	[quantidade_ch] [numeric](19, 2) NULL,
	[quantidade_uco] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[percentual_fator_cbhpm] [numeric](19, 2) NULL,
	[reducao_porte_anestesia] [int] NULL,
	[tipo_ch_moeda] [int] NULL,
	[fk_fator] [bigint] NULL,
	[fk_porte_anestesia] [bigint] NULL,
	[desconsiderar_acrescimo] [bit] NULL,
	[desconsiderar_custeio] [bit] NULL,
	[tp_grupo_subgrupo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_digitacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_digitacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_digitacao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_digitacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_dirf]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dirf](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ano] [int] NULL,
	[codigo_retencao_pf] [int] NULL,
	[codigo_retencao_pj] [int] NULL,
	[coletivo_empresarial] [bit] NULL,
	[cpf_responsavel] [varchar](255) NULL,
	[cpf_responsavel_cnpj] [varchar](255) NULL,
	[data_processamento] [datetime2](7) NULL,
	[fundo_clube_investimentos] [bit] NULL,
	[instituicao_financeira] [bit] NULL,
	[nome_responsavel] [varchar](255) NULL,
	[numero_telefone_responsavel] [varchar](255) NULL,
	[pagamento_residente_exterior] [bit] NULL,
	[ramal_telefone_responsavel] [varchar](255) NULL,
	[socio_ostensivo] [bit] NULL,
	[somar_inss_valor_bruto] [bit] NULL,
	[status] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[caminho_arquivo] [varchar](255) NULL,
	[processando] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[liberada_portal] [bit] NULL,
	[considerar_todos_cooperados] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_dirf_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dirf_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ano] [int] NULL,
	[codigo_retencao_pf] [int] NULL,
	[codigo_retencao_pj] [int] NULL,
	[coletivo_empresarial] [bit] NULL,
	[cpf_responsavel] [varchar](255) NULL,
	[cpf_responsavel_cnpj] [varchar](255) NULL,
	[data_processamento] [datetime2](7) NULL,
	[fundo_clube_investimentos] [bit] NULL,
	[instituicao_financeira] [bit] NULL,
	[nome_responsavel] [varchar](255) NULL,
	[numero_telefone_responsavel] [varchar](255) NULL,
	[pagamento_residente_exterior] [bit] NULL,
	[ramal_telefone_responsavel] [varchar](255) NULL,
	[socio_ostensivo] [bit] NULL,
	[somar_inss_valor_bruto] [bit] NULL,
	[status] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[caminho_arquivo] [varchar](255) NULL,
	[processando] [bit] NULL,
	[liberada_portal] [bit] NULL,
	[considerar_todos_cooperados] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_edicao_fator_porte]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_edicao_fator_porte](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[valoresEm] [int] NULL,
	[sigla_temp] [varchar](255) NULL,
	[edicao_temp] [varchar](255) NULL,
	[observacao] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_edicao_fator_porte_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_edicao_fator_porte_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[valoresEm] [int] NULL,
	[observacao] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_edicao_tabela_honorarios]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_edicao_tabela_honorarios](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[adicional_apartamento] [numeric](19, 2) NULL,
	[adicional_enfermaria] [numeric](19, 2) NULL,
	[adicional_externo] [numeric](19, 2) NULL,
	[adicional_urgencia] [numeric](19, 2) NULL,
	[data_cadastro] [date] NULL,
	[edicao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[valor_auxiliar_anestesista] [numeric](19, 2) NULL,
	[valor_outro_auxiliar] [numeric](19, 2) NULL,
	[valor_primeiro_auxiliar] [numeric](19, 2) NULL,
	[valores_em] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tabela_honorarios] [bigint] NULL,
	[sigla_fk_tabela_honorarios] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
	[de_para_tuss] [varchar](255) NULL,
	[fk_edicao_tabela_honorarios_original] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_edicao_tabela_honorarios_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_edicao_tabela_honorarios_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[adicional_apartamento] [numeric](19, 2) NULL,
	[adicional_enfermaria] [numeric](19, 2) NULL,
	[adicional_externo] [numeric](19, 2) NULL,
	[adicional_urgencia] [numeric](19, 2) NULL,
	[data_cadastro] [date] NULL,
	[edicao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[valor_auxiliar_anestesista] [numeric](19, 2) NULL,
	[valor_outro_auxiliar] [numeric](19, 2) NULL,
	[valor_primeiro_auxiliar] [numeric](19, 2) NULL,
	[valores_em] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tabela_honorarios] [bigint] NULL,
	[de_para_tuss] [varchar](255) NULL,
	[fk_edicao_tabela_honorarios_original] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_endereco]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_endereco](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[bairro] [varchar](255) NULL,
	[celular] [varchar](255) NULL,
	[cep] [varchar](255) NULL,
	[complemento] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[fax] [varchar](255) NULL,
	[logradouro] [varchar](255) NULL,
	[numero] [int] NULL,
	[situacao] [bit] NULL,
	[telefone] [varchar](255) NULL,
	[telefone2] [varchar](255) NULL,
	[responsavel] [varchar](255) NULL,
	[entidade] [varbinary](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cidade] [bigint] NULL,
	[fk_tipo_endereco] [bigint] NULL,
	[fk_tipo_logradouro] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[descricao_cidade_temp] [varchar](100) NULL,
	[sigla_uf_temp] [varchar](5) NULL,
	[in_endereco_correspondencia] [bit] NULL,
	[pk_importacao_fk_hospital] [varchar](500) NULL,
	[pk_importacao_fk_tipo_logradouro] [varchar](500) NULL,
	[pk_importacao_fk_tipo_endereco] [varchar](500) NULL,
	[pk_importacao_fk_convenio] [varchar](500) NULL,
	[pk_importacao_fk_cooperado] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[fk_entidade_alteracao] [varbinary](255) NULL,
	[data_hora_ultima_alteracao] [datetime2](7) NULL,
	[entidade_ultima_alteracao] [varchar](255) NULL,
	[email2] [varchar](255) NULL,
	[observacao] [varchar](1000) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_endereco_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_endereco_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[bairro] [varchar](255) NULL,
	[celular] [varchar](255) NULL,
	[cep] [varchar](255) NULL,
	[complemento] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[fax] [varchar](255) NULL,
	[logradouro] [varchar](255) NULL,
	[numero] [int] NULL,
	[situacao] [bit] NULL,
	[telefone] [varchar](255) NULL,
	[telefone2] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cidade] [bigint] NULL,
	[fk_tipo_endereco] [bigint] NULL,
	[fk_tipo_logradouro] [bigint] NULL,
	[responsavel] [varchar](255) NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[entidade] [varbinary](255) NULL,
	[fk_hospital] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade_alteracao] [varbinary](255) NULL,
	[data_hora_ultima_alteracao] [datetime2](7) NULL,
	[entidade_ultima_alteracao] [varchar](255) NULL,
	[email2] [varchar](255) NULL,
	[observacao] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_endereco_tmp]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_endereco_tmp](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[bairro] [varchar](255) NULL,
	[celular] [varchar](255) NULL,
	[cep] [varchar](255) NULL,
	[complemento] [varchar](255) NULL,
	[data_hora_ultima_alteracao] [datetime2](7) NULL,
	[email] [varchar](255) NULL,
	[fax] [varchar](255) NULL,
	[logradouro] [varchar](255) NULL,
	[numero] [int] NULL,
	[entidade_ultima_alteracao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[telefone] [varchar](255) NULL,
	[telefone2] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cidade] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_tipo_endereco] [bigint] NULL,
	[fk_tipo_logradouro] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_endereco_tmp_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_endereco_tmp_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[bairro] [varchar](255) NULL,
	[celular] [varchar](255) NULL,
	[cep] [varchar](255) NULL,
	[complemento] [varchar](255) NULL,
	[data_hora_ultima_alteracao] [datetime2](7) NULL,
	[email] [varchar](255) NULL,
	[fax] [varchar](255) NULL,
	[logradouro] [varchar](255) NULL,
	[numero] [int] NULL,
	[entidade_ultima_alteracao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[telefone] [varchar](255) NULL,
	[telefone2] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cidade] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_endereco] [bigint] NULL,
	[fk_tipo_endereco] [bigint] NULL,
	[fk_tipo_logradouro] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[anestesiologista_como_solicitante] [bit] NULL,
	[ano] [int] NULL,
	[bloquear_digitacao] [bit] NULL,
	[bloquear_digitacao_inss] [bit] NULL,
	[bloquear_repasse] [bit] NULL,
	[cnes] [varchar](255) NULL,
	[cnpj] [varchar](255) NULL,
	[codigo_10101039] [bit] NULL,
	[codigo_unimed] [varchar](255) NULL,
	[desconsiderar_atendimentos] [bit] NULL,
	[gerar_pensao_alimenticia] [bit] NULL,
	[imprimir_nota_fiscal] [bit] NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[matricula_cnab] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[numeroAtendimentoAtual] [bigint] NULL,
	[numero_carta_glosa_atual] [bigint] NULL,
	[numero_dias_fechar_espelho] [int] NULL,
	[numero_espelho_atual] [bigint] NULL,
	[numero_fatura_atual] [bigint] NULL,
	[numero_lancamento_eventual] [bigint] NULL,
	[numero_lancamento_repasse_fixo] [bigint] NULL,
	[numero_repasse_atual] [bigint] NULL,
	[observacao] [varchar](1000) NULL,
	[permitir_digitar_cooperado_executante] [bit] NULL,
	[permitir_pagamento_fatura_isolada] [bit] NULL,
	[permitir_pagamento_parcial] [bit] NULL,
	[ratear_custeio] [bit] NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo_entidade] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fatura_isolada_unimed] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_lancamento_custo_op] [bigint] NULL,
	[fk_lancamento_honorarios] [bigint] NULL,
	[pk_importacao_fk_impostos] [varchar](500) NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
	[intervalo_situacao_atendimento] [varchar](255) NULL,
	[situacao_atendimento_a_receber] [int] NULL,
	[fk_grupo_endereco] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[mudanca_porte_zero] [int] NULL,
	[validar_numero_auxiliares] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[anestesiologista_como_solicitante] [bit] NULL,
	[ano] [int] NULL,
	[bloquear_digitacao] [bit] NULL,
	[bloquear_digitacao_inss] [bit] NULL,
	[bloquear_repasse] [bit] NULL,
	[cnes] [varchar](255) NULL,
	[cnpj] [varchar](255) NULL,
	[codigo_10101039] [bit] NULL,
	[codigo_unimed] [varchar](255) NULL,
	[desconsiderar_atendimentos] [bit] NULL,
	[gerar_pensao_alimenticia] [bit] NULL,
	[imprimir_nota_fiscal] [bit] NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[matricula_cnab] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[numeroAtendimentoAtual] [bigint] NULL,
	[numero_carta_glosa_atual] [bigint] NULL,
	[numero_dias_fechar_espelho] [int] NULL,
	[numero_espelho_atual] [bigint] NULL,
	[numero_fatura_atual] [bigint] NULL,
	[numero_lancamento_eventual] [bigint] NULL,
	[numero_lancamento_repasse_fixo] [bigint] NULL,
	[numero_repasse_atual] [bigint] NULL,
	[observacao] [varchar](1000) NULL,
	[permitir_digitar_cooperado_executante] [bit] NULL,
	[permitir_pagamento_fatura_isolada] [bit] NULL,
	[permitir_pagamento_parcial] [bit] NULL,
	[ratear_custeio] [bit] NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[tipo_entidade] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fatura_isolada_unimed] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_lancamento_custo_op] [bigint] NULL,
	[fk_lancamento_honorarios] [bigint] NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
	[intervalo_situacao_atendimento] [varchar](255) NULL,
	[situacao_atendimento_a_receber] [int] NULL,
	[fk_grupo_endereco] [bigint] NULL,
	[mudanca_porte_zero] [int] NULL,
	[validar_numero_auxiliares] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_convenio_data_faturamento]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_convenio_data_faturamento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dia_faturamento] [int] NULL,
	[dia_vencimento] [int] NULL,
	[intervalo] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_convenio_data_faturamento_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_entidade_convenio_data_faturamento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dia_faturamento] [int] NULL,
	[dia_vencimento] [int] NULL,
	[intervalo] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_entidade_cooperado_dependente]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_cooperado_dependente](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[conta_corrente] [varchar](255) NULL,
	[data_nascimento] [date] NULL,
	[dependente_ir] [bit] NULL,
	[dependente_pensao] [bit] NULL,
	[desconto_pensao_sobre] [int] NULL,
	[nome] [varchar](255) NULL,
	[percentual_desconto_pensao] [numeric](19, 2) NULL,
	[tipo_desconto_pensao] [int] NULL,
	[valor_desconto_pensao] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_grau_parentesco] [bigint] NULL,
	[pk_importacao_fk_grau_parentesco] [varchar](500) NULL,
	[fk_entidade_fk_entidade_cooperado] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado] [varchar](500) NULL,
	[numero_banco_fk_banco] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_cooperado_dependente_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_cooperado_dependente_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[agencia] [varchar](255) NULL,
	[conta_corrente] [varchar](255) NULL,
	[data_nascimento] [date] NULL,
	[dependente_ir] [bit] NULL,
	[dependente_pensao] [bit] NULL,
	[desconto_pensao_sobre] [int] NULL,
	[nome] [varchar](255) NULL,
	[percentual_desconto_pensao] [numeric](19, 2) NULL,
	[tipo_desconto_pensao] [int] NULL,
	[valor_desconto_pensao] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_banco] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_grau_parentesco] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_faturamento]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_faturamento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_emissao_fatura] [date] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_faturamento_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_entidade_faturamento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_emissao_fatura] [date] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_entidade_numero_automatico]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_numero_automatico](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ano] [int] NULL,
	[numeroAtendimentoAtual] [bigint] NULL,
	[numero_carta_glosa_atual] [bigint] NULL,
	[numero_espelho_atual] [bigint] NULL,
	[numero_fatura_atual] [bigint] NULL,
	[numero_lancamento_eventual] [bigint] NULL,
	[numero_repasse_atual] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_numero_automatico_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_entidade_numero_automatico_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[ano] [int] NULL,
	[numeroAtendimentoAtual] [bigint] NULL,
	[numero_carta_glosa_atual] [bigint] NULL,
	[numero_espelho_atual] [bigint] NULL,
	[numero_fatura_atual] [bigint] NULL,
	[numero_lancamento_eventual] [bigint] NULL,
	[numero_repasse_atual] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_entidade_sefip]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_sefip](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aliquota_rat] [bigint] NULL,
	[categoria_trabalhador] [bigint] NULL,
	[cnae_fiscal] [bigint] NULL,
	[codigo_recolhimento] [bigint] NULL,
	[codigo_terceiro] [bigint] NULL,
	[faps] [bigint] NULL,
	[gps] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_sefip_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_entidade_sefip_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aliquota_rat] [bigint] NULL,
	[categoria_trabalhador] [bigint] NULL,
	[cnae_fiscal] [bigint] NULL,
	[codigo_recolhimento] [bigint] NULL,
	[codigo_terceiro] [bigint] NULL,
	[faps] [bigint] NULL,
	[gps] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_entidade_tiss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_tiss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dataGeracao] [datetime2](7) NULL,
	[nome_arquivo] [varchar](255) NULL,
	[sequencia] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_entidade_tiss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_entidade_tiss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[dataGeracao] [datetime2](7) NULL,
	[nome_arquivo] [varchar](255) NULL,
	[sequencia] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_erro_importacao_base]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_erro_importacao_base](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_importacao_base] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_erro_importacao_base_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_erro_importacao_base_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_importacao_base] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_espelho]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_espelho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_iss] [numeric](19, 2) NULL,
	[data_cancelamento] [date] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_emissao] [date] NULL,
	[data_envio] [date] NULL,
	[data_vencimento] [date] NULL,
	[motivo_cancelamento] [varchar](255) NULL,
	[numero_espelho] [bigint] NULL,
	[taxa_custeio] [numeric](19, 2) NULL,
	[texto_custo_operacional] [varchar](500) NULL,
	[texto_geral] [varchar](500) NULL,
	[texto_honorarios] [varchar](500) NULL,
	[texto_ir] [varchar](500) NULL,
	[texto_retencao_iss] [varchar](500) NULL,
	[valor_cofins] [numeric](19, 2) NULL,
	[valor_csll] [numeric](19, 2) NULL,
	[valor_custeio] [numeric](19, 2) NULL,
	[valor_ir] [numeric](19, 2) NULL,
	[valor_iss] [numeric](19, 2) NULL,
	[valor_liquido] [numeric](19, 2) NULL,
	[valor_pis] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[valor_total_acrescimo] [numeric](19, 2) NULL,
	[valor_total_custo_operacional] [numeric](19, 2) NULL,
	[valor_total_desconto] [numeric](19, 2) NULL,
	[valor_total_filme] [numeric](19, 2) NULL,
	[valor_total_honorario] [numeric](19, 2) NULL,
	[valor_total_importado] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_classificacao_espelho] [bigint] NULL,
	[fk_complexidade] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_usuario_cancelamento] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_tipo_espelho] [bigint] NULL,
	[sendo_importado_temp] [bit] NULL,
	[pk_importacao_fk_tipo_espelho] [varchar](500) NULL,
	[pk_importacao_fk_classificacao_espelho] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[numero_lote_tiss] [varchar](255) NULL,
	[autorizado_unimed] [bit] NULL,
	[ser_processado_ao_receber_do_medico] [bit] NULL,
	[ser_processado_no_relatorio_espelho_fatura_receber] [bit] NULL,
	[valor_total_acrescimo_convenio] [numeric](19, 2) NULL,
	[diferenca_dias_primeiro_pagamento] [bigint] NULL,
	[numero_nota_fiscal] [varchar](255) NULL,
	[outros_valores_pagamento] [numeric](19, 2) NULL,
	[valor_acrescimo_pagamento] [numeric](19, 2) NULL,
	[valor_cofins_pagamento] [numeric](19, 2) NULL,
	[valor_csll_pagamento] [numeric](19, 2) NULL,
	[valor_custeio_pagamento] [numeric](19, 2) NULL,
	[valor_custo_operacional_pagamento] [numeric](19, 2) NULL,
	[valor_desconto_pagamento] [numeric](19, 2) NULL,
	[valor_diferenca] [numeric](19, 2) NULL,
	[valor_filme_pagamento] [numeric](19, 2) NULL,
	[valor_honorario_pagamento] [numeric](19, 2) NULL,
	[valor_ir_pagamento] [numeric](19, 2) NULL,
	[valor_iss_pagamento] [numeric](19, 2) NULL,
	[valor_liquido_pagamento] [numeric](19, 2) NULL,
	[valor_multa_pagamento] [numeric](19, 2) NULL,
	[valor_pis_pagamento] [numeric](19, 2) NULL,
	[fk_lancamento_repasse_custo_operacional] [bigint] NULL,
	[fk_lancamento_repasse_honorario] [bigint] NULL,
	[fk_motivo_diferenca] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[cd_federativo_temp_fk_lancamento_repasse_custo_operacional] [varchar](500) NULL,
	[fk_entidade_fk_classificacao_espelho] [varchar](500) NULL,
	[cd_federativo_temp_fk_lancamento_repasse_honorario] [varchar](500) NULL,
	[pk_importacao_fk_motivo_diferenca] [varchar](500) NULL,
	[fk_convenio_fk_tipo_espelho] [varchar](500) NULL,
	[fk_entidade_fk_tipo_espelho] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_espelho_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_espelho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_iss] [numeric](19, 2) NULL,
	[data_cancelamento] [date] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_emissao] [date] NULL,
	[data_envio] [date] NULL,
	[data_vencimento] [date] NULL,
	[motivo_cancelamento] [varchar](255) NULL,
	[numero_espelho] [bigint] NULL,
	[taxa_custeio] [numeric](19, 2) NULL,
	[texto_custo_operacional] [varchar](500) NULL,
	[texto_geral] [varchar](500) NULL,
	[texto_honorarios] [varchar](500) NULL,
	[texto_ir] [varchar](500) NULL,
	[texto_retencao_iss] [varchar](500) NULL,
	[valor_cofins] [numeric](19, 2) NULL,
	[valor_csll] [numeric](19, 2) NULL,
	[valor_custeio] [numeric](19, 2) NULL,
	[valor_ir] [numeric](19, 2) NULL,
	[valor_iss] [numeric](19, 2) NULL,
	[valor_liquido] [numeric](19, 2) NULL,
	[valor_pis] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[valor_total_acrescimo] [numeric](19, 2) NULL,
	[valor_total_custo_operacional] [numeric](19, 2) NULL,
	[valor_total_desconto] [numeric](19, 2) NULL,
	[valor_total_filme] [numeric](19, 2) NULL,
	[valor_total_honorario] [numeric](19, 2) NULL,
	[valor_total_importado] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_classificacao_espelho] [bigint] NULL,
	[fk_complexidade] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_usuario_cancelamento] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_tipo_espelho] [bigint] NULL,
	[numero_lote_tiss] [varchar](255) NULL,
	[autorizado_unimed] [bit] NULL,
	[ser_processado_ao_receber_do_medico] [bit] NULL,
	[ser_processado_no_relatorio_espelho_fatura_receber] [bit] NULL,
	[valor_total_acrescimo_convenio] [numeric](19, 2) NULL,
	[diferenca_dias_primeiro_pagamento] [bigint] NULL,
	[numero_nota_fiscal] [varchar](255) NULL,
	[outros_valores_pagamento] [numeric](19, 2) NULL,
	[valor_acrescimo_pagamento] [numeric](19, 2) NULL,
	[valor_cofins_pagamento] [numeric](19, 2) NULL,
	[valor_csll_pagamento] [numeric](19, 2) NULL,
	[valor_custeio_pagamento] [numeric](19, 2) NULL,
	[valor_custo_operacional_pagamento] [numeric](19, 2) NULL,
	[valor_desconto_pagamento] [numeric](19, 2) NULL,
	[valor_diferenca] [numeric](19, 2) NULL,
	[valor_filme_pagamento] [numeric](19, 2) NULL,
	[valor_honorario_pagamento] [numeric](19, 2) NULL,
	[valor_ir_pagamento] [numeric](19, 2) NULL,
	[valor_iss_pagamento] [numeric](19, 2) NULL,
	[valor_liquido_pagamento] [numeric](19, 2) NULL,
	[valor_multa_pagamento] [numeric](19, 2) NULL,
	[valor_pis_pagamento] [numeric](19, 2) NULL,
	[fk_lancamento_repasse_custo_operacional] [bigint] NULL,
	[fk_lancamento_repasse_honorario] [bigint] NULL,
	[fk_motivo_diferenca] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_estado_civil]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_estado_civil](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_estado_civil_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_estado_civil_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_faixa_retencao_ir]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_faixa_retencao_ir](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aliquota] [numeric](19, 2) NULL,
	[base_calculo_final] [numeric](19, 2) NULL,
	[base_calculo_inicial] [numeric](19, 2) NULL,
	[parcela_deduzida] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_ir] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_faixa_retencao_ir_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_faixa_retencao_ir_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aliquota] [numeric](19, 2) NULL,
	[base_calculo_final] [numeric](19, 2) NULL,
	[base_calculo_inicial] [numeric](19, 2) NULL,
	[parcela_deduzida] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_ir] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_faixa_tabela_calculo]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_faixa_tabela_calculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[desconto] [numeric](19, 2) NULL,
	[percentual] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[tipo_calculo] [int] NULL,
	[valor_final] [numeric](19, 2) NULL,
	[valor_fixo] [numeric](19, 2) NULL,
	[valor_inicial] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tabela_calculo] [bigint] NULL,
	[pk_tabela_calculo] [varchar](255) NULL,
	[pk_importacao_fk_tabela_calculo] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web_fk_tabela_calculo] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_faixa_tabela_calculo_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_faixa_tabela_calculo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[desconto] [numeric](19, 2) NULL,
	[percentual] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[tipo_calculo] [int] NULL,
	[valor_final] [numeric](19, 2) NULL,
	[valor_fixo] [numeric](19, 2) NULL,
	[valor_inicial] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tabela_calculo] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_fator]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_fator](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[codigo_fk_item_fator] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[codigo] [varchar](255) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_fator_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_fator_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[codigo] [varchar](255) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_fator_temp_importacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_fator_temp_importacao](
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[codigo_fk_item_fator] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_fatura]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_fatura](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_iss] [numeric](19, 2) NULL,
	[data_cancelamento] [date] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_emissao] [date] NULL,
	[data_vencimento] [date] NULL,
	[diferenca_dias_primeiro_pagamento] [bigint] NULL,
	[fatura_isolada] [bit] NULL,
	[motivo_cancelamento] [varchar](255) NULL,
	[numero_fatura] [bigint] NULL,
	[taxa_custeio] [numeric](19, 2) NULL,
	[texto_custo_operacional] [varchar](500) NULL,
	[texto_geral] [varchar](500) NULL,
	[texto_honorarios] [varchar](500) NULL,
	[texto_ir] [varchar](500) NULL,
	[texto_retencao_iss] [varchar](500) NULL,
	[tipo_fatura] [int] NULL,
	[valor_acrescimo_pagamento] [numeric](19, 2) NULL,
	[valor_cofins] [numeric](19, 2) NULL,
	[valor_cofins_pagamento] [numeric](19, 2) NULL,
	[valor_csll] [numeric](19, 2) NULL,
	[valor_csll_pagamento] [numeric](19, 2) NULL,
	[valor_custeio] [numeric](19, 2) NULL,
	[valor_custeio_pagamento] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_custo_operacional_pagamento] [numeric](19, 2) NULL,
	[valor_desconto_pagamento] [numeric](19, 2) NULL,
	[valor_diferenca] [numeric](19, 2) NULL,
	[valor_filme_pagamento] [numeric](19, 2) NULL,
	[valor_honorario_pagamento] [numeric](19, 2) NULL,
	[valor_ir] [numeric](19, 2) NULL,
	[valor_ir_pagamento] [numeric](19, 2) NULL,
	[valor_iss] [numeric](19, 2) NULL,
	[valor_iss_pagamento] [numeric](19, 2) NULL,
	[valor_liquido] [numeric](19, 2) NULL,
	[valor_liquido_pagamento] [numeric](19, 2) NULL,
	[valor_multa] [numeric](19, 2) NULL,
	[valor_multa_pagamento] [numeric](19, 2) NULL,
	[valor_pis] [numeric](19, 2) NULL,
	[valor_pis_pagamento] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[valor_total_acrescimo] [numeric](19, 2) NULL,
	[valor_total_custo_operacional] [numeric](19, 2) NULL,
	[valor_total_desconto] [numeric](19, 2) NULL,
	[valor_total_filme] [numeric](19, 2) NULL,
	[valor_total_honorario] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_importacao_unimed] [bigint] NULL,
	[fk_entidade_usuario_cancelamento] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_lancamento_repasse_custo_operacional] [bigint] NULL,
	[fk_lancamento_repasse_honorario] [bigint] NULL,
	[fk_motivo_diferenca] [bigint] NULL,
	[outros_valores_pagamento] [numeric](19, 2) NULL,
	[numero_lote_tiss] [varchar](255) NULL,
	[numero_nota_fiscal] [varchar](255) NULL,
	[status_fatura] [int] NULL,
	[autorizado_unimed] [bit] NULL,
	[pk_importacao_fk_convenio] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse_custo_operacional] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse_honorario] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[ser_processado_ao_receber_do_medico] [bit] NULL,
	[ser_processado_no_relatorio_espelho_fatura_receber] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[cd_federativo_temp_fk_lancamento_repasse_honorario] [varchar](500) NULL,
	[pk_importacao_fk_motivo_diferenca] [varchar](500) NULL,
	[cd_federativo_temp_fk_lancamento_repasse_custo_operacional] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_fatura_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_fatura_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_iss] [numeric](19, 2) NULL,
	[data_cancelamento] [date] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_emissao] [date] NULL,
	[data_vencimento] [date] NULL,
	[diferenca_dias_primeiro_pagamento] [bigint] NULL,
	[fatura_isolada] [bit] NULL,
	[motivo_cancelamento] [varchar](255) NULL,
	[numero_fatura] [bigint] NULL,
	[taxa_custeio] [numeric](19, 2) NULL,
	[texto_custo_operacional] [varchar](500) NULL,
	[texto_geral] [varchar](500) NULL,
	[texto_honorarios] [varchar](500) NULL,
	[texto_ir] [varchar](500) NULL,
	[texto_retencao_iss] [varchar](500) NULL,
	[tipo_fatura] [int] NULL,
	[valor_acrescimo_pagamento] [numeric](19, 2) NULL,
	[valor_cofins] [numeric](19, 2) NULL,
	[valor_cofins_pagamento] [numeric](19, 2) NULL,
	[valor_csll] [numeric](19, 2) NULL,
	[valor_csll_pagamento] [numeric](19, 2) NULL,
	[valor_custeio] [numeric](19, 2) NULL,
	[valor_custeio_pagamento] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_custo_operacional_pagamento] [numeric](19, 2) NULL,
	[valor_desconto_pagamento] [numeric](19, 2) NULL,
	[valor_diferenca] [numeric](19, 2) NULL,
	[valor_filme_pagamento] [numeric](19, 2) NULL,
	[valor_honorario_pagamento] [numeric](19, 2) NULL,
	[valor_ir] [numeric](19, 2) NULL,
	[valor_ir_pagamento] [numeric](19, 2) NULL,
	[valor_iss] [numeric](19, 2) NULL,
	[valor_iss_pagamento] [numeric](19, 2) NULL,
	[valor_liquido] [numeric](19, 2) NULL,
	[valor_liquido_pagamento] [numeric](19, 2) NULL,
	[valor_multa] [numeric](19, 2) NULL,
	[valor_multa_pagamento] [numeric](19, 2) NULL,
	[valor_pis] [numeric](19, 2) NULL,
	[valor_pis_pagamento] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[valor_total_acrescimo] [numeric](19, 2) NULL,
	[valor_total_custo_operacional] [numeric](19, 2) NULL,
	[valor_total_desconto] [numeric](19, 2) NULL,
	[valor_total_filme] [numeric](19, 2) NULL,
	[valor_total_honorario] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_importacao_unimed] [bigint] NULL,
	[fk_entidade_usuario_cancelamento] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_impostos] [bigint] NULL,
	[fk_lancamento_repasse_custo_operacional] [bigint] NULL,
	[fk_lancamento_repasse_honorario] [bigint] NULL,
	[fk_motivo_diferenca] [bigint] NULL,
	[outros_valores_pagamento] [numeric](19, 2) NULL,
	[numero_lote_tiss] [varchar](255) NULL,
	[numero_nota_fiscal] [varchar](255) NULL,
	[status_fatura] [int] NULL,
	[autorizado_unimed] [bit] NULL,
	[ser_processado_ao_receber_do_medico] [bit] NULL,
	[ser_processado_no_relatorio_espelho_fatura_receber] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_feriado]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_feriado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_feriado] [date] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_feriado_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_feriado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_feriado] [date] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_forma_tipo_espelho]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_forma_tipo_espelho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_forma_tipo_espelho_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_forma_tipo_espelho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_glosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_glosa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_glosa] [datetime2](7) NULL,
	[observacao] [varchar](1000) NULL,
	[quantidadeCobrado] [int] NULL,
	[quantidadeGlosado] [int] NULL,
	[situacao] [int] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_carta_glosa] [bigint] NULL,
	[fk_entidade_motivo_glosa] [bigint] NULL,
	[fk_motivo_glosa] [bigint] NULL,
	[fk_motivo_glosa_unimed] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[fk_convenio_temp] [varchar](255) NULL,
	[pk_importacao_fk_procedimento] [varchar](500) NULL,
	[pk_importacao_fk_carta_glosa] [varchar](500) NULL,
	[pk_importacao_fk_convenio_temp] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_motivo_glosa] [varchar](500) NULL,
	[pk_importacao_fk_motivo_glosa] [varchar](500) NULL,
	[autorizado_unimed] [bit] NULL,
	[codigoMotivoGlosaJava] [int] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[valor_acrescimoConvenio] [numeric](19, 2) NULL,
	[erroItem_completo_unimed] [varchar](255) NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[glosadoSemGlosa] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[codigo_motivo_glosa_web] [varchar](10) NULL,
	[codEntidade_temp_fk_carta_glosa] [varchar](500) NULL,
	[fk_entidade_fk_grau_participacao_fk_procedimento] [varchar](500) NULL,
	[NumSeqPrd_temp_fk_procedimento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_glosa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_glosa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_glosa] [datetime2](7) NULL,
	[observacao] [varchar](1000) NULL,
	[quantidadeCobrado] [int] NULL,
	[quantidadeGlosado] [int] NULL,
	[situacao] [int] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_carta_glosa] [bigint] NULL,
	[fk_entidade_motivo_glosa] [bigint] NULL,
	[fk_motivo_glosa] [bigint] NULL,
	[fk_motivo_glosa_unimed] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[autorizado_unimed] [bit] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[valor_acrescimoConvenio] [numeric](19, 2) NULL,
	[erroItem_completo_unimed] [varchar](255) NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grau_parentesco]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grau_parentesco](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[idade] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grau_parentesco_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grau_parentesco_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[idade] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_convenio]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_convenio_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_despesa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_despesa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_despesa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_despesa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_endereco]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_endereco](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_endereco_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_endereco_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_subgrupo_despesa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_subgrupo_despesa](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acrescimo_desconto] [numeric](19, 2) NULL,
	[grupo_subgrupo] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[acrescimo] [numeric](19, 2) NULL,
	[desconto] [numeric](19, 2) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_grupo_subgrupo_despesa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_grupo_subgrupo_despesa_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acrescimo_desconto] [numeric](19, 2) NULL,
	[grupo_subgrupo] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidade_cooperado] [bigint] NULL,
	[acrescimo] [numeric](19, 2) NULL,
	[desconto] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_cabecalho]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_cabecalho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[guia_principal] [varchar](20) NULL,
	[numero_guia_prestador] [varchar](20) NOT NULL,
	[registro_ans] [varchar](255) NOT NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_cabecalho_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_cabecalho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[guia_principal] [varchar](20) NULL,
	[numero_guia_prestador] [varchar](20) NULL,
	[registro_ans] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_consulta]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_consulta](
	[id] [bigint] NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NOT NULL,
	[cnes] [varchar](7) NOT NULL,
	[indicador_acidente] [int] NOT NULL,
	[numero_guia_operadora] [varchar](20) NOT NULL,
	[observacao] [varchar](5000) NULL,
	[ct_guiaCabecalho] [bigint] NOT NULL,
	[contratado_executante] [bigint] NOT NULL,
	[dados_atendimento] [bigint] NOT NULL,
	[dados_beneficiario] [bigint] NOT NULL,
	[profissional_executante] [bigint] NOT NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_consulta_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_consulta_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NULL,
	[cnes] [varchar](7) NULL,
	[indicador_acidente] [int] NULL,
	[numero_guia_operadora] [varchar](20) NULL,
	[observacao] [varchar](5000) NULL,
	[ct_guiaCabecalho] [bigint] NULL,
	[contratado_executante] [bigint] NULL,
	[dados_atendimento] [bigint] NULL,
	[dados_beneficiario] [bigint] NULL,
	[profissional_executante] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_honorario]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_honorario](
	[id] [bigint] NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NOT NULL,
	[atendimentoRN] [varchar](255) NULL,
	[cnes] [varchar](255) NULL,
	[cnesContratadoExecutante] [varchar](255) NULL,
	[cnpjLocalExecutante] [varchar](255) NULL,
	[codigoNaOperadora] [varchar](255) NULL,
	[dataEmissaoGuia] [datetime2](7) NULL,
	[dataFimFaturamento] [datetime2](7) NULL,
	[dataInicioFaturamento] [datetime2](7) NULL,
	[guiaSolicInternacao] [varchar](255) NULL,
	[nomeBeneficiario] [varchar](255) NULL,
	[nomeContratado] [varchar](255) NULL,
	[nomeContratadoExecutante] [varchar](255) NULL,
	[numeroCarteira] [varchar](255) NULL,
	[numeroGuiaOperadora] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[senha] [varchar](255) NULL,
	[valorTotalHonorarios] [numeric](19, 2) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_honorario_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_honorario_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NULL,
	[atendimentoRN] [varchar](255) NULL,
	[cnes] [varchar](255) NULL,
	[cnesContratadoExecutante] [varchar](255) NULL,
	[cnpjLocalExecutante] [varchar](255) NULL,
	[codigoNaOperadora] [varchar](255) NULL,
	[dataEmissaoGuia] [datetime2](7) NULL,
	[dataFimFaturamento] [datetime2](7) NULL,
	[dataInicioFaturamento] [datetime2](7) NULL,
	[guiaSolicInternacao] [varchar](255) NULL,
	[nomeBeneficiario] [varchar](255) NULL,
	[nomeContratado] [varchar](255) NULL,
	[nomeContratadoExecutante] [varchar](255) NULL,
	[numeroCarteira] [varchar](255) NULL,
	[numeroGuiaOperadora] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[senha] [varchar](255) NULL,
	[valorTotalHonorarios] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_sp_sadt]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_sp_sadt](
	[id] [bigint] NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NOT NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_sp_sadt_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_guia_sp_sadt_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_guia_tiss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_guia_tiss](
	[id] [bigint] NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NOT NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_guia_tiss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_guia_tiss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tiss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_horario_trabalho]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_horario_trabalho](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fim] [date] NULL,
	[inicio] [date] NULL,
	[liberar_bloquear] [int] NULL,
	[desconsiderar_horario_verao] [bit] NULL,
	[fuso_horario] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[liberarBloquear] [int] NULL,
	[fk_usuario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_horario_trabalho_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_horario_trabalho_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[desconsiderar_horario_verao] [bit] NULL,
	[fuso_horario] [int] NULL,
	[descricao] [varchar](255) NULL,
	[fim] [date] NULL,
	[inicio] [date] NULL,
	[liberar_bloquear] [int] NULL,
	[liberarBloquear] [int] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_hospital]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnes] [varchar](255) NULL,
	[cnpj] [varchar](255) NULL,
	[codigo_unimed] [varchar](255) NULL,
	[hospital_padrao_unimed] [bit] NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_hospital_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_hospital_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnes] [varchar](255) NULL,
	[cnpj] [varchar](255) NULL,
	[codigo_unimed] [varchar](255) NULL,
	[hospital_padrao_unimed] [bit] NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[flag_isento_inscricao_estadual] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_hospital_integracao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_hospital_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[cnes] [varchar](255) NULL,
	[cnpj] [varchar](255) NULL,
	[codigo_unimed] [varchar](255) NULL,
	[hospital_padrao_unimed] [bit] NULL,
	[inscricao_estadual] [varchar](255) NULL,
	[inscricao_municipal] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[nome_contato] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_identificacao_transacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_identificacao_transacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnpj] [varchar](14) NULL,
	[codigo_prestador_operadora] [varchar](14) NOT NULL,
	[cpf] [varchar](11) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_identificacao_transacao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_identificacao_transacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cnpj] [varchar](14) NULL,
	[codigo_prestador_operadora] [varchar](14) NULL,
	[cpf] [varchar](11) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_importacao_base]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_importacao_base](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[copiar_campo_guia] [bit] NULL,
	[id_aviso_sistema] [bigint] NULL,
	[id_rotina_sistema] [bigint] NULL,
	[importado] [int] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[tipo_importacao_base] [int] NULL,
	[tipo_item_despesa] [int] NULL,
	[utilizaTUSS] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_usuario] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_importacao_base_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_importacao_base_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[copiar_campo_guia] [bit] NULL,
	[id_aviso_sistema] [bigint] NULL,
	[id_rotina_sistema] [bigint] NULL,
	[importado] [int] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[tipo_importacao_base] [int] NULL,
	[tipo_item_despesa] [int] NULL,
	[utilizaTUSS] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_usuario] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_importacao_unimed]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_importacao_unimed](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_cadastro] [datetime2](7) NULL,
	[data_credito] [datetime2](7) NULL,
	[gerado_atendimentos] [bit] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[situacao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[percentual_geracao_atendimento] [numeric](19, 2) NULL,
	[situacaoGeracaoAtendimento] [int] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_importacao_unimed_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_importacao_unimed_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_cadastro] [datetime2](7) NULL,
	[data_credito] [datetime2](7) NULL,
	[gerado_atendimentos] [bit] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[situacao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[percentual_geracao_atendimento] [numeric](19, 2) NULL,
	[situacaoGeracaoAtendimento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_impostos]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_impostos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao_impostos] [varchar](500) NULL,
	[descricao_ir] [varchar](500) NULL,
	[fim_vigencia] [date] NULL,
	[impostos_retidos_convenio] [bit] NULL,
	[incidir_ir_custo_operacional] [bit] NULL,
	[incidir_ir_taxa_custeio] [bit] NULL,
	[incidir_iss_sobre_acrescimo] [bit] NULL,
	[incidir_iss_sobre_multa] [bit] NULL,
	[inicio_vigencia] [date] NULL,
	[percentual_base_iss] [numeric](19, 2) NULL,
	[percentual_cofins] [numeric](19, 2) NULL,
	[percentual_contribuicao_social] [numeric](19, 2) NULL,
	[percentual_ir] [numeric](19, 2) NULL,
	[percentual_iss] [numeric](19, 2) NULL,
	[percentual_pis] [numeric](19, 2) NULL,
	[retem_cofins] [bit] NULL,
	[retem_csll] [bit] NULL,
	[retem_ir] [bit] NULL,
	[retem_iss] [bit] NULL,
	[retem_pis] [bit] NULL,
	[valor_minimo_cofins] [numeric](19, 2) NULL,
	[valor_minimo_csll] [numeric](19, 2) NULL,
	[valor_minimo_ir] [numeric](19, 2) NULL,
	[valor_minimo_pis] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[pk_importacao_composta_CodPesEnt_temp] [varchar](255) NULL,
	[pk_importacao_composta_CodPesCon_temp] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_impostos_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_impostos_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao_impostos] [varchar](500) NULL,
	[descricao_ir] [varchar](500) NULL,
	[fim_vigencia] [date] NULL,
	[impostos_retidos_convenio] [bit] NULL,
	[incidir_ir_custo_operacional] [bit] NULL,
	[incidir_ir_taxa_custeio] [bit] NULL,
	[incidir_iss_sobre_acrescimo] [bit] NULL,
	[incidir_iss_sobre_multa] [bit] NULL,
	[inicio_vigencia] [date] NULL,
	[percentual_base_iss] [numeric](19, 2) NULL,
	[percentual_cofins] [numeric](19, 2) NULL,
	[percentual_contribuicao_social] [numeric](19, 2) NULL,
	[percentual_ir] [numeric](19, 2) NULL,
	[percentual_iss] [numeric](19, 2) NULL,
	[percentual_pis] [numeric](19, 2) NULL,
	[retem_cofins] [bit] NULL,
	[retem_csll] [bit] NULL,
	[retem_ir] [bit] NULL,
	[retem_iss] [bit] NULL,
	[retem_pis] [bit] NULL,
	[valor_minimo_cofins] [numeric](19, 2) NULL,
	[valor_minimo_csll] [numeric](19, 2) NULL,
	[valor_minimo_ir] [numeric](19, 2) NULL,
	[valor_minimo_pis] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_incidencia_lancamento_repasse]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_incidencia_lancamento_repasse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_lancamento_repasse_incidente] [bigint] NULL,
	[fk_lancamento_repasse_principal] [bigint] NULL,
	[cd_federativo_temp] [varchar](255) NULL,
	[pk_importacao_fk_lancamento_repasse_incidente] [varchar](255) NULL,
	[pk_importacao_fk_lancamento_repasse_principal] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_incidencia_lancamento_repasse_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_incidencia_lancamento_repasse_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_lancamento_repasse_incidente] [bigint] NULL,
	[fk_lancamento_repasse_principal] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_inss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_inss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual_inss] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_inss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_inss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual_inss] [numeric](19, 2) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_inss_vigencia]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_inss_vigencia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_inclusao] [datetime2](7) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[situacao] [bit] NULL,
	[valor_minimo_desconto] [numeric](19, 2) NULL,
	[valor_teto_INSS] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_inss] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_inss_vigencia_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_inss_vigencia_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_inclusao] [datetime2](7) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[situacao] [bit] NULL,
	[valor_minimo_desconto] [numeric](19, 2) NULL,
	[valor_teto_INSS] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_inss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_INTEGRACAO]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_INTEGRACAO](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[arquivo] [varchar](50) NULL,
	[atendimento_final] [varchar](255) NULL,
	[atendimento_inicial] [varchar](255) NULL,
	[data_hora_integracao] [datetime2](7) NULL,
	[numero_integracao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_convenio_entidade] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_INTEGRACAO_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_INTEGRACAO_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[arquivo] [varchar](50) NULL,
	[atendimento_final] [varchar](255) NULL,
	[atendimento_inicial] [varchar](255) NULL,
	[data_hora_integracao] [datetime2](7) NULL,
	[numero_integracao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_convenio_entidade] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_integracao_hospital]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_integracao_hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_importacao] [datetime2](7) NULL,
	[utiliza_tuss] [bit] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[status] [varchar](255) NULL,
	[referencia_atendimentos] [varchar](255) NULL,
	[copiar_campos_guia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[fk_importacao_base] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_integracao_hospital_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_integracao_hospital_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_hospital] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[fk_importacao_base] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_integracao_sus]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_integracao_sus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acareacaoAutorizada] [bit] NULL,
	[data_importacao] [date] NULL,
	[hora_importacao] [time](7) NULL,
	[importacaoFinalizada] [bit] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[numero] [int] NULL,
	[percentual_atual_importacao] [numeric](19, 2) NULL,
	[quantidade_total_linhas] [int] NULL,
	[tipo_importacao_sus] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_integracao_sus_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_integracao_sus_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acareacaoAutorizada] [bit] NULL,
	[data_importacao] [date] NULL,
	[hora_importacao] [time](7) NULL,
	[importacaoFinalizada] [bit] NULL,
	[nome_arquivo] [varchar](255) NULL,
	[numero] [int] NULL,
	[percentual_atual_importacao] [numeric](19, 2) NULL,
	[quantidade_total_linhas] [int] NULL,
	[tipo_importacao_sus] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_integracao_sus_sobra_acareacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_integracao_sus_sobra_acareacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aih] [varchar](255) NULL,
	[cpf] [varchar](255) NULL,
	[crm] [varchar](255) NULL,
	[linha] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_integracao_sus_sobra_acareacao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_integracao_sus_sobra_acareacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[aih] [varchar](255) NULL,
	[cpf] [varchar](255) NULL,
	[crm] [varchar](255) NULL,
	[linha] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_INTEGRACAO_UNIMED]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_INTEGRACAO_UNIMED](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[arquivo] [varchar](50) NULL,
	[data_hora_integracao] [datetime2](7) NULL,
	[numero_integracao] [bigint] NULL,
	[status] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[calculado_atendimento] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_INTEGRACAO_UNIMED_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_INTEGRACAO_UNIMED_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[arquivo] [varchar](50) NULL,
	[data_hora_integracao] [datetime2](7) NULL,
	[numero_integracao] [bigint] NULL,
	[status] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[calculado_atendimento] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ir]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ir](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[situacao] [bit] NULL,
	[valor_desconto_por_dependente] [numeric](19, 2) NULL,
	[valor_minimo_desconto] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ir_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ir_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[situacao] [bit] NULL,
	[valor_desconto_por_dependente] [numeric](19, 2) NULL,
	[valor_minimo_desconto] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_item_despesa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_item_despesa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](500) NULL,
	[situacao] [bit] NULL,
	[tipo_item_despesa] [int] NULL,
	[tipo_procedimento] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[consulta] [bit] NULL,
	[fk_tipo_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_item_despesa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_item_despesa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](500) NULL,
	[situacao] [bit] NULL,
	[tipo_item_despesa] [int] NULL,
	[tipo_procedimento] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[consulta] [bit] NULL,
	[fk_tipo_item_despesa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_item_despesa_integracao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_item_despesa_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[consulta] [bit] NULL,
	[descricao] [varchar](500) NULL,
	[id_item_despesa] [bigint] NULL,
	[situacao] [bit] NULL,
	[tipo_item_despesa] [int] NULL,
	[tipo_procedimento] [int] NULL,
	[sql_update] [varchar](255) NULL,
	[id_procedimento_integracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_item_fator]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_item_fator](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_item_fator_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_item_fator_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_item_porte_anestesia]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_item_porte_anestesia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_item_porte_anestesia_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_item_porte_anestesia_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_lancamento_repasse]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_lancamento_repasse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[natureza_contabil] [int] NULL,
	[observacao] [varchar](500) NULL,
	[situacao] [bit] NULL,
	[tipo_demonstrativo] [int] NULL,
	[tipo_lancamento_repasse] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[cd_federativo_temp] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_lancamento_repasse_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_lancamento_repasse_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[natureza_contabil] [int] NULL,
	[observacao] [varchar](500) NULL,
	[situacao] [bit] NULL,
	[tipo_demonstrativo] [int] NULL,
	[tipo_lancamento_repasse] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_lancamento_repasse_eventual]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_lancamento_repasse_eventual](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_lancamento] [date] NULL,
	[descricao] [varchar](255) NULL,
	[numero_lancamento] [bigint] NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_usuario_cadastro] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[autorizado_unimed] [bit] NULL,
	[linha_adequacao] [varchar](255) NULL,
	[numero_guia] [varchar](255) NULL,
	[fk_cooperado_executante] [bigint] NULL,
	[pk_importacao_fk_espelho_fk_fatura] [varchar](255) NULL,
	[pk_importacao_st_espelho_fatura] [char](1) NULL,
	[pk_importacao_pk_importacao_unimed] [varchar](255) NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[pk_importacao_fk_cooperado_executante] [varchar](500) NULL,
	[pk_importacao_fk_repasse] [varchar](500) NULL,
	[pk_importacao_fk_convenio] [varchar](500) NULL,
	[pk_importacao_fk_lancamento_repasse] [varchar](500) NULL,
	[pk_importacao_fk_cooperado_recebedor_cobranca] [varchar](500) NULL,
	[numero_espelho_fatura] [bigint] NULL,
	[tp_espelho_fatura] [char](1) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web] [varchar](255) NULL,
	[pk_importacao_fk_espelho] [varchar](255) NULL,
	[pk_importacao_web_fk_repasse] [varchar](500) NULL,
	[cd_federativo_temp_fk_lancamento_repasse] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_repasse] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_lancamento_repasse_eventual_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_lancamento_repasse_eventual_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_lancamento] [date] NULL,
	[descricao] [varchar](255) NULL,
	[numero_lancamento] [bigint] NULL,
	[valor_lancamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_entidade_usuario_cadastro] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[fk_lancamento_repasse] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[autorizado_unimed] [bit] NULL,
	[linha_adequacao] [varchar](255) NULL,
	[numero_guia] [varchar](255) NULL,
	[fk_cooperado_executante] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_lancamento_repasse_temp]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_lancamento_repasse_temp](
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[natureza_contabil] [int] NULL,
	[observacao] [varchar](500) NULL,
	[situacao] [bit] NULL,
	[tipo_demonstrativo] [int] NULL,
	[tipo_lancamento_repasse] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[cd_federativo_temp] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_linha_importacao_base]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_linha_importacao_base](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[linha] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_importacao_base] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_linha_importacao_base_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_linha_importacao_base_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[linha] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_importacao_base] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_local_atendimento]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_local_atendimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_local_atendimento_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_local_atendimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_memoria_calculo]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_memoria_calculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acrescimo] [numeric](19, 2) NULL,
	[acrescimo_tabela_custo_operacional] [bit] NULL,
	[adicionalApartamento] [numeric](19, 2) NULL,
	[adicionalEnfermaria] [numeric](19, 2) NULL,
	[adicionalExterno] [numeric](19, 2) NULL,
	[adicionalUrgencia] [numeric](19, 2) NULL,
	[auxiliarAnestesia] [numeric](19, 2) NULL,
	[ch] [numeric](19, 2) NULL,
	[chOperacional] [numeric](19, 2) NULL,
	[descontoConvenio] [numeric](19, 2) NULL,
	[excecaoDespesaEntidadeConvenioEspecialidade] [bit] NULL,
	[excecaoPorte] [bit] NULL,
	[fatorCustoOperacional] [numeric](19, 2) NULL,
	[filme] [numeric](19, 2) NULL,
	[honorario] [numeric](19, 2) NULL,
	[outrosAuxiliares] [numeric](19, 2) NULL,
	[percentual] [numeric](19, 2) NULL,
	[percentualAcomodacao] [numeric](19, 2) NULL,
	[percentualCobrancaVideo] [numeric](19, 2) NULL,
	[percentualFator] [numeric](19, 2) NULL,
	[percentualFatorCBHPM] [numeric](19, 2) NULL,
	[percentualGrauParticipacao] [numeric](19, 2) NULL,
	[percentualHospital] [numeric](19, 2) NULL,
	[primeiroAuxiliar] [numeric](19, 2) NULL,
	[quantidade] [bigint] NULL,
	[quantidadeCh] [numeric](19, 2) NULL,
	[quantidadeFilme] [numeric](19, 2) NULL,
	[quantidadePorte] [numeric](19, 2) NULL,
	[tipoTabela] [int] NULL,
	[total] [numeric](19, 2) NULL,
	[uco] [numeric](19, 2) NULL,
	[urgencia] [bit] NULL,
	[valorCustoOperacional] [numeric](19, 2) NULL,
	[valorFilme] [numeric](19, 2) NULL,
	[valorHonorario] [numeric](19, 2) NULL,
	[valor_percentual] [numeric](19, 2) NULL,
	[valorPorte] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio_historico_tabela_honorario] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[excecaoEntidadeConvenioDespesa] [bit] NULL,
	[fk_entidade_cconvenio_despesa] [bigint] NULL,
	[acrescimoConvenio] [numeric](19, 2) NULL,
	[acrescimoDescontoConvenioCalculado] [numeric](19, 2) NULL,
	[acrescimoTabela] [numeric](19, 2) NULL,
	[acrescimoTabelaCalculado] [numeric](19, 2) NULL,
	[valor_percentual_via_acesso] [numeric](19, 2) NULL,
	[sql_update] [varchar](255) NULL,
	[valorUcoTermoAditivo] [numeric](19, 2) NULL,
	[fk_entidade_cooperado_despesa] [bigint] NULL,
	[fk_entidade_cooperado_historico_tabela_honorario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_memoria_calculo_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_memoria_calculo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acrescimo] [numeric](19, 2) NULL,
	[acrescimo_tabela_custo_operacional] [bit] NULL,
	[adicionalApartamento] [numeric](19, 2) NULL,
	[adicionalEnfermaria] [numeric](19, 2) NULL,
	[adicionalExterno] [numeric](19, 2) NULL,
	[adicionalUrgencia] [numeric](19, 2) NULL,
	[auxiliarAnestesia] [numeric](19, 2) NULL,
	[ch] [numeric](19, 2) NULL,
	[chOperacional] [numeric](19, 2) NULL,
	[descontoConvenio] [numeric](19, 2) NULL,
	[excecaoDespesaEntidadeConvenioEspecialidade] [bit] NULL,
	[excecaoPorte] [bit] NULL,
	[fatorCustoOperacional] [numeric](19, 2) NULL,
	[filme] [numeric](19, 2) NULL,
	[honorario] [numeric](19, 2) NULL,
	[outrosAuxiliares] [numeric](19, 2) NULL,
	[percentual] [numeric](19, 2) NULL,
	[percentualAcomodacao] [numeric](19, 2) NULL,
	[percentualCobrancaVideo] [numeric](19, 2) NULL,
	[percentualFator] [numeric](19, 2) NULL,
	[percentualFatorCBHPM] [numeric](19, 2) NULL,
	[percentualGrauParticipacao] [numeric](19, 2) NULL,
	[percentualHospital] [numeric](19, 2) NULL,
	[primeiroAuxiliar] [numeric](19, 2) NULL,
	[quantidade] [bigint] NULL,
	[quantidadeCh] [numeric](19, 2) NULL,
	[quantidadeFilme] [numeric](19, 2) NULL,
	[quantidadePorte] [numeric](19, 2) NULL,
	[tipoTabela] [int] NULL,
	[total] [numeric](19, 2) NULL,
	[uco] [numeric](19, 2) NULL,
	[urgencia] [bit] NULL,
	[valorCustoOperacional] [numeric](19, 2) NULL,
	[valorFilme] [numeric](19, 2) NULL,
	[valorHonorario] [numeric](19, 2) NULL,
	[valor_percentual] [numeric](19, 2) NULL,
	[valorPorte] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_convenio_historico_tabela_honorario] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[excecaoEntidadeConvenioDespesa] [bit] NULL,
	[fk_entidade_cconvenio_despesa] [bigint] NULL,
	[acrescimoConvenio] [numeric](19, 2) NULL,
	[acrescimoDescontoConvenioCalculado] [numeric](19, 2) NULL,
	[acrescimoTabela] [numeric](19, 2) NULL,
	[acrescimoTabelaCalculado] [numeric](19, 2) NULL,
	[valor_percentual_via_acesso] [numeric](19, 2) NULL,
	[valorUcoTermoAditivo] [numeric](19, 2) NULL,
	[fk_entidade_cooperado_despesa] [bigint] NULL,
	[fk_entidade_cooperado_historico_tabela_honorario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_modulo]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_modulo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_modulo_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_modulo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_motivo_diferenca]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_motivo_diferenca](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_motivo_diferenca_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_motivo_diferenca_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_motivo_exclusao_guias]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_motivo_exclusao_guias](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_motivo_exclusao_guias_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_motivo_exclusao_guias_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_nacionalidade]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_nacionalidade](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_nacionalidade_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_nacionalidade_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_numero_prestador]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_numero_prestador](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[numero_prestador] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_numero_prestador_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_numero_prestador_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[numero_prestador] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_hospital] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pagamento_espelho]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pagamento_espelho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_pagamento] [date] NULL,
	[numero_boleto] [varchar](255) NULL,
	[observacao] [varchar](500) NULL,
	[percentual_pagamento] [numeric](19, 2) NULL,
	[tipo_pagamento] [int] NULL,
	[tipo_valor] [int] NULL,
	[valor_pagamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_dados_bancarios] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_fk_repasse] [varchar](255) NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[fk_num_fat_fk_espelho] [varchar](500) NULL,
	[fk_entidade_fk_espelho] [varchar](500) NULL,
	[numero_banco_fk_banco_fk_entidade_dados_bancarios] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_entidade_dados_bancarios] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pagamento_espelho_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pagamento_espelho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_pagamento] [date] NULL,
	[numero_boleto] [varchar](255) NULL,
	[observacao] [varchar](500) NULL,
	[percentual_pagamento] [numeric](19, 2) NULL,
	[tipo_pagamento] [int] NULL,
	[tipo_valor] [int] NULL,
	[valor_pagamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_dados_bancarios] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_espelho] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pagamento_fatura]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pagamento_fatura](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_pagamento] [date] NULL,
	[numero_boleto] [varchar](255) NULL,
	[observacao] [varchar](500) NULL,
	[percentual_pagamento] [numeric](19, 2) NULL,
	[tipo_pagamento] [int] NULL,
	[valor_pagamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_dados_bancarios] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[tipo_valor] [int] NULL,
	[pk_importacao_fk_repasse] [varchar](255) NULL,
	[pk_importacao_java] [varchar](255) NULL,
	[pk_importacao_fk_entidade_dados_bancarios] [varchar](500) NULL,
	[pk_importacao_fk_fatura] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[numero_banco_fk_banco_fk_entidade_dados_bancarios] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_entidade_dados_bancarios] [varchar](500) NULL,
	[pk_importacao_fk_entidade] [varchar](255) NULL,
	[pk_importacao_fk_entidade_fk_fatura] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pagamento_fatura_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pagamento_fatura_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_pagamento] [date] NULL,
	[numero_boleto] [varchar](255) NULL,
	[observacao] [varchar](500) NULL,
	[percentual_pagamento] [numeric](19, 2) NULL,
	[tipo_pagamento] [int] NULL,
	[valor_pagamento] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade_dados_bancarios] [bigint] NULL,
	[fk_entidade_usuario_criacao] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[tipo_valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pagamento_procedimento]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pagamento_procedimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_criacao] [date] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[foiDeletadoSemRepasse] [bit] NULL,
	[valorDescontoNegativo] [bit] NULL,
	[valor_acrescimo_convenio] [numeric](19, 2) NULL,
	[foiAlteradoJaRepassado] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pagamento_procedimento_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_pagamento_procedimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_criacao] [date] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_fatura] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[valor_acrescimo_convenio] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_pais]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pais](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[pais_name] [varchar](255) NULL,
	[pais_nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pais_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pais_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[pais_name] [varchar](255) NULL,
	[pais_nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_parametriza_digitacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_parametriza_digitacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[copiar_dados_guia_para_senha] [bit] NULL,
	[inserir_novo_atendimento_apos_salvar] [bit] NULL,
	[inserir_novo_item_despesa_apos_salvar] [bit] NULL,
	[registro_ativo] [bit] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_usuario] [bigint] NULL,
	[copiar_campo_realizacao_para_campo_autorizacao] [bit] NULL,
	[copiar_campo_guia_principal_para_campo_guia] [bit] NULL,
	[copiar_campo_guia_principal_para_campo_guia_procedimento] [bit] NULL,
	[copiar_campo_guia_principal_para_campo_senha] [bit] NULL,
	[copiar_campo_guia_principal_para_campo_solicitacao_internacao] [bit] NULL,
	[copiar_dados_guia_para_guia_procedimento] [bit] NULL,
	[copiar_dados_guia_solicitacao_internacao] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_participantes_composicao_servico_especial]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_participantes_composicao_servico_especial](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[percentual_desconto_hospitalar] [numeric](19, 2) NULL,
	[principal] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_composicao_servico_especial] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[pk_importacao_cooperado] [varchar](255) NULL,
	[fk_composicao_servico_especial_temp] [bigint] NULL,
	[id_temporario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_fk_cooperado] [varchar](500) NULL,
	[pk_importacao_fk_composicao_servico_especial] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_participantes_composicao_servico_especial_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_participantes_composicao_servico_especial_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[percentual_desconto_hospitalar] [numeric](19, 2) NULL,
	[principal] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_composicao_servico_especial] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_perfil_acesso]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_perfil_acesso](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_perfil_acesso_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_perfil_acesso_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[nome] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_plantao_lancamento]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_plantao_lancamento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim_plantao] [date] NULL,
	[data_inicio_plantao] [date] NULL,
	[hora_fim_plantao] [time](7) NULL,
	[hora_inicio_plantao] [time](7) NULL,
	[NU_LINHA_REGISTRO] [int] NULL,
	[DS_LOCAL_PLANTAO] [varchar](255) NULL,
	[IN_POSITIVO_NEGATIVO] [char](1) NULL,
	[valor_calculado] [numeric](19, 2) NULL,
	[valor_plantao] [numeric](19, 2) NULL,
	[valor_producao] [numeric](19, 2) NULL,
	[valor_receber] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_importacao] [bigint] NULL,
	[fk_lancamento_repasse_eventual] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_plantao_lancamento_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_plantao_lancamento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim_plantao] [date] NULL,
	[data_inicio_plantao] [date] NULL,
	[hora_fim_plantao] [time](7) NULL,
	[hora_inicio_plantao] [time](7) NULL,
	[NU_LINHA_REGISTRO] [int] NULL,
	[DS_LOCAL_PLANTAO] [varchar](255) NULL,
	[IN_POSITIVO_NEGATIVO] [char](1) NULL,
	[valor_calculado] [numeric](19, 2) NULL,
	[valor_plantao] [numeric](19, 2) NULL,
	[valor_producao] [numeric](19, 2) NULL,
	[valor_receber] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_importacao] [bigint] NULL,
	[fk_lancamento_repasse_eventual] [bigint] NULL,
	[fk_procedimento] [bigint] NULL,
	[fk_importacao_unimed] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_porte_anestesia]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_porte_anestesia](
	[DTYPE] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_fator] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidadeconvenio_complemento] [bigint] NULL,
	[fimVigencia] [datetime2](7) NULL,
	[inicioVigencia] [datetime2](7) NULL,
	[codigo_fk_item_porte_anestesia] [varchar](500) NULL,
	[codigo_fk_item_fator] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[codigo] [varchar](255) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
	[fk_convenio_fk_entidade_convenio] [varchar](500) NULL,
	[fk_entidade_fk_entidade_convenio] [varchar](500) NULL,
	[fk_com_con_fk_entidadeconvenio_complemento] [varchar](500) NULL,
	[fk_convenio_fk_entidadeconvenio_complemento] [varchar](500) NULL,
	[fk_entidade_fk_entidadeconvenio_complemento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_porte_anestesia_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_porte_anestesia_AUD](
	[DTYPE] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidadeconvenio_complemento] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_fator] [bigint] NULL,
	[fimVigencia] [datetime2](7) NULL,
	[inicioVigencia] [datetime2](7) NULL,
	[codigo] [varchar](255) NULL,
	[fim_vigencia] [date] NULL,
	[inicio_vigencia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_porte_anestesia_temp_importacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_porte_anestesia_temp_importacao](
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[situacao] [bit] NULL,
	[valor] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_edicao_fator_porte] [bigint] NULL,
	[fk_item_fator] [bigint] NULL,
	[fk_item_porte_anestesia] [bigint] NULL,
	[fk_entidade_convenio] [bigint] NULL,
	[fk_entidadeconvenio_complemento] [bigint] NULL,
	[fk_edicao_tabela_honorarios] [bigint] NULL,
	[fk_fator] [bigint] NULL,
	[codigo_fk_item_porte_anestesia] [varchar](500) NULL,
	[codigo_fk_item_fator] [varchar](500) NULL,
	[DTYPE] [varchar](31) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_procedimento]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_procedimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[data_realizacao] [date] NULL,
	[desconto_hospitalar] [bit] NULL,
	[faturar] [bit] NULL,
	[forcar_atendimento] [bit] NULL,
	[forma_execucao] [int] NULL,
	[guia_procedimento] [varchar](255) NULL,
	[hora_fim] [time](7) NULL,
	[hora_inicio] [time](7) NULL,
	[percentual_desconto_hospitalar] [numeric](19, 2) NULL,
	[quantidade] [bigint] NULL,
	[quantidade_ch] [numeric](19, 2) NULL,
	[quantidade_porte] [numeric](19, 2) NULL,
	[tuss] [bit] NULL,
	[urgencia] [bit] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_ch] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[valor_percentual] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_complexidade] [bigint] NULL,
	[fk_cooperado_executante_complemento] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca_anterior] [bigint] NULL,
	[fk_entidade_cooperado_especialidade] [bigint] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_procedimento_detalhar_unimed] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
	[fk_tecnica] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_unidade_medida] [bigint] NULL,
	[fk_via_acesso] [bigint] NULL,
	[descricao_acomodacao_temp] [varchar](255) NULL,
	[descricao_grau_Participacao_temp] [varchar](255) NULL,
	[codigo_item_despesa_temp] [varchar](255) NULL,
	[descricao_item_despesa_temp] [varchar](255) NULL,
	[NumSeqPrd_temp] [varchar](255) NULL,
	[sendo_importado_temp] [bit] NULL,
	[pk_importacao_fk_cooperado_recebedor_cobranca] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tecnica] [varchar](500) NULL,
	[pk_importacao_fk_tecnica] [varchar](500) NULL,
	[codigo_fk_procedimento_tuss] [varchar](500) NULL,
	[pk_importacao_fk_procedimento_tuss] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado_especialidade] [varchar](500) NULL,
	[fk_entidade_fk_entidade_cooperado_especialidade] [varchar](500) NULL,
	[principal_fk_entidade_cooperado_especialidade] [varchar](500) NULL,
	[fk_entidade_fk_grau_participacao] [varchar](500) NULL,
	[pk_importacao_fk_grau_participacao] [varchar](500) NULL,
	[codigo_ans_duplicado_fk_grau_participacao] [varchar](500) NULL,
	[pk_importacao_fk_cooperado_executante_complemento] [varchar](500) NULL,
	[pk_importacao_fk_atendimento] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_acomodacao] [varchar](500) NULL,
	[pk_importacao_fk_acomodacao] [varchar](500) NULL,
	[codigo_ans_duplicado_fk_acomodacao] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_via_acesso] [varchar](500) NULL,
	[pk_importacao_fk_via_acesso] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_guia] [varchar](500) NULL,
	[pk_importacao_fk_tipo_guia] [varchar](500) NULL,
	[sigla_fk_unidade_medida] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_unidade_medida] [varchar](500) NULL,
	[autorizado_unimed] [bit] NULL,
	[foiAlterado] [bit] NULL,
	[numero_guia] [varchar](255) NULL,
	[registro_adequecao] [bit] NULL,
	[fk_fatura_temp] [bigint] NULL,
	[pk_importacao_fk_fatura_temp] [varchar](500) NULL,
	[procedimentoConvertidoServicoEspecialRepasse] [bit] NULL,
	[procedimentoConvertidoCooperadoRepassado] [bit] NULL,
	[valor_acrescimo_convenio] [numeric](19, 2) NULL,
	[pk_importacao_fk_fatura] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
	[cbo] [varchar](255) NULL,
	[cbo_temp] [varchar](255) NULL,
	[pk_importacao_fk_unidade_medida] [varchar](500) NULL,
	[codPes_temp_fk_atendimento] [varchar](500) NULL,
	[fk_num_aten_fk_atendimento] [varchar](500) NULL,
	[pk_importacao_fk_entidade_fk_fatura_temp] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_procedimento_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_procedimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[data_realizacao] [date] NULL,
	[desconto_hospitalar] [bit] NULL,
	[faturar] [bit] NULL,
	[forcar_atendimento] [bit] NULL,
	[forma_execucao] [int] NULL,
	[guia_procedimento] [varchar](255) NULL,
	[hora_fim] [time](7) NULL,
	[hora_inicio] [time](7) NULL,
	[percentual_desconto_hospitalar] [numeric](19, 2) NULL,
	[quantidade] [bigint] NULL,
	[quantidade_ch] [numeric](19, 2) NULL,
	[quantidade_porte] [numeric](19, 2) NULL,
	[tuss] [bit] NULL,
	[urgencia] [bit] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_ch] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[valor_percentual] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_complexidade] [bigint] NULL,
	[fk_cooperado_executante_complemento] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca_anterior] [bigint] NULL,
	[fk_entidade_cooperado_especialidade] [bigint] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_procedimento_detalhar_unimed] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
	[fk_tecnica] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_unidade_medida] [bigint] NULL,
	[fk_via_acesso] [bigint] NULL,
	[codigo_item_despesa_temp] [bigint] NULL,
	[autorizado_unimed] [bit] NULL,
	[numero_guia] [varchar](255) NULL,
	[registro_adequecao] [bit] NULL,
	[valor_acrescimo_convenio] [numeric](19, 2) NULL,
	[cbo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_procedimento_detalhar_unimed]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_procedimento_detalhar_unimed](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_recebimento_cooperativa] [date] NULL,
	[observacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_usuario_cadastro] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_procedimento_detalhar_unimed_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_procedimento_detalhar_unimed_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_recebimento_cooperativa] [date] NULL,
	[observacao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_usuario_cadastro] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_procedimento_integracao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_procedimento_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_fim] [date] NULL,
	[data_inicio] [date] NULL,
	[data_realizacao] [date] NULL,
	[desconto_hospitalar] [bit] NULL,
	[faturar] [bit] NULL,
	[forcar_atendimento] [bit] NULL,
	[forma_execucao] [int] NULL,
	[guia_procedimento] [varchar](255) NULL,
	[hora_fim] [time](7) NULL,
	[hora_inicio] [time](7) NULL,
	[item_despesa_inconsitente] [varchar](255) NULL,
	[quantidade] [bigint] NULL,
	[quantidade_ch] [numeric](19, 2) NULL,
	[quantidade_porte] [numeric](19, 2) NULL,
	[tuss] [bit] NULL,
	[urgencia] [bit] NULL,
	[valor_acrescimo] [numeric](19, 2) NULL,
	[valor_ch] [numeric](19, 2) NULL,
	[valor_custo_operacional] [numeric](19, 2) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_filme] [numeric](19, 2) NULL,
	[valor_honorario] [numeric](19, 2) NULL,
	[valor_percentual] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_cooperado_executante_complemento] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca_anterior] [bigint] NULL,
	[fk_entidade_cooperado_especialidade] [bigint] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
	[fk_tecnica] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_unidade_medida] [bigint] NULL,
	[fk_via_acesso] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[descricao_acomodacao_temp] [varchar](255) NULL,
	[descricao_grau_Participacao_temp] [varchar](255) NULL,
	[codigo_item_despesa_temp] [varchar](255) NULL,
	[descricao_item_despesa_temp] [varchar](255) NULL,
	[NumSeqPrd_temp] [varchar](255) NULL,
	[cbo_temp] [varchar](255) NULL,
	[sendo_importado_temp] [bit] NULL,
	[pk_importacao_fk_tecnica] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tecnica] [varchar](500) NULL,
	[pk_importacao_fk_acomodacao] [varchar](500) NULL,
	[codigo_ans_duplicado_fk_acomodacao] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_acomodacao] [varchar](500) NULL,
	[codPes_temp_fk_atendimento] [varchar](500) NULL,
	[fk_num_aten_fk_atendimento] [varchar](500) NULL,
	[pk_importacao_fk_procedimento_tuss] [varchar](500) NULL,
	[codigo_fk_procedimento_tuss] [varchar](500) NULL,
	[pk_importacao_fk_unidade_medida] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_unidade_medida] [varchar](500) NULL,
	[pk_importacao_fk_grau_participacao] [varchar](500) NULL,
	[codigo_ans_duplicado_fk_grau_participacao] [varchar](500) NULL,
	[fk_entidade_fk_grau_participacao] [varchar](500) NULL,
	[pk_importacao_fk_tipo_guia] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_tipo_guia] [varchar](500) NULL,
	[pk_importacao_fk_cooperado_executante_complemento] [varchar](500) NULL,
	[pk_importacao_fk_via_acesso] [varchar](500) NULL,
	[fk_tipo_tabela_tiss_fk_via_acesso] [varchar](500) NULL,
	[principal_fk_entidade_cooperado_especialidade] [varchar](500) NULL,
	[fk_cooperado_fk_entidade_cooperado_especialidade] [varchar](500) NULL,
	[fk_entidade_fk_entidade_cooperado_especialidade] [varchar](500) NULL,
	[pk_importacao_fk_cooperado_recebedor_cobranca] [varchar](500) NULL,
	[acomodacao_de_para_hospital] [varchar](255) NULL,
	[codigo_procedimento_tuss] [varchar](255) NULL,
	[descricao_procedimento_tuss] [varchar](255) NULL,
	[documento] [varchar](255) NULL,
	[edicao] [bigint] NULL,
	[via_acesso_de_para_hospital] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_procedimento_integracao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_procedimento_integracao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[fk_acomodacao] [bigint] NULL,
	[fk_atendimento] [bigint] NULL,
	[fk_cooperado_executante_complemento] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca] [bigint] NULL,
	[fk_cooperado_recebedor_cobranca_anterior] [bigint] NULL,
	[fk_entidade_cooperado_especialidade] [bigint] NULL,
	[fk_grau_participacao] [bigint] NULL,
	[fk_item_despesa] [bigint] NULL,
	[fk_procedimento_tuss] [bigint] NULL,
	[fk_tecnica] [bigint] NULL,
	[fk_tipo_guia] [bigint] NULL,
	[fk_unidade_medida] [bigint] NULL,
	[fk_via_acesso] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_processamento_dirf]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_processamento_dirf](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_receita] [varchar](255) NULL,
	[data_processamento] [datetime2](7) NULL,
	[exceto_lista_cooperados] [bit] NULL,
	[numero_recibo] [varchar](255) NULL,
	[percentual] [numeric](19, 2) NULL,
	[retificadora] [bit] NULL,
	[status] [varchar](255) NULL,
	[tipo_cooperados] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[ano_calendario] [int] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_processamento_dirf_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_processamento_dirf_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_receita] [varchar](255) NULL,
	[data_processamento] [datetime2](7) NULL,
	[exceto_lista_cooperados] [bit] NULL,
	[numero_recibo] [varchar](255) NULL,
	[percentual] [numeric](19, 2) NULL,
	[retificadora] [bit] NULL,
	[status] [varchar](255) NULL,
	[tipo_cooperados] [bigint] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_dirf] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[ano_calendario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_recolhimento_inss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_recolhimento_inss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[valor_base_inss] [numeric](19, 2) NULL,
	[valor_devolucao] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_recolhimento_inss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_recolhimento_inss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[percentual] [numeric](19, 2) NULL,
	[valor_base_inss] [numeric](19, 2) NULL,
	[valor_devolucao] [numeric](19, 2) NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_1]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_1](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acomodacao] [varchar](255) NULL,
	[cid] [varchar](255) NULL,
	[codigoCliente] [varchar](255) NULL,
	[mesAnoCompetecia] [varchar](255) NULL,
	[nomeCliente] [varchar](255) NULL,
	[numeroAutorizacao] [varchar](255) NULL,
	[numeroPreImpresso] [varchar](255) NULL,
	[numeroPreImpresso2] [varchar](255) NULL,
	[numeroProntuario] [varchar](255) NULL,
	[prestadorDonoConta] [varchar](255) NULL,
	[tipoNota] [varchar](255) NULL,
	[tipoPaciente] [varchar](255) NULL,
	[tipoPlanoCliente] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_1_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_1_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[acomodacao] [varchar](255) NULL,
	[cid] [varchar](255) NULL,
	[codigoCliente] [varchar](255) NULL,
	[mesAnoCompetecia] [varchar](255) NULL,
	[nomeCliente] [varchar](255) NULL,
	[numeroAutorizacao] [varchar](255) NULL,
	[numeroPreImpresso] [varchar](255) NULL,
	[numeroPreImpresso2] [varchar](255) NULL,
	[numeroProntuario] [varchar](255) NULL,
	[prestadorDonoConta] [varchar](255) NULL,
	[tipoNota] [varchar](255) NULL,
	[tipoPaciente] [varchar](255) NULL,
	[tipoPlanoCliente] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_2]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_2](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoGlosa] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[erroConta] [varchar](255) NULL,
	[erroReapresentacao] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[totalConsultas] [varchar](255) NULL,
	[totalDiarias] [varchar](255) NULL,
	[totalExames] [varchar](255) NULL,
	[totalGabaritos] [varchar](255) NULL,
	[totalHonorarios] [varchar](255) NULL,
	[totalMateriais] [varchar](255) NULL,
	[totalMedicamentos] [varchar](255) NULL,
	[totalTaxas] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_2_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_2_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoGlosa] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[erroConta] [varchar](255) NULL,
	[erroReapresentacao] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[totalConsultas] [varchar](255) NULL,
	[totalDiarias] [varchar](255) NULL,
	[totalExames] [varchar](255) NULL,
	[totalGabaritos] [varchar](255) NULL,
	[totalHonorarios] [varchar](255) NULL,
	[totalMateriais] [varchar](255) NULL,
	[totalMedicamentos] [varchar](255) NULL,
	[totalTaxas] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_3]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_3](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[adequacaoItem] [varchar](255) NULL,
	[codigoAdequacao] [varchar](255) NULL,
	[codigoItem] [varchar](255) NULL,
	[complementacao] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[dataRealizacao] [varchar](255) NULL,
	[funcaoGP] [varchar](255) NULL,
	[glosado] [bit] NULL,
	[horaRealizacao] [varchar](255) NULL,
	[mesAnoPagamento] [varchar](255) NULL,
	[percentualPagamento] [varchar](255) NULL,
	[prestadorCobranca] [varchar](255) NULL,
	[prestadorExecutante] [varchar](255) NULL,
	[quantidadeCobrada] [varchar](255) NULL,
	[quantidadeFilme] [varchar](255) NULL,
	[quantidadePaga] [varchar](255) NULL,
	[quantidadeUT] [varchar](255) NULL,
	[sequenciaItem] [varchar](255) NULL,
	[tipoItem] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[totalCobrado] [varchar](255) NULL,
	[totalPago] [varchar](255) NULL,
	[usoFuturo] [varchar](255) NULL,
	[usoLivre] [varchar](255) NULL,
	[valorAntigo] [numeric](19, 2) NULL,
	[valorFilmePago] [varchar](255) NULL,
	[valorPago] [numeric](19, 2) NULL,
	[valorUT] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_3_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_3_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[adequacaoItem] [varchar](255) NULL,
	[codigoAdequacao] [varchar](255) NULL,
	[codigoItem] [varchar](255) NULL,
	[complementacao] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[dataRealizacao] [varchar](255) NULL,
	[funcaoGP] [varchar](255) NULL,
	[glosado] [bit] NULL,
	[horaRealizacao] [varchar](255) NULL,
	[mesAnoPagamento] [varchar](255) NULL,
	[percentualPagamento] [varchar](255) NULL,
	[prestadorCobranca] [varchar](255) NULL,
	[prestadorExecutante] [varchar](255) NULL,
	[quantidadeCobrada] [varchar](255) NULL,
	[quantidadeFilme] [varchar](255) NULL,
	[quantidadePaga] [varchar](255) NULL,
	[quantidadeUT] [varchar](255) NULL,
	[sequenciaItem] [varchar](255) NULL,
	[tipoItem] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[totalCobrado] [varchar](255) NULL,
	[totalPago] [varchar](255) NULL,
	[usoFuturo] [varchar](255) NULL,
	[usoLivre] [varchar](255) NULL,
	[valorAntigo] [numeric](19, 2) NULL,
	[valorFilmePago] [varchar](255) NULL,
	[valorPago] [numeric](19, 2) NULL,
	[valorUT] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_4]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_4](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoItem] [varchar](255) NULL,
	[funcaoGP] [varchar](255) NULL,
	[mesAnoAdequacao] [varchar](255) NULL,
	[mesAnoPagamentoAnterior] [varchar](255) NULL,
	[percentualPagamento] [varchar](255) NULL,
	[quantidadeAdequada] [varchar](255) NULL,
	[quantidadeUT] [varchar](255) NULL,
	[tipoItem] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[usoFuturo] [varchar](255) NULL,
	[valorCalculadoUnimed] [varchar](255) NULL,
	[valorTotalAntigo] [varchar](255) NULL,
	[valorTotalNovo] [varchar](255) NULL,
	[valorUT] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[linha] [varchar](255) NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_4_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_4_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoItem] [varchar](255) NULL,
	[funcaoGP] [varchar](255) NULL,
	[mesAnoAdequacao] [varchar](255) NULL,
	[mesAnoPagamentoAnterior] [varchar](255) NULL,
	[percentualPagamento] [varchar](255) NULL,
	[quantidadeAdequada] [varchar](255) NULL,
	[quantidadeUT] [varchar](255) NULL,
	[tipoItem] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[usoFuturo] [varchar](255) NULL,
	[valorCalculadoUnimed] [varchar](255) NULL,
	[valorTotalAntigo] [varchar](255) NULL,
	[valorTotalNovo] [varchar](255) NULL,
	[valorUT] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[linha] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_5]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_5](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoGlosa] [varchar](255) NULL,
	[erroItem] [varchar](255) NULL,
	[erroPassivelReapresentacao] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_5_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_5_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoGlosa] [varchar](255) NULL,
	[erroItem] [varchar](255) NULL,
	[erroPassivelReapresentacao] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_6]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_6](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoItem] [varchar](255) NULL,
	[complemento] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[creditoEstorno] [varchar](255) NULL,
	[dataRealizacao] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[horaRealizacao] [varchar](255) NULL,
	[motivo] [varchar](255) NULL,
	[prestadorExecutante] [varchar](255) NULL,
	[prestadorRecebedor] [varchar](255) NULL,
	[sequenciaItem] [varchar](255) NULL,
	[tipoItem] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[valor] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_6_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_6_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigoItem] [varchar](255) NULL,
	[complemento] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[creditoEstorno] [varchar](255) NULL,
	[dataRealizacao] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[horaRealizacao] [varchar](255) NULL,
	[motivo] [varchar](255) NULL,
	[prestadorExecutante] [varchar](255) NULL,
	[prestadorRecebedor] [varchar](255) NULL,
	[sequenciaItem] [varchar](255) NULL,
	[tipoItem] [varchar](255) NULL,
	[tipoRegistro] [varchar](255) NULL,
	[valor] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_7]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_7](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cooperativa] [varchar](255) NULL,
	[data_fim_plantao] [varchar](255) NULL,
	[data_inicio_plantao] [varchar](255) NULL,
	[descricao_local] [varchar](255) NULL,
	[filler] [varchar](255) NULL,
	[hora_fim_plantao] [varchar](255) NULL,
	[hora_inicio_plantao] [varchar](255) NULL,
	[local] [varchar](255) NULL,
	[prestador_executante] [varchar](255) NULL,
	[tipo_positivo_negativo] [varchar](255) NULL,
	[tipo_registro] [varchar](255) NULL,
	[valor_calculado] [varchar](255) NULL,
	[valor_plantao] [varchar](255) NULL,
	[valor_producoes] [varchar](255) NULL,
	[valor_receber] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_7_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_7_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cooperativa] [varchar](255) NULL,
	[data_fim_plantao] [varchar](255) NULL,
	[data_inicio_plantao] [varchar](255) NULL,
	[descricao_local] [varchar](255) NULL,
	[filler] [varchar](255) NULL,
	[hora_fim_plantao] [varchar](255) NULL,
	[hora_inicio_plantao] [varchar](255) NULL,
	[local] [varchar](255) NULL,
	[prestador_executante] [varchar](255) NULL,
	[tipo_positivo_negativo] [varchar](255) NULL,
	[tipo_registro] [varchar](255) NULL,
	[valor_calculado] [varchar](255) NULL,
	[valor_plantao] [varchar](255) NULL,
	[valor_producoes] [varchar](255) NULL,
	[valor_receber] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_8]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_8](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_atendimento] [varchar](255) NULL,
	[hora_atendimento] [varchar](255) NULL,
	[nome_cliente] [varchar](255) NULL,
	[tipo_registro] [varchar](255) NULL,
	[valor_producao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_8_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_8_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_atendimento] [varchar](255) NULL,
	[hora_atendimento] [varchar](255) NULL,
	[nome_cliente] [varchar](255) NULL,
	[tipo_registro] [varchar](255) NULL,
	[valor_producao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_9]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_9](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_cliente] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[data_realizacao] [varchar](255) NULL,
	[descricao_servico] [varchar](255) NULL,
	[nome_cliente] [varchar](255) NULL,
	[prestadorExecutante] [varchar](255) NULL,
	[tipo_registro] [varchar](255) NULL,
	[valor_total_sa] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_registro_importacao_unimed_tipo_9_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_registro_importacao_unimed_tipo_9_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo_cliente] [varchar](255) NULL,
	[cooperativa] [varchar](255) NULL,
	[data_realizacao] [varchar](255) NULL,
	[descricao_servico] [varchar](255) NULL,
	[nome_cliente] [varchar](255) NULL,
	[prestadorExecutante] [varchar](255) NULL,
	[tipo_registro] [varchar](255) NULL,
	[valor_total_sa] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_repasse]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_repasse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_confirmacao] [datetime2](7) NULL,
	[data_criacao] [datetime2](7) NULL,
	[devolucao_inss] [bit] NULL,
	[mes_ano_devolucao] [date] NULL,
	[numero_repasse] [bigint] NULL,
	[passo_processamento_repasse] [int] NULL,
	[processar_lancamento_correspondente] [bit] NULL,
	[processar_saldo_devedor] [bit] NULL,
	[servico_especial_fixo] [bit] NULL,
	[situacao_repasse] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_confirmacao] [bigint] NULL,
	[fk_usuario_criacao] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](500) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_repasse_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_repasse_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_confirmacao] [datetime2](7) NULL,
	[data_criacao] [datetime2](7) NULL,
	[devolucao_inss] [bit] NULL,
	[mes_ano_devolucao] [date] NULL,
	[numero_repasse] [bigint] NULL,
	[passo_processamento_repasse] [int] NULL,
	[processar_lancamento_correspondente] [bit] NULL,
	[processar_saldo_devedor] [bit] NULL,
	[servico_especial_fixo] [bit] NULL,
	[situacao_repasse] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_confirmacao] [bigint] NULL,
	[fk_usuario_criacao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_repasse_inconsistencia]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_repasse_inconsistencia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[inconsistencia] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_repasse_inconsistencia_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_repasse_inconsistencia_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[inconsistencia] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_repasse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_retorno_convenio]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_retorno_convenio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[sql_update] [varchar](255) NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_envio] [datetime2](7) NULL,
	[data_processamento] [datetime2](7) NULL,
	[nome_arquivo] [varchar](255) NULL,
	[processado] [bit] NULL,
	[quantidade_atendimentos] [bigint] NULL,
	[quantidade_processados] [bigint] NULL,
	[tipo_comparacao] [int] NULL,
	[valor_intervalo_final] [numeric](19, 2) NULL,
	[valor_intervalo_inicial] [numeric](19, 2) NULL,
	[valor_processado] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_envio] [bigint] NULL,
	[fk_usuario_processamento] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_retorno_convenio_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_retorno_convenio_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_envio] [datetime2](7) NULL,
	[data_processamento] [datetime2](7) NULL,
	[nome_arquivo] [varchar](255) NULL,
	[processado] [bit] NULL,
	[quantidade_atendimentos] [bigint] NULL,
	[quantidade_processados] [bigint] NULL,
	[tipo_comparacao] [int] NULL,
	[valor_intervalo_final] [numeric](19, 2) NULL,
	[valor_intervalo_inicial] [numeric](19, 2) NULL,
	[valor_processado] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_convenio] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_envio] [bigint] NULL,
	[fk_usuario_processamento] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_rotina_sistema]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_rotina_sistema](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_hora_fim] [datetime2](7) NULL,
	[data_hora_inicio] [datetime2](7) NULL,
	[percentual_atual] [numeric](19, 2) NULL,
	[rotina_sistema] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_fim] [bigint] NULL,
	[fk_usuario_inicio] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_rotina_sistema_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rotina_sistema_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_hora_fim] [datetime2](7) NULL,
	[data_hora_inicio] [datetime2](7) NULL,
	[percentual_atual] [numeric](19, 2) NULL,
	[rotina_sistema] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_usuario_fim] [bigint] NULL,
	[fk_usuario_inicio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_sefip]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_sefip](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[categoria_trabalhador] [bigint] NULL,
	[data_processamento] [datetime2](7) NULL,
	[mes_ano] [varchar](255) NULL,
	[modalidade] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[valor_inss] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_sefip_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_sefip_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[categoria_trabalhador] [bigint] NULL,
	[data_processamento] [datetime2](7) NULL,
	[mes_ano] [varchar](255) NULL,
	[modalidade] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[valor_inss] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_situacao_cooperado]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_situacao_cooperado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_situacao_cooperado_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_situacao_cooperado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_situacao_glosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_situacao_glosa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_situacao_glosa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_situacao_glosa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_sobra_integracao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_sobra_integracao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[numero] [varchar](255) NULL,
	[numero_cnes_entidade] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_sobra_integracao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_sobra_integracao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[numero] [varchar](255) NULL,
	[numero_cnes_entidade] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_integracao_sus] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_calculo]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_calculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[pk_importacao_fk_entidade] [varchar](50) NULL,
	[id_temporario] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_calculo_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_calculo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_honorarios]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_honorarios](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_entidade] [bigint] NULL,
	[fk_tabela_honorarios_original] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_honorarios_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_honorarios_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_entidade] [bigint] NULL,
	[fk_tabela_honorarios_original] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_tiss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_tiss](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](1000) NULL,
	[situacao] [bit] NULL,
	[sigla] [varchar](255) NULL,
	[enumerator] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_relacao_tuss] [bigint] NULL,
	[fk_tipo_tabela_tiss] [bigint] NULL,
	[codigo_ans_duplicado] [varchar](255) NULL,
	[codSascJava] [int] NULL,
	[sql_update] [varchar](255) NULL,
	[cboManad] [varchar](255) NULL,
	[descricao_detalhada] [varchar](255) NULL,
	[fk_unidade_federativa_fencom] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_tiss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_tiss_AUD](
	[discriminator] [varchar](31) NOT NULL,
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](1000) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_relacao_tuss] [bigint] NULL,
	[fk_tipo_tabela_tiss] [bigint] NULL,
	[sigla] [varchar](255) NULL,
	[enumerator] [int] NULL,
	[descricao_detalhada] [varchar](255) NULL,
	[fk_unidade_federativa_fencom] [bigint] NULL,
	[cboManad] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_tiss_versao_codigo]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_tiss_versao_codigo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tabela_tiss] [bigint] NULL,
	[codigo_ans_duplicado] [bit] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tabela_tiss_versao_codigo_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tabela_tiss_versao_codigo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[versao_tiss] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tabela_tiss] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_termo_aditivo]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_termo_aditivo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[descricao] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[valor_uco] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[pk_importacao_java] [varchar](50) NULL,
	[sql_update] [varchar](255) NULL,
	[pk_importacao_web] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_termo_aditivo_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_termo_aditivo_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_fim_vigencia] [date] NULL,
	[data_inicio_vigencia] [date] NULL,
	[descricao] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[valor_uco] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_empresa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_empresa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_empresa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_empresa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_endereco]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_endereco](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[convenio] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[entidade] [bit] NULL,
	[hospital] [bit] NULL,
	[pessoa_fisica] [bit] NULL,
	[pessoa_juridica] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_endereco_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_endereco_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[convenio] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[entidade] [bit] NULL,
	[hospital] [bit] NULL,
	[pessoa_fisica] [bit] NULL,
	[pessoa_juridica] [bit] NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_espelho]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_espelho](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_espelho_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_espelho_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_item_despesa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_item_despesa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_item_despesa_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_item_despesa_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_logradouro]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_logradouro](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_logradouro_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_logradouro_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_movimentacao]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_movimentacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[exige_matricula] [bit] NULL,
	[indicador_movimentacao] [int] NULL,
	[situacao_cooperado] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[fk_situacao_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_movimentacao_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_movimentacao_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[exige_matricula] [bit] NULL,
	[indicador_movimentacao] [int] NULL,
	[situacao_cooperado] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_situacao_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_pendencia]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_pendencia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_pendencia_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_pendencia_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_procedimento]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_procedimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [bigint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_procedimento_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_procedimento_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[codigo] [varchar](255) NULL,
	[descricao] [varchar](255) NULL,
	[situacao] [bit] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tipo_tabela_tiss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_tabela_tiss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[nome] [varchar](255) NULL,
	[numero_tabela] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tiss]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tiss](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_registro_transacao] [date] NULL,
	[hora_registro_transacao] [time](7) NULL,
	[login_prestador] [varchar](20) NOT NULL,
	[senha_prestador] [varchar](32) NOT NULL,
	[sequencial_transacao] [varchar](12) NOT NULL,
	[tipo_transacao] [int] NOT NULL,
	[versao_padrao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_destino] [bigint] NOT NULL,
	[fk_origem] [bigint] NOT NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_tiss_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tiss_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[data_registro_transacao] [date] NULL,
	[hora_registro_transacao] [time](7) NULL,
	[login_prestador] [varchar](20) NULL,
	[senha_prestador] [varchar](32) NULL,
	[sequencial_transacao] [varchar](12) NULL,
	[tipo_transacao] [int] NULL,
	[versao_padrao] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_destino] [bigint] NULL,
	[fk_origem] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_total_inss_cooperado]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_total_inss_cooperado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[diferenca_teto_base] [numeric](19, 2) NULL,
	[mes_ano] [date] NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[valor_teto_INSS] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_total_inss_cooperado_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_total_inss_cooperado_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[base_inss] [numeric](19, 2) NULL,
	[diferenca_teto_base] [numeric](19, 2) NULL,
	[mes_ano] [date] NULL,
	[valor_inss] [numeric](19, 2) NULL,
	[valor_teto_INSS] [numeric](19, 2) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_cooperado] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_uf_fencom]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_uf_fencom](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_uf_fencom_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_uf_fencom_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_url]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_url](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[url] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_caso_de_uso] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_url_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_url_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[descricao] [varchar](255) NULL,
	[url] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_caso_de_uso] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cpf] [varchar](255) NULL,
	[data_nascimento] [datetime2](7) NULL,
	[estado_civil] [int] NULL,
	[identidade] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[senha] [varchar](255) NULL,
	[sexo] [int] NULL,
	[situacao] [bit] NULL,
	[usuario] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_nacionalidade] [bigint] NULL,
	[fk_uf] [bigint] NULL,
	[data_ultima_alteracao_senha] [datetime2](7) NULL,
	[fk_usuario_alteracao_senha] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
	[dataNascimento] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_usuario_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_usuario_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[cpf] [varchar](255) NULL,
	[data_nascimento] [datetime2](7) NULL,
	[estado_civil] [int] NULL,
	[identidade] [varchar](255) NULL,
	[nome] [varchar](255) NULL,
	[observacao] [varchar](255) NULL,
	[senha] [varchar](255) NULL,
	[sexo] [int] NULL,
	[situacao] [bit] NULL,
	[usuario] [varchar](255) NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_nacionalidade] [bigint] NULL,
	[fk_uf] [bigint] NULL,
	[data_ultima_alteracao_senha] [datetime2](7) NULL,
	[fk_usuario_alteracao_senha] [bigint] NULL,
	[dataNascimento] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_vinculo_tipo_pessoa_endereco]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pk_importacao] [varchar](255) NULL,
	[resolveu_dependencia] [bit] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[tipoPessoa] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tipo_endereco] [bigint] NULL,
	[sql_update] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_vinculo_tipo_pessoa_endereco_AUD]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco_AUD](
	[id] [bigint] NOT NULL,
	[REV] [int] NOT NULL,
	[REVTYPE] [smallint] NULL,
	[data_ultima_alteracao] [datetime2](7) NULL,
	[registro_ativo] [bit] NULL,
	[tipoPessoa] [int] NULL,
	[fk_usuario_ultima_alteracao] [bigint] NULL,
	[fk_tipo_endereco] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[REV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[retornaCartaMotivoGlosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[retornaCartaMotivoGlosa](@idProcedimento AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   select stuff((
                   (SELECT ', ' + CAST(cartaGlosa.numero_carta AS VARCHAR(255))
                    FROM tb_glosa glosa
                    INNER JOIN tb_carta_glosa cartaGlosa on(glosa.fk_carta_glosa=cartaGlosa.id and cartaGlosa.registro_ativo=1)
                    WHERE glosa.fk_procedimento=@idProcedimento  AND glosa.registro_ativo=1
                      FOR XML PATH (''))),1,1,'')  as campo
   ) 


GO
/****** Object:  UserDefinedFunction [dbo].[retornaCodigoEMotivoGlosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[retornaCodigoEMotivoGlosa](@idProcedimento AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   select stuff((
                   (SELECT ', ' + CAST(motivoGlosa.pk_importacao AS VARCHAR(255))+ ' - '+ CAST(motivoGlosa.descricao AS VARCHAR(255))
                    FROM tb_glosa glosa
                    INNER JOIN tb_tabela_tiss motivoGlosa on(glosa.fk_motivo_glosa=motivoGlosa.id)
                    WHERE glosa.fk_procedimento=@idProcedimento  AND glosa.registro_ativo=1
                      FOR XML PATH (''))),1,1,'')  as campo
   ) 



GO
/****** Object:  UserDefinedFunction [dbo].[retornaCodigoEMotivoGlosaUnimed]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[retornaCodigoEMotivoGlosaUnimed](@idProcedimento AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   select stuff((
                   (SELECT ', ' + CAST(motivoGlosa.codigo AS VARCHAR(255))+ ' - '+ CAST(motivoGlosa.descricao AS VARCHAR(255))
                    FROM tb_glosa glosa
                    INNER JOIN tb_de_para_tuss_convenio motivoGlosa on(glosa.fk_motivo_glosa_unimed=motivoGlosa.id)
                    WHERE glosa.fk_procedimento=@idProcedimento  AND glosa.registro_ativo=1
                      FOR XML PATH (''))),1,1,'')  as campo
   ) 


GO
/****** Object:  UserDefinedFunction [dbo].[retornaFaturaConcatenado]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


                CREATE FUNCTION [dbo].[retornaFaturaConcatenado](@idProcedimento AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   select stuff(
                  (SELECT ', ' + CAST(fatura2.numero_fatura AS VARCHAR(10)) 
                   FROM tb_pagamento_procedimento pagamento2
                   INNER JOIN tb_fatura fatura2 on(pagamento2.fk_fatura=fatura2.id)
                   WHERE (pagamento2.valor_acrescimo+ pagamento2.valor_custo_operacional- pagamento2.valor_desconto+ pagamento2.valor_filme+ pagamento2.valor_honorario)>0
                     AND pagamento2.fk_procedimento=@idProcedimento AND pagamento2.registro_ativo=1
                     FOR XML PATH ('') ),1,1,'')  as campo
   ) 
GO
/****** Object:  UserDefinedFunction [dbo].[retornaMotivoGlosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[retornaMotivoGlosa](@idProcedimento AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   select stuff((
                   (SELECT ', ' + CAST(motivoGlosa.descricao AS VARCHAR(255))
                    FROM tb_glosa glosa
                    INNER JOIN tb_tabela_tiss motivoGlosa on(glosa.fk_motivo_glosa=motivoGlosa.id)
                    WHERE glosa.fk_procedimento=@idProcedimento  AND glosa.registro_ativo=1
                      FOR XML PATH (''))),1,1,'')  as campo
   ) 





GO
/****** Object:  UserDefinedFunction [dbo].[retornaRepasseConcatenato]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                CREATE FUNCTION [dbo].[retornaRepasseConcatenato](@idProcedimento AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   select stuff(
                  (SELECT ', ' + CAST(repasse2.numero_repasse AS VARCHAR(10)) 
                   FROM tb_procedimento procedimento
                                                                  LEFT JOIN tb_pagamento_procedimento pagamento2 on(pagamento2.fk_procedimento=procedimento.id and pagamento2.registro_ativo=1)
                   LEFT JOIN tb_fatura fatura2 on(pagamento2.fk_fatura=fatura2.id and fatura2.registro_ativo=1)
                   LEFT JOIN tb_pagamento_fatura pagamentoFatura2 on(fatura2.id=pagamentoFatura2.fk_fatura
                                                                      AND pagamentoFatura2.registro_ativo=1 and pagamentoFatura2.registro_ativo=1)
                                                                  LEFT JOIN tb_atendimento atendimento on(procedimento.fk_atendimento=atendimento.id and atendimento.registro_ativo=1)
                                                                  LEFT JOIN tb_pagamento_espelho pagamentoEspelho on(pagamentoEspelho.fk_espelho=atendimento.fk_espelho and pagamentoEspelho.registro_ativo=1)
                   LEFT JOIN tb_repasse repasse2 on((repasse2.id=pagamentoFatura2.fk_repasse or pagamentoEspelho.fk_repasse=repasse2.id) and repasse2.registro_ativo=1)
                   WHERE (pagamento2.valor_acrescimo+ pagamento2.valor_custo_operacional- pagamento2.valor_desconto+ pagamento2.valor_filme+ pagamento2.valor_honorario)>0
                     AND procedimento.id=@idProcedimento AND procedimento.registro_ativo=1
                     FOR XML PATH ('') ),1,1,'')  as campo
   ) 


GO
/****** Object:  UserDefinedFunction [dbo].[retornaSituacaoGlosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[retornaSituacaoGlosa](@idProcedimento AS INT) 
RETURNS TABLE 
AS 
RETURN 
( 
select stuff((
(SELECT ', ' + CAST(glosa.situacao AS VARCHAR(255))
FROM tb_glosa glosa
WHERE glosa.fk_procedimento=@idProcedimento AND glosa.registro_ativo=1
FOR XML PATH (''))),1,1,'') as campo
)

GO
/****** Object:  UserDefinedFunction [dbo].[retornaUsuarioCriacaoGlosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[retornaUsuarioCriacaoGlosa](@idProcedimento AS INT) 
RETURNS TABLE 
AS 
RETURN 
( 
select stuff((
(SELECT ', ' + CAST(usuario.nome AS VARCHAR(255))
FROM tb_glosa glosa
INNER JOIN rl_entidade_usuario entUsu on (entUsu.id = glosa.fk_entidade_usuario_criacao)
INNER JOIN tb_usuario usuario on(entUsu.fk_usuario = usuario.id)
WHERE glosa.fk_procedimento=@idProcedimento AND glosa.registro_ativo=1
FOR XML PATH (''))),1,1,'') as campo
)

GO
/****** Object:  UserDefinedFunction [dbo].[retornaUsuarioUltimaAlteracaoGlosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[retornaUsuarioUltimaAlteracaoGlosa](@idProcedimento AS INT) 
RETURNS TABLE 
AS 
RETURN 
( 
select stuff((
(SELECT ', ' + CAST(usuario.nome AS VARCHAR(255))
FROM tb_glosa glosa

INNER JOIN tb_usuario usuario on(glosa.fk_usuario_ultima_alteracao = usuario.id)
WHERE glosa.fk_procedimento=@idProcedimento AND glosa.registro_ativo=1
FOR XML PATH (''))),1,1,'') as campo
)


GO
/****** Object:  View [dbo].[vw_grid_carta_glosa]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_grid_carta_glosa] as (
SELECT obj.id AS idCarta,
       obj.numero_carta,
       obj.data_emissao,
       obj.data_vencimento,
       obj.texto_inicializacao,
       obj.observacao,
       obj.marcado_como_enviado,
       espelho.numero_espelho,
       espelho.id AS idEspelho,
       convenio.sigla,
       convenio.id AS idConvenio,
       entidadeConvenio.id AS idEntidadeConvenio,
       valorPendente =
  (SELECT coalesce(sum(glosaPendente.valor_acrescimo)+sum(glosaPendente.valor_honorario)-sum(glosaPendente.valor_desconto)+sum(glosaPendente.valor_filme) + sum(glosaPendente.valor_custo_operacional),0)
   FROM tb_glosa glosaPendente
   WHERE glosaPendente.fk_carta_glosa = obj.id
     AND glosaPendente.situacao IN(1,
                                   3,
								   7)
     AND glosaPendente.registro_ativo=1),
       valorPago = coalesce(
                              (SELECT coalesce(sum(glosaRecebida.valor_acrescimo)-sum(glosaRecebida.valor_desconto)+sum(glosaRecebida.valor_honorario)+sum(glosaRecebida.valor_filme)+ sum(glosaRecebida.valor_custo_operacional),0)
                               FROM tb_glosa glosaRecebida
                               WHERE fk_carta_glosa=obj.id
                                 AND situacao=4)+
                              coalesce((SELECT sum(tab.conta)
                               FROM
                                 (SELECT (glosaRecebidaParcialmente.valor_acrescimo)-(glosaRecebidaParcialmente.valor_desconto)+ (glosaRecebidaParcialmente.valor_honorario)+(glosaRecebidaParcialmente.valor_filme)+ (glosaRecebidaParcialmente.valor_custo_operacional)-
                                    (SELECT top 1 glosaPosterior.valor_acrescimo-glosaPosterior.valor_desconto+glosaPosterior.valor_honorario+glosaPosterior.valor_filme+glosaPosterior.valor_custo_operacional
                                     FROM tb_glosa glosaPosterior
                                     WHERE glosaPosterior.fk_procedimento=glosaRecebidaParcialmente.fk_procedimento
                                       AND glosaPosterior.id>glosaRecebidaParcialmente.id) AS conta
                                  FROM tb_glosa glosaRecebidaParcialmente
                                  WHERE glosaRecebidaParcialmente.situacao=5
                                    AND glosaRecebidaParcialmente.fk_carta_glosa=obj.id) AS tab),0),0),
                   valorGlosaDevida =
  (SELECT coalesce(sum(glosaDevida.valor_acrescimo)+sum(glosaDevida.valor_honorario)-sum(glosaDevida.valor_desconto)+sum(glosaDevida.valor_filme)+ sum(glosaDevida.valor_custo_operacional),0)
   FROM tb_glosa glosaDevida
   WHERE glosaDevida.fk_carta_glosa=obj.id
     AND glosaDevida.situacao IN(2)
     AND glosaDevida.registro_ativo=1),
                   valorGlosaNaoPaga =
  (SELECT coalesce(sum(glosaNaoPaga.valor_acrescimo)+sum(glosaNaoPaga.valor_honorario)-sum(glosaNaoPaga.valor_desconto)+sum(glosaNaoPaga.valor_filme)+ sum(glosaNaoPaga.valor_custo_operacional),0)
   FROM tb_glosa glosaNaoPaga
   WHERE glosaNaoPaga.fk_carta_glosa=obj.id
     AND glosaNaoPaga.situacao IN(6)
     AND glosaNaoPaga.registro_ativo=1),
                   entidadeConvenio.fk_entidade as idEntidade,

  (SELECT coalesce(sum(glosaTotal.valor_acrescimo)+sum(glosaTotal.valor_honorario)-sum(glosaTotal.valor_desconto)+sum(glosaTotal.valor_filme)+ sum(glosaTotal.valor_custo_operacional),0)
   FROM tb_glosa glosaTotal
   WHERE fk_carta_glosa=obj.id
     AND glosaTotal.registro_ativo=1) AS valorTotal
FROM tb_carta_glosa obj
INNER JOIN tb_espelho espelho ON (obj.fk_espelho = espelho.id
                                  AND espelho.registro_ativo=1
                                  AND obj.registro_ativo=1)
INNER JOIN rl_entidade_convenio entidadeConvenio ON(espelho.fk_entidade_convenio=entidadeConvenio.id
                                                    AND entidadeConvenio.registro_ativo=1)
INNER JOIN tb_convenio convenio ON(entidadeConvenio.fk_convenio=convenio.id
                                   AND convenio.registro_ativo=1)
GROUP BY obj.id,
         obj.numero_carta,
         obj.data_emissao,
         obj.data_vencimento,
         obj.texto_inicializacao,
         obj.observacao,
         obj.marcado_como_enviado,
         espelho.numero_espelho,
         espelho.id,
         entidadeConvenio.fk_entidade,
         convenio.sigla,
         convenio.id,
         entidadeConvenio.id)


GO
/****** Object:  Index [NonClusteredIndex-20160108-151429]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160108-151429] ON [dbo].[rl_entidade_convenio]
(
	[fk_entidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161024-131621]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161024-131621] ON [dbo].[rl_entidade_convenio]
(
	[fk_convenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-093725]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-093725] ON [dbo].[rl_entidade_cooperado]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160108-144241]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160108-144241] ON [dbo].[rl_entidade_motivo_glosa]
(
	[fk_entidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161024-131735]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161024-131735] ON [dbo].[rl_entidadeconvenio_complemento]
(
	[fk_entidade_convenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-094002]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-094002] ON [dbo].[rl_integracao_sus_valores]
(
	[fk_executante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20160217-103125]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160217-103125] ON [dbo].[rl_integracao_sus_valores]
(
	[aih] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160217-103139]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160217-103139] ON [dbo].[rl_integracao_sus_valores]
(
	[fk_entidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160217-103156]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160217-103156] ON [dbo].[rl_integracao_sus_valores]
(
	[fk_executante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20160217-103307]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160217-103307] ON [dbo].[rl_integracao_sus_valores]
(
	[crm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-094212]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-094212] ON [dbo].[rl_lancamento_repasse_cooperado]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-094351]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-094351] ON [dbo].[rl_repasse_calculado]
(
	[fk_cooperado_lancamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-094548]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-094548] ON [dbo].[rl_repasse_dependente]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-094657]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-094657] ON [dbo].[rl_repasse_memoria_calculo]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-094955]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-094955] ON [dbo].[rl_saldo_repasse_fixo]
(
	[fk_servico_especial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160108-133506]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160108-133506] ON [dbo].[tb_atendimento]
(
	[fk_espelho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160108-160512]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160108-160512] ON [dbo].[tb_atendimento]
(
	[fk_convenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160122-104057]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160122-104057] ON [dbo].[tb_atendimento]
(
	[ano_atendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160125-111148]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160125-111148] ON [dbo].[tb_atendimento]
(
	[fk_importacao_unimed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160129-141335]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160129-141335] ON [dbo].[tb_atendimento]
(
	[fk_integracao_sus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-112521]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-112521] ON [dbo].[tb_atendimento]
(
	[ano_atendimento] DESC,
	[numero_atendimento_automatico] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-115022]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-115022] ON [dbo].[tb_atendimento]
(
	[fk_hospital] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-121551]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-121551] ON [dbo].[tb_atendimento]
(
	[autorizado_unimed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-122833]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-122833] ON [dbo].[tb_atendimento]
(
	[registro_ativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-095447]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-095447] ON [dbo].[tb_campo_fixo_digitacao]
(
	[fk_cooperado_recebedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-100135]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-100135] ON [dbo].[tb_campos_fixos_integracao]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160126-122139]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160126-122139] ON [dbo].[tb_dados_complementares]
(
	[fk_atendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-100314]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-100314] ON [dbo].[tb_dados_solicitacao]
(
	[fk_cooperado_solicitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-100421]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-100421] ON [dbo].[tb_declaracao_inss]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-100519]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-100519] ON [dbo].[tb_endereco]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160122-104228]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160122-104228] ON [dbo].[tb_glosa]
(
	[fk_procedimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-122634]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-122634] ON [dbo].[tb_glosa]
(
	[fk_motivo_glosa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20170417-110601]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170417-110601] ON [dbo].[tb_memoria_calculo]
(
	[fk_procedimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161107-164117]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161107-164117] ON [dbo].[tb_pagamento_fatura]
(
	[fk_fatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160108-134815]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160108-134815] ON [dbo].[tb_pagamento_procedimento]
(
	[fk_procedimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-122111]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-122111] ON [dbo].[tb_pagamento_procedimento]
(
	[fk_fatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-123123]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-123123] ON [dbo].[tb_pagamento_procedimento]
(
	[registro_ativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-100815]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-100815] ON [dbo].[tb_plantao_lancamento]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160108-112304]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160108-112304] ON [dbo].[tb_procedimento]
(
	[fk_atendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-100908]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-100908] ON [dbo].[tb_procedimento]
(
	[fk_cooperado_executante_complemento] ASC,
	[fk_cooperado_recebedor_cobranca] ASC,
	[fk_cooperado_recebedor_cobranca_anterior] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161024-131835]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161024-131835] ON [dbo].[tb_procedimento]
(
	[fk_item_despesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161109-123017]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161109-123017] ON [dbo].[tb_procedimento]
(
	[registro_ativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-101242]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-101242] ON [dbo].[tb_procedimento_integracao]
(
	[fk_cooperado_executante_complemento] ASC,
	[fk_cooperado_recebedor_cobranca] ASC,
	[fk_cooperado_recebedor_cobranca_anterior] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20170411-080731]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170411-080731] ON [dbo].[tb_tabela_tiss_versao_codigo]
(
	[fk_tabela_tiss] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20170411-080743]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170411-080743] ON [dbo].[tb_tabela_tiss_versao_codigo]
(
	[registro_ativo] ASC,
	[versao_tiss] ASC,
	[fk_tabela_tiss] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160208-101357]    Script Date: 16/06/2017 11:02:36 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160208-101357] ON [dbo].[tb_total_inss_cooperado]
(
	[fk_cooperado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ctm_consultaAtendimento]  WITH NOCHECK ADD  CONSTRAINT [FK168B59F860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[ctm_consultaAtendimento] CHECK CONSTRAINT [FK168B59F860877044]
GO
ALTER TABLE [dbo].[ctm_consultaAtendimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCD09CBC9DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[ctm_consultaAtendimento_AUD] CHECK CONSTRAINT [FKCD09CBC9DF74E053]
GO
ALTER TABLE [dbo].[rl_atendimento_inconsistencia]  WITH NOCHECK ADD  CONSTRAINT [FK3558E47260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_inconsistencia] CHECK CONSTRAINT [FK3558E47260877044]
GO
ALTER TABLE [dbo].[rl_atendimento_inconsistencia]  WITH NOCHECK ADD  CONSTRAINT [FK3558E4728B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_inconsistencia] CHECK CONSTRAINT [FK3558E4728B6715CA]
GO
ALTER TABLE [dbo].[rl_atendimento_inconsistencia_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CB98943DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_atendimento_inconsistencia_AUD] CHECK CONSTRAINT [FK5CB98943DF74E053]
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao]  WITH NOCHECK ADD  CONSTRAINT [FK94B7138317ED5EC4] FOREIGN KEY([fk_motivo_exclusao_guias])
REFERENCES [dbo].[tb_motivo_exclusao_guias] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao] CHECK CONSTRAINT [FK94B7138317ED5EC4]
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao]  WITH NOCHECK ADD  CONSTRAINT [FK94B7138360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao] CHECK CONSTRAINT [FK94B7138360877044]
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao]  WITH NOCHECK ADD  CONSTRAINT [FK94B713838B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao] CHECK CONSTRAINT [FK94B713838B6715CA]
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7457C7D4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_atendimento_motivo_exclusao_AUD] CHECK CONSTRAINT [FK7457C7D4DF74E053]
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia]  WITH NOCHECK ADD  CONSTRAINT [FKD4EA80103DC3280D] FOREIGN KEY([fk_tipo_pendencia])
REFERENCES [dbo].[tb_tipo_pendencia] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia] CHECK CONSTRAINT [FKD4EA80103DC3280D]
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia]  WITH NOCHECK ADD  CONSTRAINT [FKD4EA801060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia] CHECK CONSTRAINT [FKD4EA801060877044]
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia]  WITH NOCHECK ADD  CONSTRAINT [FKD4EA80108B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia] CHECK CONSTRAINT [FKD4EA80108B6715CA]
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CB825E1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_atendimento_tipo_pendencia_AUD] CHECK CONSTRAINT [FK5CB825E1DF74E053]
GO
ALTER TABLE [dbo].[rl_coluna_relatorio_resumo_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK4FF33DB558D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_coluna_relatorio_resumo_repasse] CHECK CONSTRAINT [FK4FF33DB558D83D4E]
GO
ALTER TABLE [dbo].[rl_coluna_relatorio_resumo_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK4FF33DB560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_coluna_relatorio_resumo_repasse] CHECK CONSTRAINT [FK4FF33DB560877044]
GO
ALTER TABLE [dbo].[rl_coluna_relatorio_resumo_repasse_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK842F8906DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_coluna_relatorio_resumo_repasse_AUD] CHECK CONSTRAINT [FK842F8906DF74E053]
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FKEB804D8660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao] CHECK CONSTRAINT [FKEB804D8660877044]
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FKEB804D8674D0DB1C] FOREIGN KEY([fk_entidade_convenio_despesa])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao] CHECK CONSTRAINT [FKEB804D8674D0DB1C]
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FKEB804D86CB8BC4EB] FOREIGN KEY([fk_entidade_acomodacao])
REFERENCES [dbo].[rl_entidade_acomodacao] ([id])
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao] CHECK CONSTRAINT [FKEB804D86CB8BC4EB]
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK701E4857DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_convenio_despesa_acomodacao_AUD] CHECK CONSTRAINT [FK701E4857DF74E053]
GO
ALTER TABLE [dbo].[rl_cooperado_cbo]  WITH NOCHECK ADD  CONSTRAINT [FKAC40629E2E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_cooperado_cbo] CHECK CONSTRAINT [FKAC40629E2E72EFA3]
GO
ALTER TABLE [dbo].[rl_cooperado_cbo]  WITH NOCHECK ADD  CONSTRAINT [FKAC40629E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_cooperado_cbo] CHECK CONSTRAINT [FKAC40629E60877044]
GO
ALTER TABLE [dbo].[rl_cooperado_cbo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKFA1E116FDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_cooperado_cbo_AUD] CHECK CONSTRAINT [FKFA1E116FDF74E053]
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao]  WITH NOCHECK ADD  CONSTRAINT [FK34FDA6152E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao] CHECK CONSTRAINT [FK34FDA6152E72EFA3]
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao]  WITH NOCHECK ADD  CONSTRAINT [FK34FDA61560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao] CHECK CONSTRAINT [FK34FDA61560877044]
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao]  WITH NOCHECK ADD  CONSTRAINT [FK34FDA615C92F8567] FOREIGN KEY([fk_tipo_movimentacao])
REFERENCES [dbo].[tb_tipo_movimentacao] ([id])
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao] CHECK CONSTRAINT [FK34FDA615C92F8567]
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK930EC166DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_cooperado_movimentacao_AUD] CHECK CONSTRAINT [FK930EC166DF74E053]
GO
ALTER TABLE [dbo].[rl_darf_emitida]  WITH CHECK ADD  CONSTRAINT [FK434DF10A58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_darf_emitida] CHECK CONSTRAINT [FK434DF10A58D83D4E]
GO
ALTER TABLE [dbo].[rl_darf_emitida]  WITH CHECK ADD  CONSTRAINT [FK434DF10A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_darf_emitida] CHECK CONSTRAINT [FK434DF10A60877044]
GO
ALTER TABLE [dbo].[rl_darf_emitida]  WITH CHECK ADD  CONSTRAINT [FK434DF10A6286CFF8] FOREIGN KEY([fk_darf])
REFERENCES [dbo].[tb_darf] ([id])
GO
ALTER TABLE [dbo].[rl_darf_emitida] CHECK CONSTRAINT [FK434DF10A6286CFF8]
GO
ALTER TABLE [dbo].[rl_darf_emitida_AUD]  WITH CHECK ADD  CONSTRAINT [FK19A689DBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_darf_emitida_AUD] CHECK CONSTRAINT [FK19A689DBDF74E053]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA8625473B9F7028] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_CBHPM_3])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA8625473B9F7028]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA8625473B9F7029] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_CBHPM_4])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA8625473B9F7029]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA8625473B9F702A] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_CBHPM_5])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA8625473B9F702A]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA86254760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA86254760877044]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA86254761612363] FOREIGN KEY([fk_item_despesa_tuss])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA86254761612363]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA86254775BF9956] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_AMB_1990])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA86254775BF9956]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA86254775BF9958] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_AMB_1992])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA86254775BF9958]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA86254775BF995C] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_AMB_1996])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA86254775BF995C]
GO
ALTER TABLE [dbo].[rl_de_para_tuss]  WITH CHECK ADD  CONSTRAINT [FKAA86254775BF995F] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_AMB_1999])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_de_para_tuss] CHECK CONSTRAINT [FKAA86254775BF995F]
GO
ALTER TABLE [dbo].[rl_de_para_tuss_AUD]  WITH CHECK ADD  CONSTRAINT [FK5005798DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_de_para_tuss_AUD] CHECK CONSTRAINT [FK5005798DF74E053]
GO
ALTER TABLE [dbo].[rl_despesa_removida_da_entidade_tabela]  WITH NOCHECK ADD  CONSTRAINT [FKC5D38FF160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_despesa_removida_da_entidade_tabela] CHECK CONSTRAINT [FKC5D38FF160877044]
GO
ALTER TABLE [dbo].[rl_despesa_removida_da_entidade_tabela]  WITH NOCHECK ADD  CONSTRAINT [FKC5D38FF1C3DF5369] FOREIGN KEY([fk_despesa_tabela_honorarios_removida])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_despesa_removida_da_entidade_tabela] CHECK CONSTRAINT [FKC5D38FF1C3DF5369]
GO
ALTER TABLE [dbo].[rl_despesa_removida_da_entidade_tabela_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK90E45D42DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_despesa_removida_da_entidade_tabela_AUD] CHECK CONSTRAINT [FK90E45D42DF74E053]
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho]  WITH NOCHECK ADD  CONSTRAINT [FKB64CB4D12B7463CE] FOREIGN KEY([fk_horario_trabalho])
REFERENCES [dbo].[tb_horario_trabalho] ([id])
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho] CHECK CONSTRAINT [FKB64CB4D12B7463CE]
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho]  WITH NOCHECK ADD  CONSTRAINT [FKB64CB4D160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho] CHECK CONSTRAINT [FKB64CB4D160877044]
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKA4801222DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_AUD] CHECK CONSTRAINT [FKA4801222DF74E053]
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario]  WITH NOCHECK ADD  CONSTRAINT [FK58DBEDC02B7463CE] FOREIGN KEY([fk_horario_trabalho])
REFERENCES [dbo].[tb_horario_trabalho] ([id])
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario] CHECK CONSTRAINT [FK58DBEDC02B7463CE]
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario]  WITH NOCHECK ADD  CONSTRAINT [FK58DBEDC060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario] CHECK CONSTRAINT [FK58DBEDC060877044]
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK89DB3B91DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_dias_semana_horario_trabalho_usuario_AUD] CHECK CONSTRAINT [FK89DB3B91DF74E053]
GO
ALTER TABLE [dbo].[rl_dirf_capital]  WITH CHECK ADD  CONSTRAINT [FK6C8AB68760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_capital] CHECK CONSTRAINT [FK6C8AB68760877044]
GO
ALTER TABLE [dbo].[rl_dirf_capital]  WITH CHECK ADD  CONSTRAINT [FK6C8AB687B5D8BA43] FOREIGN KEY([fk_dirf_cooperados])
REFERENCES [dbo].[rl_dirf_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_capital] CHECK CONSTRAINT [FK6C8AB687B5D8BA43]
GO
ALTER TABLE [dbo].[rl_dirf_capital_AUD]  WITH CHECK ADD  CONSTRAINT [FK23DA48D8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_dirf_capital_AUD] CHECK CONSTRAINT [FK23DA48D8DF74E053]
GO
ALTER TABLE [dbo].[rl_dirf_cooperado]  WITH CHECK ADD  CONSTRAINT [FKF947931147F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_cooperado] CHECK CONSTRAINT [FKF947931147F1200E]
GO
ALTER TABLE [dbo].[rl_dirf_cooperado]  WITH CHECK ADD  CONSTRAINT [FKF947931160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_cooperado] CHECK CONSTRAINT [FKF947931160877044]
GO
ALTER TABLE [dbo].[rl_dirf_cooperado]  WITH CHECK ADD  CONSTRAINT [FKF947931162870C08] FOREIGN KEY([fk_dirf])
REFERENCES [dbo].[tb_dirf] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_cooperado] CHECK CONSTRAINT [FKF947931162870C08]
GO
ALTER TABLE [dbo].[rl_dirf_cooperado_AUD]  WITH CHECK ADD  CONSTRAINT [FK1661D062DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_dirf_cooperado_AUD] CHECK CONSTRAINT [FK1661D062DF74E053]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse]  WITH CHECK ADD  CONSTRAINT [FK96211BDD502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse] CHECK CONSTRAINT [FK96211BDD502D5D01]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse]  WITH CHECK ADD  CONSTRAINT [FK96211BDD60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse] CHECK CONSTRAINT [FK96211BDD60877044]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse]  WITH CHECK ADD  CONSTRAINT [FK96211BDD62870C08] FOREIGN KEY([fk_dirf])
REFERENCES [dbo].[tb_dirf] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse] CHECK CONSTRAINT [FK96211BDD62870C08]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse_AUD]  WITH CHECK ADD  CONSTRAINT [FK2672132EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_repasse_AUD] CHECK CONSTRAINT [FK2672132EDF74E053]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores]  WITH CHECK ADD  CONSTRAINT [FK62B4A02E502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores] CHECK CONSTRAINT [FK62B4A02E502D5D01]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores]  WITH CHECK ADD  CONSTRAINT [FK62B4A02E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores] CHECK CONSTRAINT [FK62B4A02E60877044]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores]  WITH CHECK ADD  CONSTRAINT [FK62B4A02EB5D8BA43] FOREIGN KEY([fk_dirf_cooperados])
REFERENCES [dbo].[rl_dirf_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores] CHECK CONSTRAINT [FK62B4A02EB5D8BA43]
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores_AUD]  WITH CHECK ADD  CONSTRAINT [FKBA1906FFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_dirf_lancamento_valores_AUD] CHECK CONSTRAINT [FKBA1906FFDF74E053]
GO
ALTER TABLE [dbo].[rl_dirf_valores]  WITH CHECK ADD  CONSTRAINT [FK596B719158D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_valores] CHECK CONSTRAINT [FK596B719158D83D4E]
GO
ALTER TABLE [dbo].[rl_dirf_valores]  WITH CHECK ADD  CONSTRAINT [FK596B719160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_valores] CHECK CONSTRAINT [FK596B719160877044]
GO
ALTER TABLE [dbo].[rl_dirf_valores]  WITH CHECK ADD  CONSTRAINT [FK596B7191B5D8BA43] FOREIGN KEY([fk_dirf_cooperados])
REFERENCES [dbo].[rl_dirf_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_dirf_valores] CHECK CONSTRAINT [FK596B7191B5D8BA43]
GO
ALTER TABLE [dbo].[rl_dirf_valores_AUD]  WITH CHECK ADD  CONSTRAINT [FKEC726EE2DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_dirf_valores_AUD] CHECK CONSTRAINT [FKEC726EE2DF74E053]
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade]  WITH CHECK ADD  CONSTRAINT [FKC981B4F23340366] FOREIGN KEY([fk_enderecoTmp])
REFERENCES [dbo].[tb_endereco_tmp] ([id])
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade] CHECK CONSTRAINT [FKC981B4F23340366]
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade]  WITH CHECK ADD  CONSTRAINT [FKC981B4F258D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade] CHECK CONSTRAINT [FKC981B4F258D83D4E]
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade]  WITH CHECK ADD  CONSTRAINT [FKC981B4F260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade] CHECK CONSTRAINT [FKC981B4F260877044]
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade_AUD]  WITH CHECK ADD  CONSTRAINT [FK170619C3DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_enderecotmp_entidade_AUD] CHECK CONSTRAINT [FK170619C3DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FK37C6BFA358D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao] CHECK CONSTRAINT [FK37C6BFA358D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FK37C6BFA360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao] CHECK CONSTRAINT [FK37C6BFA360877044]
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FK37C6BFA3E7CE6755] FOREIGN KEY([fk_acomodacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao] CHECK CONSTRAINT [FK37C6BFA3E7CE6755]
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK717463F4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_AUD] CHECK CONSTRAINT [FK717463F4DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK9072872D58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_integracao] CHECK CONSTRAINT [FK9072872D58D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK9072872DE7CE6755] FOREIGN KEY([fk_acomodacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_integracao] CHECK CONSTRAINT [FK9072872DE7CE6755]
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_integracao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK787D567EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_acomodacao_integracao_AUD] CHECK CONSTRAINT [FK787D567EDF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_classificacao_espelho]  WITH NOCHECK ADD  CONSTRAINT [FK272D7B3258D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_classificacao_espelho] CHECK CONSTRAINT [FK272D7B3258D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_classificacao_espelho]  WITH NOCHECK ADD  CONSTRAINT [FK272D7B3260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_classificacao_espelho] CHECK CONSTRAINT [FK272D7B3260877044]
GO
ALTER TABLE [dbo].[rl_entidade_classificacao_espelho_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK90E4C003DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_classificacao_espelho_AUD] CHECK CONSTRAINT [FK90E4C003DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional]  WITH NOCHECK ADD  CONSTRAINT [FK15733D8558D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional] CHECK CONSTRAINT [FK15733D8558D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional]  WITH NOCHECK ADD  CONSTRAINT [FK15733D8560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional] CHECK CONSTRAINT [FK15733D8560877044]
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional]  WITH NOCHECK ADD  CONSTRAINT [FK15733D85EE7CFB07] FOREIGN KEY([fk_conselho_profissional])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional] CHECK CONSTRAINT [FK15733D85EE7CFB07]
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK870B20D6DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_conselho_profissional_AUD] CHECK CONSTRAINT [FK870B20D6DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK7AA9C3411015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C3411015879C]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH CHECK ADD  CONSTRAINT [FK7AA9C34119153F6C] FOREIGN KEY([fk_tipo_item_despesa])
REFERENCES [dbo].[tb_tipo_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C34119153F6C]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK7AA9C3412125B766] FOREIGN KEY([fk_impostos])
REFERENCES [dbo].[tb_impostos] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C3412125B766]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK7AA9C341316F681A] FOREIGN KEY([fk_lancamento_custo_op])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C341316F681A]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH CHECK ADD  CONSTRAINT [FK7AA9C34133F16C1F] FOREIGN KEY([fk_ch])
REFERENCES [dbo].[tb_ch] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C34133F16C1F]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK7AA9C34158D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C34158D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK7AA9C34160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C34160877044]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH CHECK ADD  CONSTRAINT [FK7AA9C341892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C341892ABB48]
GO
ALTER TABLE [dbo].[rl_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK7AA9C3419F477421] FOREIGN KEY([fk_lancamento_honorario])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio] CHECK CONSTRAINT [FK7AA9C3419F477421]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKBDD06892DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_AUD] CHECK CONSTRAINT [FKBDD06892DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKDEE5EFF660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios] CHECK CONSTRAINT [FKDEE5EFF660877044]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios]  WITH CHECK ADD  CONSTRAINT [FKDEE5EFF661900828] FOREIGN KEY([fk_entidade_daddos_bancarios])
REFERENCES [dbo].[rl_entidade_dados_bancarios] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios] CHECK CONSTRAINT [FKDEE5EFF661900828]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKDEE5EFF6700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios] CHECK CONSTRAINT [FKDEE5EFF6700F167]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKDEE5EFF6EE1AB320] FOREIGN KEY([fk_banco])
REFERENCES [dbo].[tb_banco] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios] CHECK CONSTRAINT [FKDEE5EFF6EE1AB320]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK1A0D32C7DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_dados_bancarios_AUD] CHECK CONSTRAINT [FK1A0D32C7DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK800D450560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa] CHECK CONSTRAINT [FK800D450560877044]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK800D4505619A8DF9] FOREIGN KEY([fk_entidade_convenio_tipo_espelho])
REFERENCES [dbo].[rl_entidadeconvenio_tipo_espelho] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa] CHECK CONSTRAINT [FK800D4505619A8DF9]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK800D4505BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa] CHECK CONSTRAINT [FK800D4505BF1B1049]
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7E556856DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_convenio_tipo_espelho_item_despesa_AUD] CHECK CONSTRAINT [FK7E556856DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK5397EF447F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado] CHECK CONSTRAINT [FK5397EF447F1200E]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado]  WITH CHECK ADD  CONSTRAINT [FK5397EF44A54C290] FOREIGN KEY([fk_especialidade])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado] CHECK CONSTRAINT [FK5397EF44A54C290]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK5397EF458D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado] CHECK CONSTRAINT [FK5397EF458D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK5397EF460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado] CHECK CONSTRAINT [FK5397EF460877044]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKBDE512C5DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_AUD] CHECK CONSTRAINT [FKBDE512C5DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao]  WITH CHECK ADD  CONSTRAINT [FK9E56DDD53E14F66] FOREIGN KEY([fk_cooperado_origem])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao] CHECK CONSTRAINT [FK9E56DDD53E14F66]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao]  WITH NOCHECK ADD  CONSTRAINT [FK9E56DDD558D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao] CHECK CONSTRAINT [FK9E56DDD558D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao]  WITH NOCHECK ADD  CONSTRAINT [FK9E56DDD560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao] CHECK CONSTRAINT [FK9E56DDD560877044]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao]  WITH NOCHECK ADD  CONSTRAINT [FK9E56DDD56CEF7B6C] FOREIGN KEY([fk_entidade_cooperado_destino])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao] CHECK CONSTRAINT [FK9E56DDD56CEF7B6C]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao]  WITH NOCHECK ADD  CONSTRAINT [FK9E56DDD5B9969239] FOREIGN KEY([fk_entidade_cooperado_origem])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao] CHECK CONSTRAINT [FK9E56DDD5B9969239]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao]  WITH CHECK ADD  CONSTRAINT [FK9E56DDD5C9A60CD7] FOREIGN KEY([fk_cooperado_destino])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao] CHECK CONSTRAINT [FK9E56DDD5C9A60CD7]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKB9861926DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_conversao_AUD] CHECK CONSTRAINT [FKB9861926DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKE765E5A92E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios] CHECK CONSTRAINT [FKE765E5A92E72EFA3]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKE765E5A960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios] CHECK CONSTRAINT [FKE765E5A960877044]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKE765E5A9EE1AB320] FOREIGN KEY([fk_banco])
REFERENCES [dbo].[tb_banco] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios] CHECK CONSTRAINT [FKE765E5A9EE1AB320]
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK516516FADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_cooperado_dados_bancarios_AUD] CHECK CONSTRAINT [FK516516FADF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKC4C014B658D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios] CHECK CONSTRAINT [FKC4C014B658D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKC4C014B660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios] CHECK CONSTRAINT [FKC4C014B660877044]
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios]  WITH CHECK ADD  CONSTRAINT [FKC4C014B6700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios] CHECK CONSTRAINT [FKC4C014B6700F167]
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios]  WITH NOCHECK ADD  CONSTRAINT [FKC4C014B6EE1AB320] FOREIGN KEY([fk_banco])
REFERENCES [dbo].[tb_banco] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios] CHECK CONSTRAINT [FKC4C014B6EE1AB320]
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK88C6F787DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_dados_bancarios_AUD] CHECK CONSTRAINT [FK88C6F787DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios]  WITH NOCHECK ADD  CONSTRAINT [FKDBF633D258D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios] CHECK CONSTRAINT [FKDBF633D258D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios]  WITH NOCHECK ADD  CONSTRAINT [FKDBF633D260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios] CHECK CONSTRAINT [FKDBF633D260877044]
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios]  WITH NOCHECK ADD  CONSTRAINT [FKDBF633D2892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios] CHECK CONSTRAINT [FKDBF633D2892ABB48]
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCB6028A3DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_edicao_tabela_honorarios_AUD] CHECK CONSTRAINT [FKCB6028A3DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_feriado]  WITH NOCHECK ADD  CONSTRAINT [FKE45E3B7858D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_feriado] CHECK CONSTRAINT [FKE45E3B7858D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_feriado]  WITH NOCHECK ADD  CONSTRAINT [FKE45E3B7860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_feriado] CHECK CONSTRAINT [FKE45E3B7860877044]
GO
ALTER TABLE [dbo].[rl_entidade_feriado]  WITH NOCHECK ADD  CONSTRAINT [FKE45E3B788788EA96] FOREIGN KEY([fk_feriado])
REFERENCES [dbo].[tb_feriado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_feriado] CHECK CONSTRAINT [FKE45E3B788788EA96]
GO
ALTER TABLE [dbo].[rl_entidade_feriado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCB8FED49DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_feriado_AUD] CHECK CONSTRAINT [FKCB8FED49DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao]  WITH NOCHECK ADD  CONSTRAINT [FK8795712658D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao] CHECK CONSTRAINT [FK8795712658D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao]  WITH NOCHECK ADD  CONSTRAINT [FK8795712660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao] CHECK CONSTRAINT [FK8795712660877044]
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao]  WITH NOCHECK ADD  CONSTRAINT [FK879571269AB01BE0] FOREIGN KEY([fk_grau_participacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao] CHECK CONSTRAINT [FK879571269AB01BE0]
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKEFB89BF7DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_grau_participacao_AUD] CHECK CONSTRAINT [FKEFB89BF7DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKEAC15D1E58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado] CHECK CONSTRAINT [FKEAC15D1E58D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKEAC15D1E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado] CHECK CONSTRAINT [FKEAC15D1E60877044]
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKC29DCBEFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_AUD] CHECK CONSTRAINT [FKC29DCBEFDF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKE1FF29A42E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado] CHECK CONSTRAINT [FKE1FF29A42E72EFA3]
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKE1FF29A460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado] CHECK CONSTRAINT [FKE1FF29A460877044]
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKE1FF29A49E6EA5D4] FOREIGN KEY([fk_entidade_grupo_cooperado])
REFERENCES [dbo].[rl_entidade_grupo_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado] CHECK CONSTRAINT [FKE1FF29A49E6EA5D4]
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK1575E575DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_grupo_cooperado_vincular_cooperado_AUD] CHECK CONSTRAINT [FK1575E575DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK8A4538B82F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital] CHECK CONSTRAINT [FK8A4538B82F4C728A]
GO
ALTER TABLE [dbo].[rl_entidade_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK8A4538B858D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital] CHECK CONSTRAINT [FK8A4538B858D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK8A4538B860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital] CHECK CONSTRAINT [FK8A4538B860877044]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKFF364A89DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_AUD] CHECK CONSTRAINT [FKFF364A89DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa]  WITH CHECK ADD  CONSTRAINT [FK76FA191019153F6C] FOREIGN KEY([fk_tipo_item_despesa])
REFERENCES [dbo].[tb_tipo_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa] CHECK CONSTRAINT [FK76FA191019153F6C]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK76FA19102637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa] CHECK CONSTRAINT [FK76FA19102637DC55]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK76FA191060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa] CHECK CONSTRAINT [FK76FA191060877044]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK76FA1910BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa] CHECK CONSTRAINT [FK76FA1910BF1B1049]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCB533EE1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_item_despesa_AUD] CHECK CONSTRAINT [FKCB533EE1DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo]  WITH NOCHECK ADD  CONSTRAINT [FKEFBF83E82637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo] CHECK CONSTRAINT [FKEFBF83E82637DC55]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo]  WITH NOCHECK ADD  CONSTRAINT [FKEFBF83E82E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo] CHECK CONSTRAINT [FKEFBF83E82E72EFA3]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo]  WITH NOCHECK ADD  CONSTRAINT [FKEFBF83E860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo] CHECK CONSTRAINT [FKEFBF83E860877044]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo]  WITH NOCHECK ADD  CONSTRAINT [FKEFBF83E8BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo] CHECK CONSTRAINT [FKEFBF83E8BF1B1049]
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK3B377DB9DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_hospital_procedimento_calculo_AUD] CHECK CONSTRAINT [FK3B377DB9DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FKEAE66CA858D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed] CHECK CONSTRAINT [FKEAE66CA858D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FKEAE66CA860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed] CHECK CONSTRAINT [FKEAE66CA860877044]
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FKEAE66CA87784988C] FOREIGN KEY([fk_espelho])
REFERENCES [dbo].[tb_espelho] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed] CHECK CONSTRAINT [FKEAE66CA87784988C]
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FKEAE66CA8B6C7DC79] FOREIGN KEY([fk_importacao_unimed])
REFERENCES [dbo].[tb_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed] CHECK CONSTRAINT [FKEAE66CA8B6C7DC79]
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FKEAE66CA8E2E872EC] FOREIGN KEY([fk_fatura])
REFERENCES [dbo].[tb_fatura] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed] CHECK CONSTRAINT [FKEAE66CA8E2E872EC]
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK33C0679DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_importacao_unimed_AUD] CHECK CONSTRAINT [FK33C0679DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK7146DF5A4E6E6EE5] FOREIGN KEY([fk_tabela_calculo])
REFERENCES [dbo].[tb_tabela_calculo] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse] CHECK CONSTRAINT [FK7146DF5A4E6E6EE5]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK7146DF5A502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse] CHECK CONSTRAINT [FK7146DF5A502D5D01]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK7146DF5A58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse] CHECK CONSTRAINT [FK7146DF5A58D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK7146DF5A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse] CHECK CONSTRAINT [FK7146DF5A60877044]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK7146DF5A628BBDA0] FOREIGN KEY([fk_inss])
REFERENCES [dbo].[tb_inss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse] CHECK CONSTRAINT [FK7146DF5A628BBDA0]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK7146DF5A9983A2B9] FOREIGN KEY([fk_coluna_relatorio_resumo_repasse])
REFERENCES [dbo].[rl_coluna_relatorio_resumo_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse] CHECK CONSTRAINT [FK7146DF5A9983A2B9]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK7146DF5ADAAC132C] FOREIGN KEY([fk_lancamento_repasse_estorno])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse] CHECK CONSTRAINT [FK7146DF5ADAAC132C]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKA9DFD02BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_AUD] CHECK CONSTRAINT [FKA9DFD02BDF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS]  WITH NOCHECK ADD  CONSTRAINT [FK921DC00A502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS] CHECK CONSTRAINT [FK921DC00A502D5D01]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS]  WITH NOCHECK ADD  CONSTRAINT [FK921DC00A58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS] CHECK CONSTRAINT [FK921DC00A58D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS]  WITH NOCHECK ADD  CONSTRAINT [FK921DC00A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS] CHECK CONSTRAINT [FK921DC00A60877044]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS]  WITH NOCHECK ADD  CONSTRAINT [FK921DC00A628BBDA0] FOREIGN KEY([fk_inss])
REFERENCES [dbo].[tb_inss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS] CHECK CONSTRAINT [FK921DC00A628BBDA0]
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCDF6D8DBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_lancamento_repasse_INSS_AUD] CHECK CONSTRAINT [FKCDF6D8DBDF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao]  WITH NOCHECK ADD  CONSTRAINT [FKF935C43917ED5EC4] FOREIGN KEY([fk_motivo_exclusao_guias])
REFERENCES [dbo].[tb_motivo_exclusao_guias] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao] CHECK CONSTRAINT [FKF935C43917ED5EC4]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao]  WITH NOCHECK ADD  CONSTRAINT [FKF935C43958D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao] CHECK CONSTRAINT [FKF935C43958D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao]  WITH NOCHECK ADD  CONSTRAINT [FKF935C43960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao] CHECK CONSTRAINT [FKF935C43960877044]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK24032D8ADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_exclusao_AUD] CHECK CONSTRAINT [FK24032D8ADF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa]  WITH NOCHECK ADD  CONSTRAINT [FK465F7F0758D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa] CHECK CONSTRAINT [FK465F7F0758D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa]  WITH NOCHECK ADD  CONSTRAINT [FK465F7F0760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa] CHECK CONSTRAINT [FK465F7F0760877044]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa]  WITH NOCHECK ADD  CONSTRAINT [FK465F7F07B5EBE7B9] FOREIGN KEY([fk_motivo_glosa])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa] CHECK CONSTRAINT [FK465F7F07B5EBE7B9]
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKFD16D158DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_motivo_glosa_AUD] CHECK CONSTRAINT [FKFD16D158DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FK33A5ACC158D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso] CHECK CONSTRAINT [FK33A5ACC158D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FK33A5ACC160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso] CHECK CONSTRAINT [FK33A5ACC160877044]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FK33A5ACC1E924314A] FOREIGN KEY([fk_perfil_acesso])
REFERENCES [dbo].[tb_perfil_acesso] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso] CHECK CONSTRAINT [FK33A5ACC1E924314A]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5BBB9212DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_AUD] CHECK CONSTRAINT [FK5BBB9212DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso]  WITH NOCHECK ADD  CONSTRAINT [FKA09690CA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso] CHECK CONSTRAINT [FKA09690CA60877044]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso]  WITH NOCHECK ADD  CONSTRAINT [FKA09690CAA007136F] FOREIGN KEY([fk_caso_uso])
REFERENCES [dbo].[tb_caso_de_uso] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso] CHECK CONSTRAINT [FKA09690CAA007136F]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso]  WITH NOCHECK ADD  CONSTRAINT [FKA09690CAAB7A3957] FOREIGN KEY([fk_entidade_perfil_acesso])
REFERENCES [dbo].[rl_entidade_perfil_acesso] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso] CHECK CONSTRAINT [FKA09690CAAB7A3957]
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5E19499BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_perfil_acesso_caso_uso_AUD] CHECK CONSTRAINT [FK5E19499BDF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_usuario]  WITH NOCHECK ADD  CONSTRAINT [FK15E670F058D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_usuario] CHECK CONSTRAINT [FK15E670F058D83D4E]
GO
ALTER TABLE [dbo].[rl_entidade_usuario]  WITH NOCHECK ADD  CONSTRAINT [FK15E670F060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_usuario] CHECK CONSTRAINT [FK15E670F060877044]
GO
ALTER TABLE [dbo].[rl_entidade_usuario]  WITH NOCHECK ADD  CONSTRAINT [FK15E670F0EA995586] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_usuario] CHECK CONSTRAINT [FK15E670F0EA995586]
GO
ALTER TABLE [dbo].[rl_entidade_usuario_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKEA90A6C1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_usuario_AUD] CHECK CONSTRAINT [FKEA90A6C1DF74E053]
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FKCE10E77060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso] CHECK CONSTRAINT [FKCE10E77060877044]
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FKCE10E7709251C76A] FOREIGN KEY([fk_entidade_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso] CHECK CONSTRAINT [FKCE10E7709251C76A]
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FKCE10E770AB7A3957] FOREIGN KEY([fk_entidade_perfil_acesso])
REFERENCES [dbo].[rl_entidade_perfil_acesso] ([id])
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso] CHECK CONSTRAINT [FKCE10E770AB7A3957]
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK39BDD41DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidade_usuario_perfil_acesso_AUD] CHECK CONSTRAINT [FK39BDD41DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FKCB7FF14660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento] CHECK CONSTRAINT [FKCB7FF14660877044]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FKCB7FF146700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento] CHECK CONSTRAINT [FKCB7FF146700F167]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FKCB7FF146E7CE6755] FOREIGN KEY([fk_acomodacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento] CHECK CONSTRAINT [FKCB7FF146E7CE6755]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FKCB7FF146EDF5B881] FOREIGN KEY([fk_carater_atendimento])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento] CHECK CONSTRAINT [FKCB7FF146EDF5B881]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK3C260C17DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_acomodacao_carater_atendimento_AUD] CHECK CONSTRAINT [FK3C260C17DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento]  WITH CHECK ADD  CONSTRAINT [FKB24E570E33F16C1F] FOREIGN KEY([fk_ch])
REFERENCES [dbo].[tb_ch] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento] CHECK CONSTRAINT [FKB24E570E33F16C1F]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento]  WITH NOCHECK ADD  CONSTRAINT [FKB24E570E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento] CHECK CONSTRAINT [FKB24E570E60877044]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento]  WITH NOCHECK ADD  CONSTRAINT [FKB24E570E700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento] CHECK CONSTRAINT [FKB24E570E700F167]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento]  WITH CHECK ADD  CONSTRAINT [FKB24E570E892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento] CHECK CONSTRAINT [FKB24E570E892ABB48]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKA63C4DDFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_complemento_AUD] CHECK CONSTRAINT [FKA63C4DDFDF74E053]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB712637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB712637DC55]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH CHECK ADD  CONSTRAINT [FKD006BB712E6E0641] FOREIGN KEY([fk_tabela_edicao])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB712E6E0641]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB7133F16C1F] FOREIGN KEY([fk_ch])
REFERENCES [dbo].[tb_ch] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB7133F16C1F]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB714BB51404] FOREIGN KEY([fk_entidade_convenio_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB714BB51404]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB715DE6FFDC] FOREIGN KEY([fk_edicao_fator_porte])
REFERENCES [dbo].[tb_edicao_fator_porte] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB715DE6FFDC]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB7160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB7160877044]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB71700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB71700F167]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH CHECK ADD  CONSTRAINT [FKD006BB717912C92B] FOREIGN KEY([fk_tabela_tiss])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB717912C92B]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB71892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB71892ABB48]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH CHECK ADD  CONSTRAINT [FKD006BB719AB01BE0] FOREIGN KEY([fk_grau_participacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB719AB01BE0]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB71B176C7D2] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB71B176C7D2]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB71CB8BC4EB] FOREIGN KEY([fk_entidade_acomodacao])
REFERENCES [dbo].[rl_entidade_acomodacao] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB71CB8BC4EB]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH CHECK ADD  CONSTRAINT [FKD006BB71E754A9A8] FOREIGN KEY([fk_tipo_tabela_tiss])
REFERENCES [dbo].[tb_tipo_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB71E754A9A8]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKD006BB71F5D95523] FOREIGN KEY([fk_ch_operacional])
REFERENCES [dbo].[tb_ch] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario] CHECK CONSTRAINT [FKD006BB71F5D95523]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKAE95C8C2DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_historico_tabela_honorario_AUD] CHECK CONSTRAINT [FKAE95C8C2DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento]  WITH CHECK ADD  CONSTRAINT [FK42EF54F960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento] CHECK CONSTRAINT [FK42EF54F960877044]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento]  WITH CHECK ADD  CONSTRAINT [FK42EF54F9700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento] CHECK CONSTRAINT [FK42EF54F9700F167]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento]  WITH CHECK ADD  CONSTRAINT [FK42EF54F9BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento] CHECK CONSTRAINT [FK42EF54F9BF1B1049]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento_AUD]  WITH CHECK ADD  CONSTRAINT [FKE1065E4ADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_material_medicamento_AUD] CHECK CONSTRAINT [FKE1065E4ADF74E053]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo]  WITH NOCHECK ADD  CONSTRAINT [FKBE33119D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo] CHECK CONSTRAINT [FKBE33119D60877044]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo]  WITH NOCHECK ADD  CONSTRAINT [FKBE33119D700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo] CHECK CONSTRAINT [FKBE33119D700F167]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo]  WITH NOCHECK ADD  CONSTRAINT [FKBE33119DBAE40D4B] FOREIGN KEY([fk_termo_aditivo])
REFERENCES [dbo].[tb_termo_aditivo] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo] CHECK CONSTRAINT [FKBE33119DBAE40D4B]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK651328EEDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_termo_aditivo_AUD] CHECK CONSTRAINT [FK651328EEDF74E053]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans]  WITH CHECK ADD  CONSTRAINT [FKA26593D860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans] CHECK CONSTRAINT [FKA26593D860877044]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans]  WITH CHECK ADD  CONSTRAINT [FKA26593D8700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans] CHECK CONSTRAINT [FKA26593D8700F167]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans_AUD]  WITH CHECK ADD  CONSTRAINT [FKB7415A9DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_despesa_codigo_tabela_ans_AUD] CHECK CONSTRAINT [FKB7415A9DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho]  WITH CHECK ADD  CONSTRAINT [FKA9E8D30042EF4DF] FOREIGN KEY([fk_tipo_espelho])
REFERENCES [dbo].[tb_tipo_espelho] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho] CHECK CONSTRAINT [FKA9E8D30042EF4DF]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA9E8D30060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho] CHECK CONSTRAINT [FKA9E8D30060877044]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA9E8D300700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho] CHECK CONSTRAINT [FKA9E8D300700F167]
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK137380D1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadeconvenio_tipo_espelho_AUD] CHECK CONSTRAINT [FK137380D1DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D52637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D52637DC55]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D52E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D52E72EFA3]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D533F16C1F] FOREIGN KEY([fk_ch])
REFERENCES [dbo].[tb_ch] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D533F16C1F]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D560877044]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D564B0BC11] FOREIGN KEY([fk_entidadeconvenio_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D564B0BC11]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D5700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D5700F167]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D5892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D5892ABB48]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D5F5A1A2D6] FOREIGN KEY([fk_entidadeconvenio])
REFERENCES [dbo].[rl_entidade_acomodacao] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D5F5A1A2D6]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo]  WITH CHECK ADD  CONSTRAINT [FK65566D5F5D95523] FOREIGN KEY([fk_ch_operacional])
REFERENCES [dbo].[tb_ch] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo] CHECK CONSTRAINT [FK65566D5F5D95523]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo_AUD]  WITH CHECK ADD  CONSTRAINT [FK7D182226DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_calculo_AUD] CHECK CONSTRAINT [FK7D182226DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade]  WITH NOCHECK ADD  CONSTRAINT [FKCAA0F0852E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade] CHECK CONSTRAINT [FKCAA0F0852E72EFA3]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade]  WITH NOCHECK ADD  CONSTRAINT [FKCAA0F0854A54C290] FOREIGN KEY([fk_especialidade])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade] CHECK CONSTRAINT [FKCAA0F0854A54C290]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade]  WITH NOCHECK ADD  CONSTRAINT [FKCAA0F08560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade] CHECK CONSTRAINT [FKCAA0F08560877044]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKB82753D6DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_especialidade_AUD] CHECK CONSTRAINT [FKB82753D6DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital]  WITH NOCHECK ADD  CONSTRAINT [FKBCF857E82637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital] CHECK CONSTRAINT [FKBCF857E82637DC55]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital]  WITH NOCHECK ADD  CONSTRAINT [FKBCF857E82E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital] CHECK CONSTRAINT [FKBCF857E82E72EFA3]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital]  WITH CHECK ADD  CONSTRAINT [FKBCF857E82F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital] CHECK CONSTRAINT [FKBCF857E82F4C728A]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital]  WITH NOCHECK ADD  CONSTRAINT [FKBCF857E860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital] CHECK CONSTRAINT [FKBCF857E860877044]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK57E651B9DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_hospital_AUD] CHECK CONSTRAINT [FK57E651B9DF74E053]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK6C48C50E2E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento] CHECK CONSTRAINT [FK6C48C50E2E72EFA3]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK6C48C50E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento] CHECK CONSTRAINT [FK6C48C50E60877044]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK6C48C50EC8E29F43] FOREIGN KEY([fk_local_atendimento])
REFERENCES [dbo].[tb_local_atendimento] ([id])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento] CHECK CONSTRAINT [FK6C48C50EC8E29F43]
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKE14FBBDFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_entidadecooperado_local_atendimento_AUD] CHECK CONSTRAINT [FKE14FBBDFDF74E053]
GO
ALTER TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela]  WITH CHECK ADD  CONSTRAINT [FK77DFF86E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela] CHECK CONSTRAINT [FK77DFF86E60877044]
GO
ALTER TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela]  WITH CHECK ADD  CONSTRAINT [FK77DFF86EC8489833] FOREIGN KEY([fk_fencom_despesa_tabela_honorarios_removida])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela] CHECK CONSTRAINT [FK77DFF86EC8489833]
GO
ALTER TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela_AUD]  WITH CHECK ADD  CONSTRAINT [FK1D5E3F3FDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_fencom_despesa_removida_da_entidade_tabela_AUD] CHECK CONSTRAINT [FK1D5E3F3FDF74E053]
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK349CA4853B3FF883] FOREIGN KEY([fk_grupo_convenio])
REFERENCES [dbo].[tb_grupo_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio] CHECK CONSTRAINT [FK349CA4853B3FF883]
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK349CA48560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio] CHECK CONSTRAINT [FK349CA48560877044]
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK349CA485700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio] CHECK CONSTRAINT [FK349CA485700F167]
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK952907D6DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_grupo_convenio_entidade_convenio_AUD] CHECK CONSTRAINT [FK952907D6DF74E053]
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK37FF420E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa] CHECK CONSTRAINT [FK37FF420E60877044]
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK37FF420EA4F3018D] FOREIGN KEY([fk_grupo_despesa])
REFERENCES [dbo].[tb_grupo_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa] CHECK CONSTRAINT [FK37FF420EA4F3018D]
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK37FF420EBF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa] CHECK CONSTRAINT [FK37FF420EBF1B1049]
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKC37FB8DFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_grupo_despesa_item_despesa_AUD] CHECK CONSTRAINT [FKC37FB8DFDF74E053]
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio]  WITH CHECK ADD  CONSTRAINT [FKAE47971E1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio] CHECK CONSTRAINT [FKAE47971E1015879C]
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio]  WITH CHECK ADD  CONSTRAINT [FKAE47971E21D945A8] FOREIGN KEY([fk_endereco])
REFERENCES [dbo].[tb_endereco] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio] CHECK CONSTRAINT [FKAE47971E21D945A8]
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio]  WITH CHECK ADD  CONSTRAINT [FKAE47971E4D03B68F] FOREIGN KEY([fk_grupo_endereco])
REFERENCES [dbo].[tb_grupo_endereco] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio] CHECK CONSTRAINT [FKAE47971E4D03B68F]
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio]  WITH CHECK ADD  CONSTRAINT [FKAE47971E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio] CHECK CONSTRAINT [FKAE47971E60877044]
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio_AUD]  WITH CHECK ADD  CONSTRAINT [FK847705EFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_grupo_endereco_convenio_AUD] CHECK CONSTRAINT [FK847705EFDF74E053]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FB2F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FB2F4C728A]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FB58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FB58D83D4E]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH CHECK ADD  CONSTRAINT [FK3954C1FB5B67A7CB] FOREIGN KEY([fk_recebedor])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FB5B67A7CB]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FB60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FB60877044]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FB8B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FB8B6715CA]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FBBF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FBBF1B1049]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FBC1CEB104] FOREIGN KEY([fk_complexidade])
REFERENCES [dbo].[tb_complexidade] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FBC1CEB104]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FBDEF8DF5E] FOREIGN KEY([fk_executante])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FBDEF8DF5E]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores]  WITH NOCHECK ADD  CONSTRAINT [FK3954C1FBFA9846B0] FOREIGN KEY([fk_integracao_sus])
REFERENCES [dbo].[tb_integracao_sus] ([id])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores] CHECK CONSTRAINT [FK3954C1FBFA9846B0]
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK1D097A4CDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_integracao_sus_valores_AUD] CHECK CONSTRAINT [FK1D097A4CDF74E053]
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss]  WITH NOCHECK ADD  CONSTRAINT [FK1DC6E68360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss] CHECK CONSTRAINT [FK1DC6E68360877044]
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss]  WITH NOCHECK ADD  CONSTRAINT [FK1DC6E683B516E99A] FOREIGN KEY([fk_de_para_tuss])
REFERENCES [dbo].[tb_de_para_tuss] ([id])
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss] CHECK CONSTRAINT [FK1DC6E683B516E99A]
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss]  WITH NOCHECK ADD  CONSTRAINT [FK1DC6E683BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss] CHECK CONSTRAINT [FK1DC6E683BF1B1049]
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss]  WITH NOCHECK ADD  CONSTRAINT [FK1DC6E683FA6D371F] FOREIGN KEY([fk_tuss_versao_tiss])
REFERENCES [dbo].[tb_tabela_tiss_versao_codigo] ([id])
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss] CHECK CONSTRAINT [FK1DC6E683FA6D371F]
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7B461AD4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_itemdespesa_tuss_AUD] CHECK CONSTRAINT [FK7B461AD4DF74E053]
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKAFD5AB7447F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado] CHECK CONSTRAINT [FKAFD5AB7447F1200E]
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKAFD5AB744E6E6EE5] FOREIGN KEY([fk_tabela_calculo])
REFERENCES [dbo].[tb_tabela_calculo] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado] CHECK CONSTRAINT [FKAFD5AB744E6E6EE5]
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKAFD5AB74502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado] CHECK CONSTRAINT [FKAFD5AB74502D5D01]
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKAFD5AB7458D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado] CHECK CONSTRAINT [FKAFD5AB7458D83D4E]
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKAFD5AB7460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado] CHECK CONSTRAINT [FKAFD5AB7460877044]
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FKAFD5AB747CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado] CHECK CONSTRAINT [FKAFD5AB747CDF5F6C]
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK2D96FF45DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_lancamento_repasse_cooperado_AUD] CHECK CONSTRAINT [FK2D96FF45DF74E053]
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo]  WITH NOCHECK ADD  CONSTRAINT [FK872CFE8558D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo] CHECK CONSTRAINT [FK872CFE8558D83D4E]
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo]  WITH NOCHECK ADD  CONSTRAINT [FK872CFE8560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo] CHECK CONSTRAINT [FK872CFE8560877044]
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo]  WITH NOCHECK ADD  CONSTRAINT [FK872CFE857CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo] CHECK CONSTRAINT [FK872CFE857CDF5F6C]
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo]  WITH NOCHECK ADD  CONSTRAINT [FK872CFE85B77BDF59] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo] CHECK CONSTRAINT [FK872CFE85B77BDF59]
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo]  WITH NOCHECK ADD  CONSTRAINT [FK872CFE85F2FB53B3] FOREIGN KEY([fk_participantes_composicao_servico_especial])
REFERENCES [dbo].[tb_participantes_composicao_servico_especial] ([id])
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo] CHECK CONSTRAINT [FK872CFE85F2FB53B3]
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK13FC61D6DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_lancamento_servico_especial_fixo_AUD] CHECK CONSTRAINT [FK13FC61D6DF74E053]
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor]  WITH CHECK ADD  CONSTRAINT [FK58A0A1EA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor] CHECK CONSTRAINT [FK58A0A1EA60877044]
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor]  WITH CHECK ADD  CONSTRAINT [FK58A0A1EA7CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor] CHECK CONSTRAINT [FK58A0A1EA7CDF5F6C]
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor]  WITH CHECK ADD  CONSTRAINT [FK58A0A1EA9073F611] FOREIGN KEY([fk_saldo_devedor])
REFERENCES [dbo].[rl_saldo_devedor] ([id])
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor] CHECK CONSTRAINT [FK58A0A1EA9073F611]
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor_AUD]  WITH CHECK ADD  CONSTRAINT [FKF275CABBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_movimentacao_saldo_devedor_AUD] CHECK CONSTRAINT [FKF275CABBDF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente]  WITH CHECK ADD  CONSTRAINT [FK8533D16C47F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente] CHECK CONSTRAINT [FK8533D16C47F1200E]
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente]  WITH CHECK ADD  CONSTRAINT [FK8533D16C502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente] CHECK CONSTRAINT [FK8533D16C502D5D01]
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente]  WITH CHECK ADD  CONSTRAINT [FK8533D16C58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente] CHECK CONSTRAINT [FK8533D16C58D83D4E]
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente]  WITH CHECK ADD  CONSTRAINT [FK8533D16C60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente] CHECK CONSTRAINT [FK8533D16C60877044]
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente]  WITH CHECK ADD  CONSTRAINT [FK8533D16C7CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente] CHECK CONSTRAINT [FK8533D16C7CDF5F6C]
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente_AUD]  WITH CHECK ADD  CONSTRAINT [FK3B01693DDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_base_calculo_incidente_AUD] CHECK CONSTRAINT [FK3B01693DDF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_calculado]  WITH NOCHECK ADD  CONSTRAINT [FK5DF09C1D1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_calculado] CHECK CONSTRAINT [FK5DF09C1D1015879C]
GO
ALTER TABLE [dbo].[rl_repasse_calculado]  WITH NOCHECK ADD  CONSTRAINT [FK5DF09C1D502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_calculado] CHECK CONSTRAINT [FK5DF09C1D502D5D01]
GO
ALTER TABLE [dbo].[rl_repasse_calculado]  WITH NOCHECK ADD  CONSTRAINT [FK5DF09C1D54BD3AB7] FOREIGN KEY([fk_cooperado_lancamento])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_calculado] CHECK CONSTRAINT [FK5DF09C1D54BD3AB7]
GO
ALTER TABLE [dbo].[rl_repasse_calculado]  WITH NOCHECK ADD  CONSTRAINT [FK5DF09C1D58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_calculado] CHECK CONSTRAINT [FK5DF09C1D58D83D4E]
GO
ALTER TABLE [dbo].[rl_repasse_calculado]  WITH NOCHECK ADD  CONSTRAINT [FK5DF09C1D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_calculado] CHECK CONSTRAINT [FK5DF09C1D60877044]
GO
ALTER TABLE [dbo].[rl_repasse_calculado]  WITH NOCHECK ADD  CONSTRAINT [FK5DF09C1D7CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_calculado] CHECK CONSTRAINT [FK5DF09C1D7CDF5F6C]
GO
ALTER TABLE [dbo].[rl_repasse_calculado]  WITH NOCHECK ADD  CONSTRAINT [FK5DF09C1D9073F611] FOREIGN KEY([fk_saldo_devedor])
REFERENCES [dbo].[rl_saldo_devedor] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_calculado] CHECK CONSTRAINT [FK5DF09C1D9073F611]
GO
ALTER TABLE [dbo].[rl_repasse_calculado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7E07736EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_calculado_AUD] CHECK CONSTRAINT [FK7E07736EDF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_controle_saldo_devedor]  WITH NOCHECK ADD  CONSTRAINT [FKBE13762D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_controle_saldo_devedor] CHECK CONSTRAINT [FKBE13762D60877044]
GO
ALTER TABLE [dbo].[rl_repasse_controle_saldo_devedor]  WITH NOCHECK ADD  CONSTRAINT [FKBE13762DE3FA1423] FOREIGN KEY([fk_repasse_calculado])
REFERENCES [dbo].[rl_repasse_calculado] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_controle_saldo_devedor] CHECK CONSTRAINT [FKBE13762DE3FA1423]
GO
ALTER TABLE [dbo].[rl_repasse_controle_saldo_devedor_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKFE0EC57EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_controle_saldo_devedor_AUD] CHECK CONSTRAINT [FKFE0EC57EDF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_conversao]  WITH NOCHECK ADD  CONSTRAINT [FK959B1FFD4A94936] FOREIGN KEY([fk_entidade_cooperado_conversao])
REFERENCES [dbo].[rl_entidade_cooperado_conversao] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_conversao] CHECK CONSTRAINT [FK959B1FFD4A94936]
GO
ALTER TABLE [dbo].[rl_repasse_conversao]  WITH NOCHECK ADD  CONSTRAINT [FK959B1FFD60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_conversao] CHECK CONSTRAINT [FK959B1FFD60877044]
GO
ALTER TABLE [dbo].[rl_repasse_conversao]  WITH NOCHECK ADD  CONSTRAINT [FK959B1FFD7CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_conversao] CHECK CONSTRAINT [FK959B1FFD7CDF5F6C]
GO
ALTER TABLE [dbo].[rl_repasse_conversao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK130D074EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_conversao_AUD] CHECK CONSTRAINT [FK130D074EDF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_credito]  WITH NOCHECK ADD  CONSTRAINT [FK9233527347F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_credito] CHECK CONSTRAINT [FK9233527347F1200E]
GO
ALTER TABLE [dbo].[rl_repasse_credito]  WITH NOCHECK ADD  CONSTRAINT [FK9233527358D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_credito] CHECK CONSTRAINT [FK9233527358D83D4E]
GO
ALTER TABLE [dbo].[rl_repasse_credito]  WITH NOCHECK ADD  CONSTRAINT [FK9233527360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_credito] CHECK CONSTRAINT [FK9233527360877044]
GO
ALTER TABLE [dbo].[rl_repasse_credito]  WITH NOCHECK ADD  CONSTRAINT [FK923352737CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_credito] CHECK CONSTRAINT [FK923352737CDF5F6C]
GO
ALTER TABLE [dbo].[rl_repasse_credito_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCABB0EC4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_credito_AUD] CHECK CONSTRAINT [FKCABB0EC4DF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKA26E8E49375926BC] FOREIGN KEY([fk_entidade_cooperado_dependente])
REFERENCES [dbo].[tb_entidade_cooperado_dependente] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_dependente] CHECK CONSTRAINT [FKA26E8E49375926BC]
GO
ALTER TABLE [dbo].[rl_repasse_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKA26E8E4947F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_dependente] CHECK CONSTRAINT [FKA26E8E4947F1200E]
GO
ALTER TABLE [dbo].[rl_repasse_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKA26E8E4960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_dependente] CHECK CONSTRAINT [FKA26E8E4960877044]
GO
ALTER TABLE [dbo].[rl_repasse_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKA26E8E497CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_dependente] CHECK CONSTRAINT [FKA26E8E497CDF5F6C]
GO
ALTER TABLE [dbo].[rl_repasse_dependente_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK90A86F9ADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_dependente_AUD] CHECK CONSTRAINT [FK90A86F9ADF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7D1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7D1015879C]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7D2F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7D2F4C728A]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7D502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7D502D5D01]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7D54BD3AB7] FOREIGN KEY([fk_cooperado_lancamento])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7D54BD3AB7]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7D58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7D58D83D4E]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7D60877044]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7D7CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7D7CDF5F6C]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7DAE0F7233] FOREIGN KEY([fk_pagamento_fatura])
REFERENCES [dbo].[tb_pagamento_fatura] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7DAE0F7233]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7DBE379D8] FOREIGN KEY([fk_participante_composicao_servico_especial])
REFERENCES [dbo].[tb_participantes_composicao_servico_especial] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7DBE379D8]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7DD6121697] FOREIGN KEY([fk_pagamento_procedimento])
REFERENCES [dbo].[tb_pagamento_procedimento] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7DD6121697]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH CHECK ADD  CONSTRAINT [FKA4695E7DE70161A3] FOREIGN KEY([fk_pagamento_espelho])
REFERENCES [dbo].[tb_pagamento_espelho] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7DE70161A3]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FKA4695E7DF13A7D20] FOREIGN KEY([fk_lancamento_repasse_eventual])
REFERENCES [dbo].[tb_lancamento_repasse_eventual] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento] CHECK CONSTRAINT [FKA4695E7DF13A7D20]
GO
ALTER TABLE [dbo].[rl_repasse_lancamento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7B9805CEDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_lancamento_AUD] CHECK CONSTRAINT [FK7B9805CEDF74E053]
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK56EC177147F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo] CHECK CONSTRAINT [FK56EC177147F1200E]
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK56EC177158D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo] CHECK CONSTRAINT [FK56EC177158D83D4E]
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK56EC177160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo] CHECK CONSTRAINT [FK56EC177160877044]
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK56EC17717CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo] CHECK CONSTRAINT [FK56EC17717CDF5F6C]
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4B6D24C2DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_repasse_memoria_calculo_AUD] CHECK CONSTRAINT [FK4B6D24C2DF74E053]
GO
ALTER TABLE [dbo].[rl_saldo_devedor]  WITH NOCHECK ADD  CONSTRAINT [FKAC5D49BC47F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_saldo_devedor] CHECK CONSTRAINT [FKAC5D49BC47F1200E]
GO
ALTER TABLE [dbo].[rl_saldo_devedor]  WITH NOCHECK ADD  CONSTRAINT [FKAC5D49BC502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[rl_saldo_devedor] CHECK CONSTRAINT [FKAC5D49BC502D5D01]
GO
ALTER TABLE [dbo].[rl_saldo_devedor]  WITH NOCHECK ADD  CONSTRAINT [FKAC5D49BC58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[rl_saldo_devedor] CHECK CONSTRAINT [FKAC5D49BC58D83D4E]
GO
ALTER TABLE [dbo].[rl_saldo_devedor]  WITH NOCHECK ADD  CONSTRAINT [FKAC5D49BC60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_saldo_devedor] CHECK CONSTRAINT [FKAC5D49BC60877044]
GO
ALTER TABLE [dbo].[rl_saldo_devedor_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4516398DDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_saldo_devedor_AUD] CHECK CONSTRAINT [FK4516398DDF74E053]
GO
ALTER TABLE [dbo].[rl_saldo_repasse_fixo]  WITH NOCHECK ADD  CONSTRAINT [FK924A521360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_saldo_repasse_fixo] CHECK CONSTRAINT [FK924A521360877044]
GO
ALTER TABLE [dbo].[rl_saldo_repasse_fixo]  WITH NOCHECK ADD  CONSTRAINT [FK924A52137D81BBA5] FOREIGN KEY([fk_servico_especial])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[rl_saldo_repasse_fixo] CHECK CONSTRAINT [FK924A52137D81BBA5]
GO
ALTER TABLE [dbo].[rl_saldo_repasse_fixo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKE2093E64DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_saldo_repasse_fixo_AUD] CHECK CONSTRAINT [FKE2093E64DF74E053]
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FK3E69730360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso] CHECK CONSTRAINT [FK3E69730360877044]
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso]  WITH CHECK ADD  CONSTRAINT [FK3E6973039251C76A] FOREIGN KEY([fk_entidade_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso] CHECK CONSTRAINT [FK3E6973039251C76A]
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FK3E697303AB7A3957] FOREIGN KEY([fk_entidade_perfil_acesso])
REFERENCES [dbo].[rl_entidade_perfil_acesso] ([id])
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso] CHECK CONSTRAINT [FK3E697303AB7A3957]
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK36CE6754DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_seguranca_entidade_perfil_acesso_AUD] CHECK CONSTRAINT [FK36CE6754DF74E053]
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK14FC269360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa] CHECK CONSTRAINT [FK14FC269360877044]
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK14FC2693A4F3018D] FOREIGN KEY([fk_grupo_despesa])
REFERENCES [dbo].[tb_grupo_despesa] ([id])
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa] CHECK CONSTRAINT [FK14FC2693A4F3018D]
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK14FC2693BAE40D4B] FOREIGN KEY([fk_termo_aditivo])
REFERENCES [dbo].[tb_termo_aditivo] ([id])
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa] CHECK CONSTRAINT [FK14FC2693BAE40D4B]
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK56BCD2E4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_termo_aditivo_grupo_despesa_AUD] CHECK CONSTRAINT [FK56BCD2E4DF74E053]
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho]  WITH NOCHECK ADD  CONSTRAINT [FK12A0B9242B7463CE] FOREIGN KEY([fk_horario_trabalho])
REFERENCES [dbo].[tb_horario_trabalho] ([id])
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho] CHECK CONSTRAINT [FK12A0B9242B7463CE]
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho]  WITH NOCHECK ADD  CONSTRAINT [FK12A0B92460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho] CHECK CONSTRAINT [FK12A0B92460877044]
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho]  WITH NOCHECK ADD  CONSTRAINT [FK12A0B924B77BDF59] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho] CHECK CONSTRAINT [FK12A0B924B77BDF59]
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF3C3B4F5DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[rl_usuario_horario_trabalho_AUD] CHECK CONSTRAINT [FKF3C3B4F5DF74E053]
GO
ALTER TABLE [dbo].[tb_acareacao_inss]  WITH CHECK ADD  CONSTRAINT [FKD226AC9347F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_acareacao_inss] CHECK CONSTRAINT [FKD226AC9347F1200E]
GO
ALTER TABLE [dbo].[tb_acareacao_inss]  WITH CHECK ADD  CONSTRAINT [FKD226AC9358D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_acareacao_inss] CHECK CONSTRAINT [FKD226AC9358D83D4E]
GO
ALTER TABLE [dbo].[tb_acareacao_inss]  WITH CHECK ADD  CONSTRAINT [FKD226AC9360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_acareacao_inss] CHECK CONSTRAINT [FKD226AC9360877044]
GO
ALTER TABLE [dbo].[tb_acareacao_inss]  WITH CHECK ADD  CONSTRAINT [FKD226AC937CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_acareacao_inss] CHECK CONSTRAINT [FKD226AC937CDF5F6C]
GO
ALTER TABLE [dbo].[tb_acareacao_inss]  WITH CHECK ADD  CONSTRAINT [FKD226AC93F13A7D20] FOREIGN KEY([fk_lancamento_repasse_eventual])
REFERENCES [dbo].[tb_lancamento_repasse_eventual] ([id])
GO
ALTER TABLE [dbo].[tb_acareacao_inss] CHECK CONSTRAINT [FKD226AC93F13A7D20]
GO
ALTER TABLE [dbo].[tb_acareacao_inss_AUD]  WITH CHECK ADD  CONSTRAINT [FKCF3458E4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_acareacao_inss_AUD] CHECK CONSTRAINT [FKCF3458E4DF74E053]
GO
ALTER TABLE [dbo].[tb_adequacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK658D45D62E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_adequacao_unimed] CHECK CONSTRAINT [FK658D45D62E72EFA3]
GO
ALTER TABLE [dbo].[tb_adequacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK658D45D658D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_adequacao_unimed] CHECK CONSTRAINT [FK658D45D658D83D4E]
GO
ALTER TABLE [dbo].[tb_adequacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK658D45D660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_adequacao_unimed] CHECK CONSTRAINT [FK658D45D660877044]
GO
ALTER TABLE [dbo].[tb_adequacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK658D45D68B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[tb_adequacao_unimed] CHECK CONSTRAINT [FK658D45D68B6715CA]
GO
ALTER TABLE [dbo].[tb_adequacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK658D45D6B6C7DC79] FOREIGN KEY([fk_importacao_unimed])
REFERENCES [dbo].[tb_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_adequacao_unimed] CHECK CONSTRAINT [FK658D45D6B6C7DC79]
GO
ALTER TABLE [dbo].[tb_adequacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK658D45D6BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_adequacao_unimed] CHECK CONSTRAINT [FK658D45D6BF1B1049]
GO
ALTER TABLE [dbo].[tb_adequacao_unimed_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKAF5698A7DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_adequacao_unimed_AUD] CHECK CONSTRAINT [FKAF5698A7DF74E053]
GO
ALTER TABLE [dbo].[tb_agendamento_dirf]  WITH CHECK ADD  CONSTRAINT [FKE4A984E460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_agendamento_dirf] CHECK CONSTRAINT [FKE4A984E460877044]
GO
ALTER TABLE [dbo].[tb_agendamento_dirf]  WITH CHECK ADD  CONSTRAINT [FKE4A984E4B394252F] FOREIGN KEY([fk_processamento_dirf])
REFERENCES [dbo].[tb_processamento_dirf] ([id])
GO
ALTER TABLE [dbo].[tb_agendamento_dirf] CHECK CONSTRAINT [FKE4A984E4B394252F]
GO
ALTER TABLE [dbo].[tb_agendamento_dirf]  WITH CHECK ADD  CONSTRAINT [FKE4A984E4EA995586] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_agendamento_dirf] CHECK CONSTRAINT [FKE4A984E4EA995586]
GO
ALTER TABLE [dbo].[tb_agendamento_dirf_AUD]  WITH CHECK ADD  CONSTRAINT [FKB900A0B5DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_agendamento_dirf_AUD] CHECK CONSTRAINT [FKB900A0B5DF74E053]
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK3E697CC042012C83] FOREIGN KEY([fk_retorno_convenio])
REFERENCES [dbo].[tb_retorno_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio] CHECK CONSTRAINT [FK3E697CC042012C83]
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK3E697CC060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio] CHECK CONSTRAINT [FK3E697CC060877044]
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK3E697CC08B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio] CHECK CONSTRAINT [FK3E697CC08B6715CA]
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio_AUD]  WITH CHECK ADD  CONSTRAINT [FKC0094A91DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_arquivo_retorno_convenio_AUD] CHECK CONSTRAINT [FKC0094A91DF74E053]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado]  WITH NOCHECK ADD  CONSTRAINT [FK67F30EDF1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado] CHECK CONSTRAINT [FK67F30EDF1015879C]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado]  WITH NOCHECK ADD  CONSTRAINT [FK67F30EDF58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado] CHECK CONSTRAINT [FK67F30EDF58D83D4E]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado]  WITH NOCHECK ADD  CONSTRAINT [FK67F30EDF60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado] CHECK CONSTRAINT [FK67F30EDF60877044]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK82EB530DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_AUD] CHECK CONSTRAINT [FK82EB530DF74E053]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_erro]  WITH CHECK ADD  CONSTRAINT [FKFDB8C10A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_erro] CHECK CONSTRAINT [FKFDB8C10A60877044]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_erro]  WITH CHECK ADD  CONSTRAINT [FKFDB8C10A98E1BEB4] FOREIGN KEY([fk_arquivo_tiss_gerado])
REFERENCES [dbo].[tb_arquivo_tiss_gerado] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_erro] CHECK CONSTRAINT [FKFDB8C10A98E1BEB4]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_erro_AUD]  WITH CHECK ADD  CONSTRAINT [FK22959DBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_erro_AUD] CHECK CONSTRAINT [FK22959DBDF74E053]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_file]  WITH NOCHECK ADD  CONSTRAINT [FKFDB912DC60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_file] CHECK CONSTRAINT [FKFDB912DC60877044]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_file]  WITH NOCHECK ADD  CONSTRAINT [FKFDB912DC98E1BEB4] FOREIGN KEY([fk_arquivo_tiss_gerado])
REFERENCES [dbo].[tb_arquivo_tiss_gerado] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_file] CHECK CONSTRAINT [FKFDB912DC98E1BEB4]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_file_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK832872ADDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_file_AUD] CHECK CONSTRAINT [FK832872ADDF74E053]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_filtro]  WITH CHECK ADD  CONSTRAINT [FK73C0126860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_filtro] CHECK CONSTRAINT [FK73C0126860877044]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_filtro]  WITH CHECK ADD  CONSTRAINT [FK73C0126898E1BEB4] FOREIGN KEY([fk_arquivo_tiss_gerado])
REFERENCES [dbo].[tb_arquivo_tiss_gerado] ([id])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_filtro] CHECK CONSTRAINT [FK73C0126898E1BEB4]
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_filtro_AUD]  WITH CHECK ADD  CONSTRAINT [FK974CCC39DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_arquivo_tiss_gerado_filtro_AUD] CHECK CONSTRAINT [FK974CCC39DF74E053]
GO
ALTER TABLE [dbo].[tb_arvore_funcao]  WITH NOCHECK ADD  CONSTRAINT [FK1FDB420360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_arvore_funcao] CHECK CONSTRAINT [FK1FDB420360877044]
GO
ALTER TABLE [dbo].[tb_arvore_funcao]  WITH NOCHECK ADD  CONSTRAINT [FK1FDB420378A0BE97] FOREIGN KEY([fk_url])
REFERENCES [dbo].[tb_url] ([id])
GO
ALTER TABLE [dbo].[tb_arvore_funcao] CHECK CONSTRAINT [FK1FDB420378A0BE97]
GO
ALTER TABLE [dbo].[tb_arvore_funcao]  WITH NOCHECK ADD  CONSTRAINT [FK1FDB4203D48FF37E] FOREIGN KEY([fk_arvore_funcao_pai])
REFERENCES [dbo].[tb_arvore_funcao] ([id])
GO
ALTER TABLE [dbo].[tb_arvore_funcao] CHECK CONSTRAINT [FK1FDB4203D48FF37E]
GO
ALTER TABLE [dbo].[tb_arvore_funcao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CC0B654DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_arvore_funcao_AUD] CHECK CONSTRAINT [FK5CC0B654DF74E053]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F2637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F2637DC55]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F2B3075] FOREIGN KEY([fk_tipo_atendimento])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F2B3075]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F2F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F2F4C728A]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F4FA0FE3D] FOREIGN KEY([fk_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F4FA0FE3D]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F58D83D4E]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F60877044]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH CHECK ADD  CONSTRAINT [FK228FDD7F663C4EA] FOREIGN KEY([fk_integracao_unimed])
REFERENCES [dbo].[TB_INTEGRACAO_UNIMED] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F663C4EA]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F7784988C] FOREIGN KEY([fk_espelho])
REFERENCES [dbo].[tb_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F7784988C]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7F8719D758] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7F8719D758]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7FB6C7DC79] FOREIGN KEY([fk_importacao_unimed])
REFERENCES [dbo].[tb_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7FB6C7DC79]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7FB77BDF59] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7FB77BDF59]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7FF80428A3] FOREIGN KEY([fk_motivo_alta])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7FF80428A3]
GO
ALTER TABLE [dbo].[tb_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FK228FDD7FFA9846B0] FOREIGN KEY([fk_integracao_sus])
REFERENCES [dbo].[tb_integracao_sus] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento] CHECK CONSTRAINT [FK228FDD7FFA9846B0]
GO
ALTER TABLE [dbo].[tb_atendimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK748333D0DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_atendimento_AUD] CHECK CONSTRAINT [FK748333D0DF74E053]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D12637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D12637DC55]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D12B3075] FOREIGN KEY([fk_tipo_atendimento])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D12B3075]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D12F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D12F4C728A]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D14FA0FE3D] FOREIGN KEY([fk_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D14FA0FE3D]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D158D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D158D83D4E]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D18719D758] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D18719D758]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D1B77BDF59] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D1B77BDF59]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D1F80428A3] FOREIGN KEY([fk_motivo_alta])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D1F80428A3]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FKFA6F67D1FE3C7812] FOREIGN KEY([fk_integracao])
REFERENCES [dbo].[tb_integracao_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao] CHECK CONSTRAINT [FKFA6F67D1FE3C7812]
GO
ALTER TABLE [dbo].[tb_atendimento_integracao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKE2114522DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_atendimento_integracao_AUD] CHECK CONSTRAINT [FKE2114522DF74E053]
GO
ALTER TABLE [dbo].[tb_aviso_sistema]  WITH CHECK ADD  CONSTRAINT [FK7B17ED0258D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_aviso_sistema] CHECK CONSTRAINT [FK7B17ED0258D83D4E]
GO
ALTER TABLE [dbo].[tb_aviso_sistema]  WITH CHECK ADD  CONSTRAINT [FK7B17ED0260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_aviso_sistema] CHECK CONSTRAINT [FK7B17ED0260877044]
GO
ALTER TABLE [dbo].[tb_aviso_sistema_AUD]  WITH CHECK ADD  CONSTRAINT [FK23A1C9D3DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_aviso_sistema_AUD] CHECK CONSTRAINT [FK23A1C9D3DF74E053]
GO
ALTER TABLE [dbo].[tb_banco]  WITH NOCHECK ADD  CONSTRAINT [FKF9DA27AA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_banco] CHECK CONSTRAINT [FKF9DA27AA60877044]
GO
ALTER TABLE [dbo].[tb_banco_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKABF6707BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_banco_AUD] CHECK CONSTRAINT [FKABF6707BDF74E053]
GO
ALTER TABLE [dbo].[tb_beneficiario_dados]  WITH NOCHECK ADD  CONSTRAINT [FKCD7CD4D760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_beneficiario_dados] CHECK CONSTRAINT [FKCD7CD4D760877044]
GO
ALTER TABLE [dbo].[tb_beneficiario_dados_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK66F4BF28DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_beneficiario_dados_AUD] CHECK CONSTRAINT [FK66F4BF28DF74E053]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH CHECK ADD  CONSTRAINT [FK9AEEAAFA19153F6C] FOREIGN KEY([fk_tipo_item_despesa])
REFERENCES [dbo].[tb_tipo_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFA19153F6C]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFA2B3075] FOREIGN KEY([fk_tipo_atendimento])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFA2B3075]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFA45C7B0B6] FOREIGN KEY([fk_entidade_cooperado_especialidade])
REFERENCES [dbo].[rl_entidadecooperado_especialidade] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFA45C7B0B6]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFA477405FE] FOREIGN KEY([fk_cooperado_recebedor])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFA477405FE]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFA4FA0FE3D] FOREIGN KEY([fk_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFA4FA0FE3D]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFA700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFA700F167]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFA7478478B] FOREIGN KEY([fk_cooperado_executante])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFA7478478B]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAB22E4BE7] FOREIGN KEY([fk_tecnica])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAB22E4BE7]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFABF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFABF1B1049]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAC097B6AD] FOREIGN KEY([fk_via_acesso])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAC097B6AD]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAC588FC85] FOREIGN KEY([fk_grau_participacao])
REFERENCES [dbo].[rl_entidade_grau_participacao] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAC588FC85]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAD0F1DDBB] FOREIGN KEY([fk_unidade_medida])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAD0F1DDBB]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAD2FAA0AD] FOREIGN KEY([fk_tipo_guia])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAD2FAA0AD]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAE7CE6755] FOREIGN KEY([fk_acomodacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAE7CE6755]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAEA995586] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAEA995586]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAF80428A3] FOREIGN KEY([fk_motivo_alta])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAF80428A3]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK9AEEAAFAFDBC3F96] FOREIGN KEY([fk_procedimento_tuss])
REFERENCES [dbo].[tb_tabela_tiss_versao_codigo] ([id])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao] CHECK CONSTRAINT [FK9AEEAAFAFDBC3F96]
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKDD78CBCBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_campo_fixo_digitacao_AUD] CHECK CONSTRAINT [FKDD78CBCBDF74E053]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK6F0C2601015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C2601015879C]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK6F0C2602F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C2602F4C728A]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK6F0C26047F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C26047F1200E]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH CHECK ADD  CONSTRAINT [FK6F0C2604FA0FE3D] FOREIGN KEY([fk_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C2604FA0FE3D]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK6F0C26058D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C26058D83D4E]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK6F0C260B77BDF59] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C260B77BDF59]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK6F0C260BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C260BF1B1049]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK6F0C260E7CE6755] FOREIGN KEY([fk_acomodacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao] CHECK CONSTRAINT [FK6F0C260E7CE6755]
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKC234C031DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_campos_fixos_integracao_AUD] CHECK CONSTRAINT [FKC234C031DF74E053]
GO
ALTER TABLE [dbo].[tb_carta_glosa]  WITH NOCHECK ADD  CONSTRAINT [FK71920B2958D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_carta_glosa] CHECK CONSTRAINT [FK71920B2958D83D4E]
GO
ALTER TABLE [dbo].[tb_carta_glosa]  WITH NOCHECK ADD  CONSTRAINT [FK71920B2960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_carta_glosa] CHECK CONSTRAINT [FK71920B2960877044]
GO
ALTER TABLE [dbo].[tb_carta_glosa]  WITH NOCHECK ADD  CONSTRAINT [FK71920B297784988C] FOREIGN KEY([fk_espelho])
REFERENCES [dbo].[tb_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_carta_glosa] CHECK CONSTRAINT [FK71920B297784988C]
GO
ALTER TABLE [dbo].[tb_carta_glosa]  WITH CHECK ADD  CONSTRAINT [FK71920B29BE0875D5] FOREIGN KEY([fk_entidade_usuario_criacao])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_carta_glosa] CHECK CONSTRAINT [FK71920B29BE0875D5]
GO
ALTER TABLE [dbo].[tb_carta_glosa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF6027C7ADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_carta_glosa_AUD] CHECK CONSTRAINT [FKF6027C7ADF74E053]
GO
ALTER TABLE [dbo].[tb_caso_de_uso]  WITH NOCHECK ADD  CONSTRAINT [FK9D0A5D2760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_caso_de_uso] CHECK CONSTRAINT [FK9D0A5D2760877044]
GO
ALTER TABLE [dbo].[tb_caso_de_uso]  WITH NOCHECK ADD  CONSTRAINT [FK9D0A5D277E5D5293] FOREIGN KEY([fk_modulo])
REFERENCES [dbo].[tb_modulo] ([id])
GO
ALTER TABLE [dbo].[tb_caso_de_uso] CHECK CONSTRAINT [FK9D0A5D277E5D5293]
GO
ALTER TABLE [dbo].[tb_caso_de_uso_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK28E59F78DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_caso_de_uso_AUD] CHECK CONSTRAINT [FK28E59F78DF74E053]
GO
ALTER TABLE [dbo].[tb_ch]  WITH NOCHECK ADD  CONSTRAINT [FK690A3D660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_ch] CHECK CONSTRAINT [FK690A3D660877044]
GO
ALTER TABLE [dbo].[tb_ch]  WITH NOCHECK ADD  CONSTRAINT [FK690A3D6700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_ch] CHECK CONSTRAINT [FK690A3D6700F167]
GO
ALTER TABLE [dbo].[tb_ch_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK437AF6A7DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_ch_AUD] CHECK CONSTRAINT [FK437AF6A7DF74E053]
GO
ALTER TABLE [dbo].[tb_cid]  WITH NOCHECK ADD  CONSTRAINT [FKCB83D76D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_cid] CHECK CONSTRAINT [FKCB83D76D60877044]
GO
ALTER TABLE [dbo].[tb_cid_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK2DEC86BEDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_cid_AUD] CHECK CONSTRAINT [FK2DEC86BEDF74E053]
GO
ALTER TABLE [dbo].[tb_cidade]  WITH NOCHECK ADD  CONSTRAINT [FK438BCE152CDAA5F9] FOREIGN KEY([fk_uf_fencom])
REFERENCES [dbo].[tb_uf_fencom] ([id])
GO
ALTER TABLE [dbo].[tb_cidade] CHECK CONSTRAINT [FK438BCE152CDAA5F9]
GO
ALTER TABLE [dbo].[tb_cidade]  WITH NOCHECK ADD  CONSTRAINT [FK438BCE1560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_cidade] CHECK CONSTRAINT [FK438BCE1560877044]
GO
ALTER TABLE [dbo].[tb_cidade_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKDE48E966DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_cidade_AUD] CHECK CONSTRAINT [FKDE48E966DF74E053]
GO
ALTER TABLE [dbo].[tb_complexidade]  WITH NOCHECK ADD  CONSTRAINT [FK9F95592860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_complexidade] CHECK CONSTRAINT [FK9F95592860877044]
GO
ALTER TABLE [dbo].[tb_complexidade_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKB5A0B2F9DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_complexidade_AUD] CHECK CONSTRAINT [FKB5A0B2F9DF74E053]
GO
ALTER TABLE [dbo].[tb_composicao_servico_especial]  WITH NOCHECK ADD  CONSTRAINT [FKEBE4A92760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_composicao_servico_especial] CHECK CONSTRAINT [FKEBE4A92760877044]
GO
ALTER TABLE [dbo].[tb_composicao_servico_especial]  WITH NOCHECK ADD  CONSTRAINT [FKEBE4A9277D81BBA5] FOREIGN KEY([fk_servico_especial])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_composicao_servico_especial] CHECK CONSTRAINT [FKEBE4A9277D81BBA5]
GO
ALTER TABLE [dbo].[tb_composicao_servico_especial_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKA9B9EB78DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_composicao_servico_especial_AUD] CHECK CONSTRAINT [FKA9B9EB78DF74E053]
GO
ALTER TABLE [dbo].[tb_configuracao]  WITH NOCHECK ADD  CONSTRAINT [FKF6BA57E060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_configuracao] CHECK CONSTRAINT [FKF6BA57E060877044]
GO
ALTER TABLE [dbo].[tb_configuracao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKE03795B1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_configuracao_AUD] CHECK CONSTRAINT [FKE03795B1DF74E053]
GO
ALTER TABLE [dbo].[tb_configuracao_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK86CCACDE2D3BB1A4] FOREIGN KEY([fk_digitacao])
REFERENCES [dbo].[tb_digitacao] ([id])
GO
ALTER TABLE [dbo].[tb_configuracao_digitacao] CHECK CONSTRAINT [FK86CCACDE2D3BB1A4]
GO
ALTER TABLE [dbo].[tb_configuracao_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK86CCACDE60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_configuracao_digitacao] CHECK CONSTRAINT [FK86CCACDE60877044]
GO
ALTER TABLE [dbo].[tb_configuracao_digitacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKC4FB3BAFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_configuracao_digitacao_AUD] CHECK CONSTRAINT [FKC4FB3BAFDF74E053]
GO
ALTER TABLE [dbo].[tb_contratado_dados]  WITH NOCHECK ADD  CONSTRAINT [FK94DAC9B660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_contratado_dados] CHECK CONSTRAINT [FK94DAC9B660877044]
GO
ALTER TABLE [dbo].[tb_contratado_dados_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKB27F2C87DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_contratado_dados_AUD] CHECK CONSTRAINT [FKB27F2C87DF74E053]
GO
ALTER TABLE [dbo].[tb_contratado_profissional_dados]  WITH NOCHECK ADD  CONSTRAINT [FK3E57E5E460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_contratado_profissional_dados] CHECK CONSTRAINT [FK3E57E5E460877044]
GO
ALTER TABLE [dbo].[tb_contratado_profissional_dados_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKE29681B5DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_contratado_profissional_dados_AUD] CHECK CONSTRAINT [FKE29681B5DF74E053]
GO
ALTER TABLE [dbo].[tb_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKDF6F07744049A44D] FOREIGN KEY([fk_lancamento_repasse_complemento_honorario])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_convenio] CHECK CONSTRAINT [FKDF6F07744049A44D]
GO
ALTER TABLE [dbo].[tb_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKDF6F07744499B758] FOREIGN KEY([fk_lancamento_repasse_servico_adicional])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_convenio] CHECK CONSTRAINT [FKDF6F07744499B758]
GO
ALTER TABLE [dbo].[tb_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKDF6F077460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_convenio] CHECK CONSTRAINT [FKDF6F077460877044]
GO
ALTER TABLE [dbo].[tb_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKDF6F0774B41ADB83] FOREIGN KEY([fk_lancamento_repasse_estorno_adequacao])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_convenio] CHECK CONSTRAINT [FKDF6F0774B41ADB83]
GO
ALTER TABLE [dbo].[tb_convenio_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF9225B45DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_convenio_AUD] CHECK CONSTRAINT [FKF9225B45DF74E053]
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FKD95ADE154A94936] FOREIGN KEY([fk_entidade_cooperado_conversao])
REFERENCES [dbo].[rl_entidade_cooperado_conversao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao] CHECK CONSTRAINT [FKD95ADE154A94936]
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FKD95ADE1560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao] CHECK CONSTRAINT [FKD95ADE1560877044]
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao]  WITH NOCHECK ADD  CONSTRAINT [FKD95ADE15CB8BC4EB] FOREIGN KEY([fk_entidade_acomodacao])
REFERENCES [dbo].[rl_entidade_acomodacao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao] CHECK CONSTRAINT [FKD95ADE15CB8BC4EB]
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKD60FF966DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_conversao_acomodacao_AUD] CHECK CONSTRAINT [FKD60FF966DF74E053]
GO
ALTER TABLE [dbo].[tb_conversao_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKB36D6334A94936] FOREIGN KEY([fk_entidade_cooperado_conversao])
REFERENCES [dbo].[rl_entidade_cooperado_conversao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_convenio] CHECK CONSTRAINT [FKB36D6334A94936]
GO
ALTER TABLE [dbo].[tb_conversao_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKB36D63360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_convenio] CHECK CONSTRAINT [FKB36D63360877044]
GO
ALTER TABLE [dbo].[tb_conversao_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKB36D633700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_convenio] CHECK CONSTRAINT [FKB36D633700F167]
GO
ALTER TABLE [dbo].[tb_conversao_convenio_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4AD6B284DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_conversao_convenio_AUD] CHECK CONSTRAINT [FK4AD6B284DF74E053]
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao]  WITH NOCHECK ADD  CONSTRAINT [FK5D098E744A94936] FOREIGN KEY([fk_entidade_cooperado_conversao])
REFERENCES [dbo].[rl_entidade_cooperado_conversao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao] CHECK CONSTRAINT [FK5D098E744A94936]
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao]  WITH NOCHECK ADD  CONSTRAINT [FK5D098E7460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao] CHECK CONSTRAINT [FK5D098E7460877044]
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao]  WITH NOCHECK ADD  CONSTRAINT [FK5D098E74FF4CC356] FOREIGN KEY([fk_entidade_grau_participacao])
REFERENCES [dbo].[rl_entidade_grau_participacao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao] CHECK CONSTRAINT [FK5D098E74FF4CC356]
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK88216245DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_conversao_grau_participacao_AUD] CHECK CONSTRAINT [FK88216245DF74E053]
GO
ALTER TABLE [dbo].[tb_conversao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK1AD24BAA2637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_hospital] CHECK CONSTRAINT [FK1AD24BAA2637DC55]
GO
ALTER TABLE [dbo].[tb_conversao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK1AD24BAA4A94936] FOREIGN KEY([fk_entidade_cooperado_conversao])
REFERENCES [dbo].[rl_entidade_cooperado_conversao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_hospital] CHECK CONSTRAINT [FK1AD24BAA4A94936]
GO
ALTER TABLE [dbo].[tb_conversao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK1AD24BAA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_hospital] CHECK CONSTRAINT [FK1AD24BAA60877044]
GO
ALTER TABLE [dbo].[tb_conversao_hospital_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK8C3C947BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_conversao_hospital_AUD] CHECK CONSTRAINT [FK8C3C947BDF74E053]
GO
ALTER TABLE [dbo].[tb_conversao_internacao]  WITH NOCHECK ADD  CONSTRAINT [FK4076A7524A94936] FOREIGN KEY([fk_entidade_cooperado_conversao])
REFERENCES [dbo].[rl_entidade_cooperado_conversao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_internacao] CHECK CONSTRAINT [FK4076A7524A94936]
GO
ALTER TABLE [dbo].[tb_conversao_internacao]  WITH NOCHECK ADD  CONSTRAINT [FK4076A75260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_internacao] CHECK CONSTRAINT [FK4076A75260877044]
GO
ALTER TABLE [dbo].[tb_conversao_internacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4B7ADC23DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_conversao_internacao_AUD] CHECK CONSTRAINT [FK4B7ADC23DF74E053]
GO
ALTER TABLE [dbo].[tb_conversao_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FK4FA84C2D4A94936] FOREIGN KEY([fk_entidade_cooperado_conversao])
REFERENCES [dbo].[rl_entidade_cooperado_conversao] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_procedimento] CHECK CONSTRAINT [FK4FA84C2D4A94936]
GO
ALTER TABLE [dbo].[tb_conversao_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FK4FA84C2D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_procedimento] CHECK CONSTRAINT [FK4FA84C2D60877044]
GO
ALTER TABLE [dbo].[tb_conversao_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FK4FA84C2DBF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_procedimento] CHECK CONSTRAINT [FK4FA84C2DBF1B1049]
GO
ALTER TABLE [dbo].[tb_conversao_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FK4FA84C2DFDBC3F96] FOREIGN KEY([fk_procedimento_tuss])
REFERENCES [dbo].[tb_tabela_tiss_versao_codigo] ([id])
GO
ALTER TABLE [dbo].[tb_conversao_procedimento] CHECK CONSTRAINT [FK4FA84C2DFDBC3F96]
GO
ALTER TABLE [dbo].[tb_conversao_procedimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK6D489B7EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_conversao_procedimento_AUD] CHECK CONSTRAINT [FK6D489B7EDF74E053]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH CHECK ADD  CONSTRAINT [FK391CC12121D945A8] FOREIGN KEY([fk_endereco])
REFERENCES [dbo].[tb_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC12121D945A8]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK391CC1214A54C290] FOREIGN KEY([fk_especialidade])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC1214A54C290]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK391CC12158D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC12158D83D4E]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK391CC12160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC12160877044]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH CHECK ADD  CONSTRAINT [FK391CC1216291B6CC] FOREIGN KEY([fk_pais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC1216291B6CC]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH CHECK ADD  CONSTRAINT [FK391CC1216AEF283E] FOREIGN KEY([fk_nascimento_uf])
REFERENCES [dbo].[tb_uf_fencom] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC1216AEF283E]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK391CC12172D78072] FOREIGN KEY([fk_nacionalidade])
REFERENCES [dbo].[tb_nacionalidade] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC12172D78072]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK391CC121EADB554C] FOREIGN KEY([fk_uf])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC121EADB554C]
GO
ALTER TABLE [dbo].[tb_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK391CC121EE7CFB07] FOREIGN KEY([fk_conselho_profissional])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_cooperado] CHECK CONSTRAINT [FK391CC121EE7CFB07]
GO
ALTER TABLE [dbo].[tb_cooperado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKECD17672DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_cooperado_AUD] CHECK CONSTRAINT [FKECD17672DF74E053]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B614395142] FOREIGN KEY([fk_endereco])
REFERENCES [dbo].[tb_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B614395142]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B621D945A8] FOREIGN KEY([fk_endereco])
REFERENCES [dbo].[tb_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B621D945A8]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B62874238B] FOREIGN KEY([fk_endereco])
REFERENCES [dbo].[tb_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B62874238B]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B62E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B62E72EFA3]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B658D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B658D83D4E]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B660877044]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B6700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B6700F167]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK4694B4B698DD9564] FOREIGN KEY([fk_endereco])
REFERENCES [dbo].[tb_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco] CHECK CONSTRAINT [FK4694B4B698DD9564]
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCF4B9787DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_correspondencia_endereco_AUD] CHECK CONSTRAINT [FKCF4B9787DF74E053]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680A1AB136E0] FOREIGN KEY([fk_uf_crm])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680A1AB136E0]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680A3755E607] FOREIGN KEY([fk_indicador_acidente])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680A3755E607]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680A60877044]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680A8B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680A8B6715CA]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680A9C3F8B9C] FOREIGN KEY([fk_tipo_consulta])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680A9C3F8B9C]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680AD2FAA0AD] FOREIGN KEY([fk_tipo_guia])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680AD2FAA0AD]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680ADB2BEAE0] FOREIGN KEY([fk_tipo_espelho])
REFERENCES [dbo].[rl_entidadeconvenio_tipo_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680ADB2BEAE0]
GO
ALTER TABLE [dbo].[tb_dados_complementares]  WITH NOCHECK ADD  CONSTRAINT [FK3B08680ADB9DD27] FOREIGN KEY([fk_acomodacao_autorizada])
REFERENCES [dbo].[rl_entidade_acomodacao] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares] CHECK CONSTRAINT [FK3B08680ADB9DD27]
GO
ALTER TABLE [dbo].[tb_dados_complementares_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK314D80DBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_dados_complementares_AUD] CHECK CONSTRAINT [FK314D80DBDF74E053]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK579168661AB136E0] FOREIGN KEY([fk_uf_crm])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao] CHECK CONSTRAINT [FK579168661AB136E0]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK579168663755E607] FOREIGN KEY([fk_indicador_acidente])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao] CHECK CONSTRAINT [FK579168663755E607]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK579168665505D618] FOREIGN KEY([fk_acomodacao_autorizada])
REFERENCES [dbo].[rl_entidade_acomodacao_integracao] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao] CHECK CONSTRAINT [FK579168665505D618]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK579168668B00F5FB] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento_integracao] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao] CHECK CONSTRAINT [FK579168668B00F5FB]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK579168669C3F8B9C] FOREIGN KEY([fk_tipo_consulta])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao] CHECK CONSTRAINT [FK579168669C3F8B9C]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK57916866D2FAA0AD] FOREIGN KEY([fk_tipo_guia])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao] CHECK CONSTRAINT [FK57916866D2FAA0AD]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK57916866DB2BEAE0] FOREIGN KEY([fk_tipo_espelho])
REFERENCES [dbo].[rl_entidadeconvenio_tipo_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao] CHECK CONSTRAINT [FK57916866DB2BEAE0]
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKE666F337DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_dados_complementares_integracao_AUD] CHECK CONSTRAINT [FKE666F337DF74E053]
GO
ALTER TABLE [dbo].[tb_dados_solicitacao]  WITH NOCHECK ADD  CONSTRAINT [FKCB8E108060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_dados_solicitacao] CHECK CONSTRAINT [FKCB8E108060877044]
GO
ALTER TABLE [dbo].[tb_dados_solicitacao]  WITH NOCHECK ADD  CONSTRAINT [FKCB8E1080891EC82] FOREIGN KEY([fk_cooperado_solicitante])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_dados_solicitacao] CHECK CONSTRAINT [FKCB8E1080891EC82]
GO
ALTER TABLE [dbo].[tb_dados_solicitacao]  WITH NOCHECK ADD  CONSTRAINT [FKCB8E10808B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[tb_dados_solicitacao] CHECK CONSTRAINT [FKCB8E10808B6715CA]
GO
ALTER TABLE [dbo].[tb_dados_solicitacao]  WITH NOCHECK ADD  CONSTRAINT [FKCB8E1080BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_dados_solicitacao] CHECK CONSTRAINT [FKCB8E1080BF1B1049]
GO
ALTER TABLE [dbo].[tb_dados_solicitacao]  WITH NOCHECK ADD  CONSTRAINT [FKCB8E1080EDCE0E3C] FOREIGN KEY([fk_tabela_ans])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_dados_solicitacao] CHECK CONSTRAINT [FKCB8E1080EDCE0E3C]
GO
ALTER TABLE [dbo].[tb_dados_solicitacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK3D3DFE51DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_dados_solicitacao_AUD] CHECK CONSTRAINT [FK3D3DFE51DF74E053]
GO
ALTER TABLE [dbo].[tb_darf]  WITH CHECK ADD  CONSTRAINT [FKA4F76EA2502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_darf] CHECK CONSTRAINT [FKA4F76EA2502D5D01]
GO
ALTER TABLE [dbo].[tb_darf]  WITH CHECK ADD  CONSTRAINT [FKA4F76EA258D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_darf] CHECK CONSTRAINT [FKA4F76EA258D83D4E]
GO
ALTER TABLE [dbo].[tb_darf]  WITH CHECK ADD  CONSTRAINT [FKA4F76EA260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_darf] CHECK CONSTRAINT [FKA4F76EA260877044]
GO
ALTER TABLE [dbo].[tb_darf_AUD]  WITH CHECK ADD  CONSTRAINT [FK68A77B73DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_darf_AUD] CHECK CONSTRAINT [FK68A77B73DF74E053]
GO
ALTER TABLE [dbo].[tb_data_sync_inss]  WITH NOCHECK ADD  CONSTRAINT [FK8561410521798A2B] FOREIGN KEY([fk_declaracao_inss])
REFERENCES [dbo].[tb_declaracao_inss] ([id])
GO
ALTER TABLE [dbo].[tb_data_sync_inss] CHECK CONSTRAINT [FK8561410521798A2B]
GO
ALTER TABLE [dbo].[tb_data_sync_inss]  WITH NOCHECK ADD  CONSTRAINT [FK8561410547F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_data_sync_inss] CHECK CONSTRAINT [FK8561410547F1200E]
GO
ALTER TABLE [dbo].[tb_data_sync_inss]  WITH NOCHECK ADD  CONSTRAINT [FK8561410558D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_data_sync_inss] CHECK CONSTRAINT [FK8561410558D83D4E]
GO
ALTER TABLE [dbo].[tb_data_sync_inss]  WITH NOCHECK ADD  CONSTRAINT [FK8561410560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_data_sync_inss] CHECK CONSTRAINT [FK8561410560877044]
GO
ALTER TABLE [dbo].[tb_data_sync_inss]  WITH NOCHECK ADD  CONSTRAINT [FK856141057CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_data_sync_inss] CHECK CONSTRAINT [FK856141057CDF5F6C]
GO
ALTER TABLE [dbo].[tb_data_sync_inss]  WITH NOCHECK ADD  CONSTRAINT [FK85614105EA995586] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_data_sync_inss] CHECK CONSTRAINT [FK85614105EA995586]
GO
ALTER TABLE [dbo].[tb_data_sync_inss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK814B6456DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_data_sync_inss_AUD] CHECK CONSTRAINT [FK814B6456DF74E053]
GO
ALTER TABLE [dbo].[tb_de_para_tuss]  WITH NOCHECK ADD  CONSTRAINT [FK8B93199360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss] CHECK CONSTRAINT [FK8B93199360877044]
GO
ALTER TABLE [dbo].[tb_de_para_tuss]  WITH NOCHECK ADD  CONSTRAINT [FK8B931993892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss] CHECK CONSTRAINT [FK8B931993892ABB48]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF2A245E4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_AUD] CHECK CONSTRAINT [FKF2A245E4DF74E053]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK1FB5B5EF1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio] CHECK CONSTRAINT [FK1FB5B5EF1015879C]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK1FB5B5EF60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio] CHECK CONSTRAINT [FK1FB5B5EF60877044]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio]  WITH NOCHECK ADD  CONSTRAINT [FK1FB5B5EF7912C92B] FOREIGN KEY([fk_tabela_tiss])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio] CHECK CONSTRAINT [FK1FB5B5EF7912C92B]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK41275440DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_convenio_AUD] CHECK CONSTRAINT [FK41275440DF74E053]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK2F512B662637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital] CHECK CONSTRAINT [FK2F512B662637DC55]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK2F512B662F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital] CHECK CONSTRAINT [FK2F512B662F4C728A]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK2F512B6658D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital] CHECK CONSTRAINT [FK2F512B6658D83D4E]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK2F512B6660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital] CHECK CONSTRAINT [FK2F512B6660877044]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK2F512B667912C92B] FOREIGN KEY([fk_tabela_tiss])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital] CHECK CONSTRAINT [FK2F512B667912C92B]
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK828D3637DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_de_para_tuss_hospital_AUD] CHECK CONSTRAINT [FK828D3637DF74E053]
GO
ALTER TABLE [dbo].[tb_declaracao_inss]  WITH CHECK ADD  CONSTRAINT [FKB58721882A63FA53] FOREIGN KEY([fk_repasse_devolucao_inss])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss] CHECK CONSTRAINT [FKB58721882A63FA53]
GO
ALTER TABLE [dbo].[tb_declaracao_inss]  WITH NOCHECK ADD  CONSTRAINT [FKB587218847F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss] CHECK CONSTRAINT [FKB587218847F1200E]
GO
ALTER TABLE [dbo].[tb_declaracao_inss]  WITH NOCHECK ADD  CONSTRAINT [FKB587218858D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss] CHECK CONSTRAINT [FKB587218858D83D4E]
GO
ALTER TABLE [dbo].[tb_declaracao_inss]  WITH NOCHECK ADD  CONSTRAINT [FKB587218860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss] CHECK CONSTRAINT [FKB587218860877044]
GO
ALTER TABLE [dbo].[tb_declaracao_inss]  WITH NOCHECK ADD  CONSTRAINT [FKB58721887CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss] CHECK CONSTRAINT [FKB58721887CDF5F6C]
GO
ALTER TABLE [dbo].[tb_declaracao_inss]  WITH NOCHECK ADD  CONSTRAINT [FKB5872188DE2CA4F1] FOREIGN KEY([fk_usuario_criacao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss] CHECK CONSTRAINT [FKB5872188DE2CA4F1]
GO
ALTER TABLE [dbo].[tb_declaracao_inss]  WITH NOCHECK ADD  CONSTRAINT [FKB5872188FBE3199E] FOREIGN KEY([fk_declaracao_inss_rastreio])
REFERENCES [dbo].[tb_declaracao_inss_rastreio] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss] CHECK CONSTRAINT [FKB5872188FBE3199E]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK72B74B59DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_AUD] CHECK CONSTRAINT [FK72B74B59DF74E053]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente]  WITH NOCHECK ADD  CONSTRAINT [FK53003F5758D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente] CHECK CONSTRAINT [FK53003F5758D83D4E]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente]  WITH NOCHECK ADD  CONSTRAINT [FK53003F5760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente] CHECK CONSTRAINT [FK53003F5760877044]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente]  WITH NOCHECK ADD  CONSTRAINT [FK53003F57DE2CA4F1] FOREIGN KEY([fk_usuario_criacao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente] CHECK CONSTRAINT [FK53003F57DE2CA4F1]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente]  WITH NOCHECK ADD  CONSTRAINT [FK53003F57FBE3199E] FOREIGN KEY([fk_declaracao_inss_rastreio])
REFERENCES [dbo].[tb_declaracao_inss_rastreio] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente] CHECK CONSTRAINT [FK53003F57FBE3199E]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4FBEE9A8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_inconsistente_AUD] CHECK CONSTRAINT [FK4FBEE9A8DF74E053]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_rastreio]  WITH NOCHECK ADD  CONSTRAINT [FKEEAF084060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_rastreio] CHECK CONSTRAINT [FKEEAF084060877044]
GO
ALTER TABLE [dbo].[tb_declaracao_inss_rastreio_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK739D1611DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_declaracao_inss_rastreio_AUD] CHECK CONSTRAINT [FK739D1611DF74E053]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB05442637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB05442637DC55]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH CHECK ADD  CONSTRAINT [FK5CDB0544276AF941] FOREIGN KEY([fk_porte_anestesia])
REFERENCES [dbo].[tb_porte_anestesia] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB0544276AF941]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH CHECK ADD  CONSTRAINT [FK5CDB05442AACB7B0] FOREIGN KEY([fk_fator])
REFERENCES [dbo].[tb_fator] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB05442AACB7B0]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB05442E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB05442E72EFA3]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH CHECK ADD  CONSTRAINT [FK5CDB054430CB8BFD] FOREIGN KEY([fk_porte_anestesia])
REFERENCES [dbo].[tb_porte_anestesia] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB054430CB8BFD]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB054433F16C1F] FOREIGN KEY([fk_ch])
REFERENCES [dbo].[tb_ch] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB054433F16C1F]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH CHECK ADD  CONSTRAINT [FK5CDB05444783C8E6] FOREIGN KEY([fk_fator])
REFERENCES [dbo].[tb_fator] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB05444783C8E6]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB05444A54C290] FOREIGN KEY([fk_especialidade])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB05444A54C290]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB05444FA0FE3D] FOREIGN KEY([fk_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB05444FA0FE3D]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB0544577052BC] FOREIGN KEY([fk_item_porte_anestesia])
REFERENCES [dbo].[tb_item_porte_anestesia] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB0544577052BC]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB054460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB054460877044]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH CHECK ADD  CONSTRAINT [FK5CDB054463C1A073] FOREIGN KEY([fk_porte_anestesia])
REFERENCES [dbo].[tb_porte_anestesia] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB054463C1A073]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB0544700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB0544700F167]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB0544892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB0544892ABB48]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB0544B2E2BD57] FOREIGN KEY([fk_item_fator])
REFERENCES [dbo].[tb_item_fator] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB0544B2E2BD57]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH NOCHECK ADD  CONSTRAINT [FK5CDB0544BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB0544BF1B1049]
GO
ALTER TABLE [dbo].[tb_despesa]  WITH CHECK ADD  CONSTRAINT [FK5CDB0544EE8B9F22] FOREIGN KEY([fk_fator])
REFERENCES [dbo].[tb_fator] ([id])
GO
ALTER TABLE [dbo].[tb_despesa] CHECK CONSTRAINT [FK5CDB0544EE8B9F22]
GO
ALTER TABLE [dbo].[tb_despesa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKC1BAF115DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_despesa_AUD] CHECK CONSTRAINT [FKC1BAF115DF74E053]
GO
ALTER TABLE [dbo].[tb_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FKABC209EC60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_digitacao] CHECK CONSTRAINT [FKABC209EC60877044]
GO
ALTER TABLE [dbo].[tb_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FKABC209EC700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_digitacao] CHECK CONSTRAINT [FKABC209EC700F167]
GO
ALTER TABLE [dbo].[tb_digitacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK86BF61BDDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_digitacao_AUD] CHECK CONSTRAINT [FK86BF61BDDF74E053]
GO
ALTER TABLE [dbo].[tb_dirf]  WITH CHECK ADD  CONSTRAINT [FKA4F78CAA58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_dirf] CHECK CONSTRAINT [FKA4F78CAA58D83D4E]
GO
ALTER TABLE [dbo].[tb_dirf]  WITH CHECK ADD  CONSTRAINT [FKA4F78CAA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_dirf] CHECK CONSTRAINT [FKA4F78CAA60877044]
GO
ALTER TABLE [dbo].[tb_dirf_AUD]  WITH CHECK ADD  CONSTRAINT [FKFD9557BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_dirf_AUD] CHECK CONSTRAINT [FKFD9557BDF74E053]
GO
ALTER TABLE [dbo].[tb_edicao_fator_porte]  WITH NOCHECK ADD  CONSTRAINT [FK367345DA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_edicao_fator_porte] CHECK CONSTRAINT [FK367345DA60877044]
GO
ALTER TABLE [dbo].[tb_edicao_fator_porte_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK9D74F6ABDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_edicao_fator_porte_AUD] CHECK CONSTRAINT [FK9D74F6ABDF74E053]
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios]  WITH NOCHECK ADD  CONSTRAINT [FK478AB20560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios] CHECK CONSTRAINT [FK478AB20560877044]
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios]  WITH NOCHECK ADD  CONSTRAINT [FK478AB20571428D65] FOREIGN KEY([fk_tabela_honorarios])
REFERENCES [dbo].[tb_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios] CHECK CONSTRAINT [FK478AB20571428D65]
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios]  WITH CHECK ADD  CONSTRAINT [FK478AB2057716844E] FOREIGN KEY([fk_edicao_tabela_honorarios_original])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios] CHECK CONSTRAINT [FK478AB2057716844E]
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK3F545556DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_edicao_tabela_honorarios_AUD] CHECK CONSTRAINT [FK3F545556DF74E053]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67A1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67A1015879C]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67A2F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67A2F4C728A]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67A47C26373] FOREIGN KEY([fk_tipo_endereco])
REFERENCES [dbo].[tb_tipo_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67A47C26373]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67A47F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67A47F1200E]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67A58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67A58D83D4E]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67A60877044]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67A79D7B089] FOREIGN KEY([fk_tipo_logradouro])
REFERENCES [dbo].[tb_tipo_logradouro] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67A79D7B089]
GO
ALTER TABLE [dbo].[tb_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK6850E67AD97DB1DE] FOREIGN KEY([fk_cidade])
REFERENCES [dbo].[tb_cidade] ([id])
GO
ALTER TABLE [dbo].[tb_endereco] CHECK CONSTRAINT [FK6850E67AD97DB1DE]
GO
ALTER TABLE [dbo].[tb_endereco_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7051474BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_endereco_AUD] CHECK CONSTRAINT [FK7051474BDF74E053]
GO
ALTER TABLE [dbo].[tb_endereco_tmp]  WITH CHECK ADD  CONSTRAINT [FK705209D221D945A8] FOREIGN KEY([fk_endereco])
REFERENCES [dbo].[tb_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_endereco_tmp] CHECK CONSTRAINT [FK705209D221D945A8]
GO
ALTER TABLE [dbo].[tb_endereco_tmp]  WITH CHECK ADD  CONSTRAINT [FK705209D247C26373] FOREIGN KEY([fk_tipo_endereco])
REFERENCES [dbo].[tb_tipo_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_endereco_tmp] CHECK CONSTRAINT [FK705209D247C26373]
GO
ALTER TABLE [dbo].[tb_endereco_tmp]  WITH CHECK ADD  CONSTRAINT [FK705209D247F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_endereco_tmp] CHECK CONSTRAINT [FK705209D247F1200E]
GO
ALTER TABLE [dbo].[tb_endereco_tmp]  WITH CHECK ADD  CONSTRAINT [FK705209D260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_endereco_tmp] CHECK CONSTRAINT [FK705209D260877044]
GO
ALTER TABLE [dbo].[tb_endereco_tmp]  WITH CHECK ADD  CONSTRAINT [FK705209D279D7B089] FOREIGN KEY([fk_tipo_logradouro])
REFERENCES [dbo].[tb_tipo_logradouro] ([id])
GO
ALTER TABLE [dbo].[tb_endereco_tmp] CHECK CONSTRAINT [FK705209D279D7B089]
GO
ALTER TABLE [dbo].[tb_endereco_tmp]  WITH CHECK ADD  CONSTRAINT [FK705209D2D97DB1DE] FOREIGN KEY([fk_cidade])
REFERENCES [dbo].[tb_cidade] ([id])
GO
ALTER TABLE [dbo].[tb_endereco_tmp] CHECK CONSTRAINT [FK705209D2D97DB1DE]
GO
ALTER TABLE [dbo].[tb_endereco_tmp_AUD]  WITH CHECK ADD  CONSTRAINT [FK81E0FEA3DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_endereco_tmp_AUD] CHECK CONSTRAINT [FK81E0FEA3DF74E053]
GO
ALTER TABLE [dbo].[tb_entidade]  WITH NOCHECK ADD  CONSTRAINT [FK83D0624D2125B766] FOREIGN KEY([fk_impostos])
REFERENCES [dbo].[tb_impostos] ([id])
GO
ALTER TABLE [dbo].[tb_entidade] CHECK CONSTRAINT [FK83D0624D2125B766]
GO
ALTER TABLE [dbo].[tb_entidade]  WITH NOCHECK ADD  CONSTRAINT [FK83D0624D297D7705] FOREIGN KEY([fk_fatura_isolada_unimed])
REFERENCES [dbo].[tb_fatura] ([id])
GO
ALTER TABLE [dbo].[tb_entidade] CHECK CONSTRAINT [FK83D0624D297D7705]
GO
ALTER TABLE [dbo].[tb_entidade]  WITH NOCHECK ADD  CONSTRAINT [FK83D0624D316F681A] FOREIGN KEY([fk_lancamento_custo_op])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_entidade] CHECK CONSTRAINT [FK83D0624D316F681A]
GO
ALTER TABLE [dbo].[tb_entidade]  WITH CHECK ADD  CONSTRAINT [FK83D0624D4D03B68F] FOREIGN KEY([fk_grupo_endereco])
REFERENCES [dbo].[tb_grupo_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_entidade] CHECK CONSTRAINT [FK83D0624D4D03B68F]
GO
ALTER TABLE [dbo].[tb_entidade]  WITH NOCHECK ADD  CONSTRAINT [FK83D0624D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_entidade] CHECK CONSTRAINT [FK83D0624D60877044]
GO
ALTER TABLE [dbo].[tb_entidade]  WITH NOCHECK ADD  CONSTRAINT [FK83D0624D873DF4E8] FOREIGN KEY([fk_lancamento_honorarios])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_entidade] CHECK CONSTRAINT [FK83D0624D873DF4E8]
GO
ALTER TABLE [dbo].[tb_entidade_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK8538A19EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_entidade_AUD] CHECK CONSTRAINT [FK8538A19EDF74E053]
GO
ALTER TABLE [dbo].[tb_entidade_convenio_data_faturamento]  WITH NOCHECK ADD  CONSTRAINT [FK22E9ED7B60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_convenio_data_faturamento] CHECK CONSTRAINT [FK22E9ED7B60877044]
GO
ALTER TABLE [dbo].[tb_entidade_convenio_data_faturamento]  WITH NOCHECK ADD  CONSTRAINT [FK22E9ED7B700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_convenio_data_faturamento] CHECK CONSTRAINT [FK22E9ED7B700F167]
GO
ALTER TABLE [dbo].[tb_entidade_convenio_data_faturamento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK991CE5CCDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_entidade_convenio_data_faturamento_AUD] CHECK CONSTRAINT [FK991CE5CCDF74E053]
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKF07338A52A265F89] FOREIGN KEY([fk_grau_parentesco])
REFERENCES [dbo].[tb_grau_parentesco] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente] CHECK CONSTRAINT [FKF07338A52A265F89]
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKF07338A52E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente] CHECK CONSTRAINT [FKF07338A52E72EFA3]
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKF07338A560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente] CHECK CONSTRAINT [FKF07338A560877044]
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente]  WITH NOCHECK ADD  CONSTRAINT [FKF07338A5EE1AB320] FOREIGN KEY([fk_banco])
REFERENCES [dbo].[tb_banco] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente] CHECK CONSTRAINT [FKF07338A5EE1AB320]
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK9D588BF6DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_entidade_cooperado_dependente_AUD] CHECK CONSTRAINT [FK9D588BF6DF74E053]
GO
ALTER TABLE [dbo].[tb_entidade_faturamento]  WITH NOCHECK ADD  CONSTRAINT [FKD2BDA71458D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_faturamento] CHECK CONSTRAINT [FKD2BDA71458D83D4E]
GO
ALTER TABLE [dbo].[tb_entidade_faturamento]  WITH NOCHECK ADD  CONSTRAINT [FKD2BDA71460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_faturamento] CHECK CONSTRAINT [FKD2BDA71460877044]
GO
ALTER TABLE [dbo].[tb_entidade_faturamento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5ED82AE5DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_entidade_faturamento_AUD] CHECK CONSTRAINT [FK5ED82AE5DF74E053]
GO
ALTER TABLE [dbo].[tb_entidade_numero_automatico]  WITH CHECK ADD  CONSTRAINT [FK38F4CA3558D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_numero_automatico] CHECK CONSTRAINT [FK38F4CA3558D83D4E]
GO
ALTER TABLE [dbo].[tb_entidade_numero_automatico]  WITH CHECK ADD  CONSTRAINT [FK38F4CA3560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_numero_automatico] CHECK CONSTRAINT [FK38F4CA3560877044]
GO
ALTER TABLE [dbo].[tb_entidade_numero_automatico_AUD]  WITH CHECK ADD  CONSTRAINT [FKC096D586DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_entidade_numero_automatico_AUD] CHECK CONSTRAINT [FKC096D586DF74E053]
GO
ALTER TABLE [dbo].[tb_entidade_sefip]  WITH NOCHECK ADD  CONSTRAINT [FK1C5F1C0947F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_sefip] CHECK CONSTRAINT [FK1C5F1C0947F1200E]
GO
ALTER TABLE [dbo].[tb_entidade_sefip]  WITH NOCHECK ADD  CONSTRAINT [FK1C5F1C09502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_sefip] CHECK CONSTRAINT [FK1C5F1C09502D5D01]
GO
ALTER TABLE [dbo].[tb_entidade_sefip]  WITH NOCHECK ADD  CONSTRAINT [FK1C5F1C0958D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_sefip] CHECK CONSTRAINT [FK1C5F1C0958D83D4E]
GO
ALTER TABLE [dbo].[tb_entidade_sefip]  WITH NOCHECK ADD  CONSTRAINT [FK1C5F1C0960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_sefip] CHECK CONSTRAINT [FK1C5F1C0960877044]
GO
ALTER TABLE [dbo].[tb_entidade_sefip_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK601C1D5ADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_entidade_sefip_AUD] CHECK CONSTRAINT [FK601C1D5ADF74E053]
GO
ALTER TABLE [dbo].[tb_entidade_tiss]  WITH NOCHECK ADD  CONSTRAINT [FK21F3124758D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_tiss] CHECK CONSTRAINT [FK21F3124758D83D4E]
GO
ALTER TABLE [dbo].[tb_entidade_tiss]  WITH NOCHECK ADD  CONSTRAINT [FK21F3124760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_entidade_tiss] CHECK CONSTRAINT [FK21F3124760877044]
GO
ALTER TABLE [dbo].[tb_entidade_tiss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF22EC498DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_entidade_tiss_AUD] CHECK CONSTRAINT [FKF22EC498DF74E053]
GO
ALTER TABLE [dbo].[tb_erro_importacao_base]  WITH CHECK ADD  CONSTRAINT [FKD7DDC27760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_erro_importacao_base] CHECK CONSTRAINT [FKD7DDC27760877044]
GO
ALTER TABLE [dbo].[tb_erro_importacao_base]  WITH CHECK ADD  CONSTRAINT [FKD7DDC277B1D25BC4] FOREIGN KEY([fk_importacao_base])
REFERENCES [dbo].[tb_importacao_base] ([id])
GO
ALTER TABLE [dbo].[tb_erro_importacao_base] CHECK CONSTRAINT [FKD7DDC277B1D25BC4]
GO
ALTER TABLE [dbo].[tb_erro_importacao_base_AUD]  WITH CHECK ADD  CONSTRAINT [FK55E5DCC8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_erro_importacao_base_AUD] CHECK CONSTRAINT [FK55E5DCC8DF74E053]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9F2125B766] FOREIGN KEY([fk_impostos])
REFERENCES [dbo].[tb_impostos] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F2125B766]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9F2F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F2F4C728A]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9F58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F58D83D4E]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9F60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F60877044]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH CHECK ADD  CONSTRAINT [FKA975EB9F61024EA9] FOREIGN KEY([fk_motivo_diferenca])
REFERENCES [dbo].[tb_motivo_diferenca] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F61024EA9]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9F700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F700F167]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH CHECK ADD  CONSTRAINT [FKA975EB9F72ADEC83] FOREIGN KEY([fk_lancamento_repasse_honorario])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F72ADEC83]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9F7626BF3F] FOREIGN KEY([fk_classificacao_espelho])
REFERENCES [dbo].[rl_entidade_classificacao_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F7626BF3F]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9F93779BE9] FOREIGN KEY([fk_entidade_usuario_cancelamento])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9F93779BE9]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9FBE0875D5] FOREIGN KEY([fk_entidade_usuario_criacao])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9FBE0875D5]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9FC1CEB104] FOREIGN KEY([fk_complexidade])
REFERENCES [dbo].[tb_complexidade] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9FC1CEB104]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH NOCHECK ADD  CONSTRAINT [FKA975EB9FDB2BEAE0] FOREIGN KEY([fk_tipo_espelho])
REFERENCES [dbo].[rl_entidadeconvenio_tipo_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9FDB2BEAE0]
GO
ALTER TABLE [dbo].[tb_espelho]  WITH CHECK ADD  CONSTRAINT [FKA975EB9FF295F702] FOREIGN KEY([fk_lancamento_repasse_custo_operacional])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_espelho] CHECK CONSTRAINT [FKA975EB9FF295F702]
GO
ALTER TABLE [dbo].[tb_espelho_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKDF7531F0DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_espelho_AUD] CHECK CONSTRAINT [FKDF7531F0DF74E053]
GO
ALTER TABLE [dbo].[tb_estado_civil]  WITH CHECK ADD  CONSTRAINT [FKA784D00B60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_estado_civil] CHECK CONSTRAINT [FKA784D00B60877044]
GO
ALTER TABLE [dbo].[tb_estado_civil_AUD]  WITH CHECK ADD  CONSTRAINT [FKB964005CDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_estado_civil_AUD] CHECK CONSTRAINT [FKB964005CDF74E053]
GO
ALTER TABLE [dbo].[tb_faixa_retencao_ir]  WITH NOCHECK ADD  CONSTRAINT [FK773E308860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_faixa_retencao_ir] CHECK CONSTRAINT [FK773E308860877044]
GO
ALTER TABLE [dbo].[tb_faixa_retencao_ir]  WITH NOCHECK ADD  CONSTRAINT [FK773E308898BE58E8] FOREIGN KEY([fk_ir])
REFERENCES [dbo].[tb_ir] ([id])
GO
ALTER TABLE [dbo].[tb_faixa_retencao_ir] CHECK CONSTRAINT [FK773E308898BE58E8]
GO
ALTER TABLE [dbo].[tb_faixa_retencao_ir_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK544EDA59DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_faixa_retencao_ir_AUD] CHECK CONSTRAINT [FK544EDA59DF74E053]
GO
ALTER TABLE [dbo].[tb_faixa_tabela_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK952984E24E6E6EE5] FOREIGN KEY([fk_tabela_calculo])
REFERENCES [dbo].[tb_tabela_calculo] ([id])
GO
ALTER TABLE [dbo].[tb_faixa_tabela_calculo] CHECK CONSTRAINT [FK952984E24E6E6EE5]
GO
ALTER TABLE [dbo].[tb_faixa_tabela_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK952984E260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_faixa_tabela_calculo] CHECK CONSTRAINT [FK952984E260877044]
GO
ALTER TABLE [dbo].[tb_faixa_tabela_calculo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK296471B3DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_faixa_tabela_calculo_AUD] CHECK CONSTRAINT [FK296471B3DF74E053]
GO
ALTER TABLE [dbo].[tb_fator]  WITH CHECK ADD  CONSTRAINT [FKFA129DAB1C1AD204] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_fator] CHECK CONSTRAINT [FKFA129DAB1C1AD204]
GO
ALTER TABLE [dbo].[tb_fator]  WITH NOCHECK ADD  CONSTRAINT [FKFA129DAB5DE6FFDC] FOREIGN KEY([fk_edicao_fator_porte])
REFERENCES [dbo].[tb_edicao_fator_porte] ([id])
GO
ALTER TABLE [dbo].[tb_fator] CHECK CONSTRAINT [FKFA129DAB5DE6FFDC]
GO
ALTER TABLE [dbo].[tb_fator]  WITH NOCHECK ADD  CONSTRAINT [FKFA129DAB60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_fator] CHECK CONSTRAINT [FKFA129DAB60877044]
GO
ALTER TABLE [dbo].[tb_fator]  WITH CHECK ADD  CONSTRAINT [FKFA129DAB892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_fator] CHECK CONSTRAINT [FKFA129DAB892ABB48]
GO
ALTER TABLE [dbo].[tb_fator]  WITH CHECK ADD  CONSTRAINT [FKFA129DABA948107A] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_fator] CHECK CONSTRAINT [FKFA129DABA948107A]
GO
ALTER TABLE [dbo].[tb_fator]  WITH NOCHECK ADD  CONSTRAINT [FKFA129DABB2E2BD57] FOREIGN KEY([fk_item_fator])
REFERENCES [dbo].[tb_item_fator] ([id])
GO
ALTER TABLE [dbo].[tb_fator] CHECK CONSTRAINT [FKFA129DABB2E2BD57]
GO
ALTER TABLE [dbo].[tb_fator_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4F11FDFCDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_fator_AUD] CHECK CONSTRAINT [FK4F11FDFCDF74E053]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C1015879C]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C2125B766] FOREIGN KEY([fk_impostos])
REFERENCES [dbo].[tb_impostos] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C2125B766]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C24127706] FOREIGN KEY([fk_entidade_importacao_unimed])
REFERENCES [dbo].[rl_entidade_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C24127706]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C58D83D4E]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C60877044]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C61024EA9] FOREIGN KEY([fk_motivo_diferenca])
REFERENCES [dbo].[tb_motivo_diferenca] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C61024EA9]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C72ADEC83] FOREIGN KEY([fk_lancamento_repasse_honorario])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C72ADEC83]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9C93779BE9] FOREIGN KEY([fk_entidade_usuario_cancelamento])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9C93779BE9]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9CBE0875D5] FOREIGN KEY([fk_entidade_usuario_criacao])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9CBE0875D5]
GO
ALTER TABLE [dbo].[tb_fatura]  WITH NOCHECK ADD  CONSTRAINT [FK48412E9CF295F702] FOREIGN KEY([fk_lancamento_repasse_custo_operacional])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_fatura] CHECK CONSTRAINT [FK48412E9CF295F702]
GO
ALTER TABLE [dbo].[tb_fatura_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKD0BCAE6DDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_fatura_AUD] CHECK CONSTRAINT [FKD0BCAE6DDF74E053]
GO
ALTER TABLE [dbo].[tb_feriado]  WITH NOCHECK ADD  CONSTRAINT [FKC69624E560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_feriado] CHECK CONSTRAINT [FKC69624E560877044]
GO
ALTER TABLE [dbo].[tb_feriado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK93AB5836DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_feriado_AUD] CHECK CONSTRAINT [FK93AB5836DF74E053]
GO
ALTER TABLE [dbo].[tb_forma_tipo_espelho]  WITH CHECK ADD  CONSTRAINT [FKBA64D4B860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_forma_tipo_espelho] CHECK CONSTRAINT [FKBA64D4B860877044]
GO
ALTER TABLE [dbo].[tb_forma_tipo_espelho_AUD]  WITH CHECK ADD  CONSTRAINT [FK9E27E689DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_forma_tipo_espelho_AUD] CHECK CONSTRAINT [FK9E27E689DF74E053]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH NOCHECK ADD  CONSTRAINT [FKFA25A2E74971BE02] FOREIGN KEY([fk_entidade_motivo_glosa])
REFERENCES [dbo].[rl_entidade_motivo_glosa] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E74971BE02]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH NOCHECK ADD  CONSTRAINT [FKFA25A2E760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E760877044]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH NOCHECK ADD  CONSTRAINT [FKFA25A2E77E8BE890] FOREIGN KEY([fk_procedimento])
REFERENCES [dbo].[tb_procedimento] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E77E8BE890]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH NOCHECK ADD  CONSTRAINT [FKFA25A2E7AB6A83EE] FOREIGN KEY([fk_motivo_glosa_unimed])
REFERENCES [dbo].[tb_de_para_tuss_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E7AB6A83EE]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH NOCHECK ADD  CONSTRAINT [FKFA25A2E7B5EBE7B9] FOREIGN KEY([fk_motivo_glosa])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E7B5EBE7B9]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH CHECK ADD  CONSTRAINT [FKFA25A2E7B6C7DC79] FOREIGN KEY([fk_importacao_unimed])
REFERENCES [dbo].[tb_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E7B6C7DC79]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH CHECK ADD  CONSTRAINT [FKFA25A2E7BE0875D5] FOREIGN KEY([fk_entidade_usuario_criacao])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E7BE0875D5]
GO
ALTER TABLE [dbo].[tb_glosa]  WITH NOCHECK ADD  CONSTRAINT [FKFA25A2E7F2017F13] FOREIGN KEY([fk_carta_glosa])
REFERENCES [dbo].[tb_carta_glosa] ([id])
GO
ALTER TABLE [dbo].[tb_glosa] CHECK CONSTRAINT [FKFA25A2E7F2017F13]
GO
ALTER TABLE [dbo].[tb_glosa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK57680538DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_glosa_AUD] CHECK CONSTRAINT [FK57680538DF74E053]
GO
ALTER TABLE [dbo].[tb_grau_parentesco]  WITH NOCHECK ADD  CONSTRAINT [FK7A74FB5360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_grau_parentesco] CHECK CONSTRAINT [FK7A74FB5360877044]
GO
ALTER TABLE [dbo].[tb_grau_parentesco_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF63D47A4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_grau_parentesco_AUD] CHECK CONSTRAINT [FKF63D47A4DF74E053]
GO
ALTER TABLE [dbo].[tb_grupo_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKCD9889CA58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_convenio] CHECK CONSTRAINT [FKCD9889CA58D83D4E]
GO
ALTER TABLE [dbo].[tb_grupo_convenio]  WITH NOCHECK ADD  CONSTRAINT [FKCD9889CA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_convenio] CHECK CONSTRAINT [FKCD9889CA60877044]
GO
ALTER TABLE [dbo].[tb_grupo_convenio_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKD776C29BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_grupo_convenio_AUD] CHECK CONSTRAINT [FKD776C29BDF74E053]
GO
ALTER TABLE [dbo].[tb_grupo_despesa]  WITH NOCHECK ADD  CONSTRAINT [FKF0ECE02E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_despesa] CHECK CONSTRAINT [FKF0ECE02E60877044]
GO
ALTER TABLE [dbo].[tb_grupo_despesa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF23146FFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_grupo_despesa_AUD] CHECK CONSTRAINT [FKF23146FFDF74E053]
GO
ALTER TABLE [dbo].[tb_grupo_endereco]  WITH CHECK ADD  CONSTRAINT [FK567A68D060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_endereco] CHECK CONSTRAINT [FK567A68D060877044]
GO
ALTER TABLE [dbo].[tb_grupo_endereco_AUD]  WITH CHECK ADD  CONSTRAINT [FK4EA5AEA1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_grupo_endereco_AUD] CHECK CONSTRAINT [FK4EA5AEA1DF74E053]
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa]  WITH CHECK ADD  CONSTRAINT [FK4D84C062E72EFA3] FOREIGN KEY([fk_entidade_cooperado])
REFERENCES [dbo].[rl_entidade_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa] CHECK CONSTRAINT [FK4D84C062E72EFA3]
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa]  WITH CHECK ADD  CONSTRAINT [FK4D84C065DE6FFDC] FOREIGN KEY([fk_edicao_fator_porte])
REFERENCES [dbo].[tb_edicao_fator_porte] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa] CHECK CONSTRAINT [FK4D84C065DE6FFDC]
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa]  WITH CHECK ADD  CONSTRAINT [FK4D84C0660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa] CHECK CONSTRAINT [FK4D84C0660877044]
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa]  WITH CHECK ADD  CONSTRAINT [FK4D84C06700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa] CHECK CONSTRAINT [FK4D84C06700F167]
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa_AUD]  WITH CHECK ADD  CONSTRAINT [FK85306D7DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_grupo_subgrupo_despesa_AUD] CHECK CONSTRAINT [FK85306D7DF74E053]
GO
ALTER TABLE [dbo].[tb_guia_cabecalho]  WITH NOCHECK ADD  CONSTRAINT [FK57C4C60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_guia_cabecalho] CHECK CONSTRAINT [FK57C4C60877044]
GO
ALTER TABLE [dbo].[tb_guia_cabecalho_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4D42A41DDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_guia_cabecalho_AUD] CHECK CONSTRAINT [FK4D42A41DDF74E053]
GO
ALTER TABLE [dbo].[tb_guia_consulta]  WITH NOCHECK ADD  CONSTRAINT [FK6D7C1B7D154E1C62] FOREIGN KEY([dados_beneficiario])
REFERENCES [dbo].[tb_beneficiario_dados] ([id])
GO
ALTER TABLE [dbo].[tb_guia_consulta] CHECK CONSTRAINT [FK6D7C1B7D154E1C62]
GO
ALTER TABLE [dbo].[tb_guia_consulta]  WITH NOCHECK ADD  CONSTRAINT [FK6D7C1B7D2267B3DC] FOREIGN KEY([profissional_executante])
REFERENCES [dbo].[tb_contratado_profissional_dados] ([id])
GO
ALTER TABLE [dbo].[tb_guia_consulta] CHECK CONSTRAINT [FK6D7C1B7D2267B3DC]
GO
ALTER TABLE [dbo].[tb_guia_consulta]  WITH NOCHECK ADD  CONSTRAINT [FK6D7C1B7D5DB6CE89] FOREIGN KEY([contratado_executante])
REFERENCES [dbo].[tb_contratado_dados] ([id])
GO
ALTER TABLE [dbo].[tb_guia_consulta] CHECK CONSTRAINT [FK6D7C1B7D5DB6CE89]
GO
ALTER TABLE [dbo].[tb_guia_consulta]  WITH NOCHECK ADD  CONSTRAINT [FK6D7C1B7D8C40A8B1] FOREIGN KEY([ct_guiaCabecalho])
REFERENCES [dbo].[tb_guia_cabecalho] ([id])
GO
ALTER TABLE [dbo].[tb_guia_consulta] CHECK CONSTRAINT [FK6D7C1B7D8C40A8B1]
GO
ALTER TABLE [dbo].[tb_guia_consulta]  WITH NOCHECK ADD  CONSTRAINT [FK6D7C1B7DB05839A] FOREIGN KEY([dados_atendimento])
REFERENCES [dbo].[ctm_consultaAtendimento] ([id])
GO
ALTER TABLE [dbo].[tb_guia_consulta] CHECK CONSTRAINT [FK6D7C1B7DB05839A]
GO
ALTER TABLE [dbo].[tb_guia_consulta]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11D608770446d7c1b7d] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_guia_consulta] CHECK CONSTRAINT [FKA223F11D608770446d7c1b7d]
GO
ALTER TABLE [dbo].[tb_guia_consulta]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11DD5B96D016d7c1b7d] FOREIGN KEY([fk_tiss])
REFERENCES [dbo].[tb_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_guia_consulta] CHECK CONSTRAINT [FKA223F11DD5B96D016d7c1b7d]
GO
ALTER TABLE [dbo].[tb_guia_consulta_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK1E88486EDF74E053d30442ce] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_guia_consulta_AUD] CHECK CONSTRAINT [FK1E88486EDF74E053d30442ce]
GO
ALTER TABLE [dbo].[tb_guia_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11D60877044205acff9] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_guia_honorario] CHECK CONSTRAINT [FKA223F11D60877044205acff9]
GO
ALTER TABLE [dbo].[tb_guia_honorario]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11DD5B96D01205acff9] FOREIGN KEY([fk_tiss])
REFERENCES [dbo].[tb_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_guia_honorario] CHECK CONSTRAINT [FKA223F11DD5B96D01205acff9]
GO
ALTER TABLE [dbo].[tb_guia_honorario_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK1E88486EDF74E053d63c594a] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_guia_honorario_AUD] CHECK CONSTRAINT [FK1E88486EDF74E053d63c594a]
GO
ALTER TABLE [dbo].[tb_guia_sp_sadt]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11D608770444a8af178] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_guia_sp_sadt] CHECK CONSTRAINT [FKA223F11D608770444a8af178]
GO
ALTER TABLE [dbo].[tb_guia_sp_sadt]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11DD5B96D014a8af178] FOREIGN KEY([fk_tiss])
REFERENCES [dbo].[tb_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_guia_sp_sadt] CHECK CONSTRAINT [FKA223F11DD5B96D014a8af178]
GO
ALTER TABLE [dbo].[tb_guia_sp_sadt_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK1E88486EDF74E0534071a349] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_guia_sp_sadt_AUD] CHECK CONSTRAINT [FK1E88486EDF74E0534071a349]
GO
ALTER TABLE [dbo].[tb_guia_tiss]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_guia_tiss] CHECK CONSTRAINT [FKA223F11D60877044]
GO
ALTER TABLE [dbo].[tb_guia_tiss]  WITH NOCHECK ADD  CONSTRAINT [FKA223F11DD5B96D01] FOREIGN KEY([fk_tiss])
REFERENCES [dbo].[tb_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_guia_tiss] CHECK CONSTRAINT [FKA223F11DD5B96D01]
GO
ALTER TABLE [dbo].[tb_guia_tiss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK1E88486EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_guia_tiss_AUD] CHECK CONSTRAINT [FK1E88486EDF74E053]
GO
ALTER TABLE [dbo].[tb_horario_trabalho]  WITH NOCHECK ADD  CONSTRAINT [FKA9B26B7F58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_horario_trabalho] CHECK CONSTRAINT [FKA9B26B7F58D83D4E]
GO
ALTER TABLE [dbo].[tb_horario_trabalho]  WITH NOCHECK ADD  CONSTRAINT [FKA9B26B7F60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_horario_trabalho] CHECK CONSTRAINT [FKA9B26B7F60877044]
GO
ALTER TABLE [dbo].[tb_horario_trabalho]  WITH CHECK ADD  CONSTRAINT [FKA9B26B7FEA995586] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_horario_trabalho] CHECK CONSTRAINT [FKA9B26B7FEA995586]
GO
ALTER TABLE [dbo].[tb_horario_trabalho_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK6BAEC1D0DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_horario_trabalho_AUD] CHECK CONSTRAINT [FK6BAEC1D0DF74E053]
GO
ALTER TABLE [dbo].[tb_hospital]  WITH NOCHECK ADD  CONSTRAINT [FKEF0A7CEB60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_hospital] CHECK CONSTRAINT [FKEF0A7CEB60877044]
GO
ALTER TABLE [dbo].[tb_hospital_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK3A883D3CDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_hospital_AUD] CHECK CONSTRAINT [FK3A883D3CDF74E053]
GO
ALTER TABLE [dbo].[tb_identificacao_transacao]  WITH NOCHECK ADD  CONSTRAINT [FKDA947E9F60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_identificacao_transacao] CHECK CONSTRAINT [FKDA947E9F60877044]
GO
ALTER TABLE [dbo].[tb_identificacao_transacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK691244F0DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_identificacao_transacao_AUD] CHECK CONSTRAINT [FK691244F0DF74E053]
GO
ALTER TABLE [dbo].[tb_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK853A280A1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_base] CHECK CONSTRAINT [FK853A280A1015879C]
GO
ALTER TABLE [dbo].[tb_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK853A280A2F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_base] CHECK CONSTRAINT [FK853A280A2F4C728A]
GO
ALTER TABLE [dbo].[tb_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK853A280A58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_base] CHECK CONSTRAINT [FK853A280A58D83D4E]
GO
ALTER TABLE [dbo].[tb_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK853A280A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_base] CHECK CONSTRAINT [FK853A280A60877044]
GO
ALTER TABLE [dbo].[tb_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK853A280A7E8BE890] FOREIGN KEY([fk_procedimento])
REFERENCES [dbo].[tb_procedimento] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_base] CHECK CONSTRAINT [FK853A280A7E8BE890]
GO
ALTER TABLE [dbo].[tb_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK853A280A9251C76A] FOREIGN KEY([fk_entidade_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_base] CHECK CONSTRAINT [FK853A280A9251C76A]
GO
ALTER TABLE [dbo].[tb_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK853A280AEA995586] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_base] CHECK CONSTRAINT [FK853A280AEA995586]
GO
ALTER TABLE [dbo].[tb_importacao_base_AUD]  WITH CHECK ADD  CONSTRAINT [FK8C9F40DBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_importacao_base_AUD] CHECK CONSTRAINT [FK8C9F40DBDF74E053]
GO
ALTER TABLE [dbo].[tb_importacao_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK406F31D560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_importacao_unimed] CHECK CONSTRAINT [FK406F31D560877044]
GO
ALTER TABLE [dbo].[tb_importacao_unimed_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK2F546D26DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_importacao_unimed_AUD] CHECK CONSTRAINT [FK2F546D26DF74E053]
GO
ALTER TABLE [dbo].[tb_impostos]  WITH NOCHECK ADD  CONSTRAINT [FKE7F71F5960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_impostos] CHECK CONSTRAINT [FKE7F71F5960877044]
GO
ALTER TABLE [dbo].[tb_impostos_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCE61F8AADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_impostos_AUD] CHECK CONSTRAINT [FKCE61F8AADF74E053]
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FKA04494B141712430] FOREIGN KEY([fk_lancamento_repasse_principal])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse] CHECK CONSTRAINT [FKA04494B141712430]
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FKA04494B14E2C09D5] FOREIGN KEY([fk_lancamento_repasse_incidente])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse] CHECK CONSTRAINT [FKA04494B14E2C09D5]
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FKA04494B160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse] CHECK CONSTRAINT [FKA04494B160877044]
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKDC50202DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_incidencia_lancamento_repasse_AUD] CHECK CONSTRAINT [FKDC50202DF74E053]
GO
ALTER TABLE [dbo].[tb_inss]  WITH NOCHECK ADD  CONSTRAINT [FKA4F9E57660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_inss] CHECK CONSTRAINT [FKA4F9E57660877044]
GO
ALTER TABLE [dbo].[tb_inss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK222A6847DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_inss_AUD] CHECK CONSTRAINT [FK222A6847DF74E053]
GO
ALTER TABLE [dbo].[tb_inss_vigencia]  WITH NOCHECK ADD  CONSTRAINT [FK7E55FC8760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_inss_vigencia] CHECK CONSTRAINT [FK7E55FC8760877044]
GO
ALTER TABLE [dbo].[tb_inss_vigencia]  WITH NOCHECK ADD  CONSTRAINT [FK7E55FC87628BBDA0] FOREIGN KEY([fk_inss])
REFERENCES [dbo].[tb_inss] ([id])
GO
ALTER TABLE [dbo].[tb_inss_vigencia] CHECK CONSTRAINT [FK7E55FC87628BBDA0]
GO
ALTER TABLE [dbo].[tb_inss_vigencia_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK32928ED8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_inss_vigencia_AUD] CHECK CONSTRAINT [FK32928ED8DF74E053]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO]  WITH NOCHECK ADD  CONSTRAINT [FK2B2F0B822637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO] CHECK CONSTRAINT [FK2B2F0B822637DC55]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO]  WITH NOCHECK ADD  CONSTRAINT [FK2B2F0B8258D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO] CHECK CONSTRAINT [FK2B2F0B8258D83D4E]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO]  WITH NOCHECK ADD  CONSTRAINT [FK2B2F0B8260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO] CHECK CONSTRAINT [FK2B2F0B8260877044]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO]  WITH NOCHECK ADD  CONSTRAINT [FK2B2F0B82E9D82F9] FOREIGN KEY([fk_convenio_entidade])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO] CHECK CONSTRAINT [FK2B2F0B82E9D82F9]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK9E05A853DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_AUD] CHECK CONSTRAINT [FK9E05A853DF74E053]
GO
ALTER TABLE [dbo].[tb_integracao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK787B66572637DC55] FOREIGN KEY([fk_entidade_hospital])
REFERENCES [dbo].[rl_entidade_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_hospital] CHECK CONSTRAINT [FK787B66572637DC55]
GO
ALTER TABLE [dbo].[tb_integracao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK787B66572F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_hospital] CHECK CONSTRAINT [FK787B66572F4C728A]
GO
ALTER TABLE [dbo].[tb_integracao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK787B665758D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_hospital] CHECK CONSTRAINT [FK787B665758D83D4E]
GO
ALTER TABLE [dbo].[tb_integracao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK787B66578719D758] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_hospital] CHECK CONSTRAINT [FK787B66578719D758]
GO
ALTER TABLE [dbo].[tb_integracao_hospital]  WITH CHECK ADD  CONSTRAINT [FK787B6657B1D25BC4] FOREIGN KEY([fk_importacao_base])
REFERENCES [dbo].[tb_importacao_base] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_hospital] CHECK CONSTRAINT [FK787B6657B1D25BC4]
GO
ALTER TABLE [dbo].[tb_integracao_hospital]  WITH NOCHECK ADD  CONSTRAINT [FK787B6657B77BDF59] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_hospital] CHECK CONSTRAINT [FK787B6657B77BDF59]
GO
ALTER TABLE [dbo].[tb_integracao_hospital_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK654E90A8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_integracao_hospital_AUD] CHECK CONSTRAINT [FK654E90A8DF74E053]
GO
ALTER TABLE [dbo].[tb_integracao_sus]  WITH CHECK ADD  CONSTRAINT [FK6769F81458D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_sus] CHECK CONSTRAINT [FK6769F81458D83D4E]
GO
ALTER TABLE [dbo].[tb_integracao_sus]  WITH NOCHECK ADD  CONSTRAINT [FK6769F81460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_sus] CHECK CONSTRAINT [FK6769F81460877044]
GO
ALTER TABLE [dbo].[tb_integracao_sus_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK32F3FBE5DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_integracao_sus_AUD] CHECK CONSTRAINT [FK32F3FBE5DF74E053]
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao]  WITH NOCHECK ADD  CONSTRAINT [FK4E4CD60D58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao] CHECK CONSTRAINT [FK4E4CD60D58D83D4E]
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao]  WITH NOCHECK ADD  CONSTRAINT [FK4E4CD60D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao] CHECK CONSTRAINT [FK4E4CD60D60877044]
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao]  WITH NOCHECK ADD  CONSTRAINT [FK4E4CD60DFA9846B0] FOREIGN KEY([fk_integracao_sus])
REFERENCES [dbo].[tb_integracao_sus] ([id])
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao] CHECK CONSTRAINT [FK4E4CD60DFA9846B0]
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK10D5355EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_integracao_sus_sobra_acareacao_AUD] CHECK CONSTRAINT [FK10D5355EDF74E053]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED]  WITH CHECK ADD  CONSTRAINT [FK5620CA391015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED] CHECK CONSTRAINT [FK5620CA391015879C]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED]  WITH CHECK ADD  CONSTRAINT [FK5620CA392F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED] CHECK CONSTRAINT [FK5620CA392F4C728A]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED]  WITH CHECK ADD  CONSTRAINT [FK5620CA3958D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED] CHECK CONSTRAINT [FK5620CA3958D83D4E]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED]  WITH CHECK ADD  CONSTRAINT [FK5620CA3960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED] CHECK CONSTRAINT [FK5620CA3960877044]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED]  WITH CHECK ADD  CONSTRAINT [FK5620CA397784988C] FOREIGN KEY([fk_espelho])
REFERENCES [dbo].[tb_espelho] ([id])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED] CHECK CONSTRAINT [FK5620CA397784988C]
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED_AUD]  WITH CHECK ADD  CONSTRAINT [FK67FB338ADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[TB_INTEGRACAO_UNIMED_AUD] CHECK CONSTRAINT [FK67FB338ADF74E053]
GO
ALTER TABLE [dbo].[tb_ir]  WITH NOCHECK ADD  CONSTRAINT [FK690A49A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_ir] CHECK CONSTRAINT [FK690A49A60877044]
GO
ALTER TABLE [dbo].[tb_ir_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK4E44F56BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_ir_AUD] CHECK CONSTRAINT [FK4E44F56BDF74E053]
GO
ALTER TABLE [dbo].[tb_item_despesa]  WITH CHECK ADD  CONSTRAINT [FKBBEEBB1A19153F6C] FOREIGN KEY([fk_tipo_item_despesa])
REFERENCES [dbo].[tb_tipo_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_item_despesa] CHECK CONSTRAINT [FKBBEEBB1A19153F6C]
GO
ALTER TABLE [dbo].[tb_item_despesa]  WITH NOCHECK ADD  CONSTRAINT [FKBBEEBB1A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_item_despesa] CHECK CONSTRAINT [FKBBEEBB1A60877044]
GO
ALTER TABLE [dbo].[tb_item_despesa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK61B3CBEBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_item_despesa_AUD] CHECK CONSTRAINT [FK61B3CBEBDF74E053]
GO
ALTER TABLE [dbo].[tb_item_fator]  WITH NOCHECK ADD  CONSTRAINT [FKD125D10160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_item_fator] CHECK CONSTRAINT [FKD125D10160877044]
GO
ALTER TABLE [dbo].[tb_item_fator_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK380F9652DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_item_fator_AUD] CHECK CONSTRAINT [FK380F9652DF74E053]
GO
ALTER TABLE [dbo].[tb_item_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK69D6D98960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_item_porte_anestesia] CHECK CONSTRAINT [FK69D6D98960877044]
GO
ALTER TABLE [dbo].[tb_item_porte_anestesia_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK88791ADADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_item_porte_anestesia_AUD] CHECK CONSTRAINT [FK88791ADADF74E053]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse]  WITH NOCHECK ADD  CONSTRAINT [FKCCD6BFCD60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse] CHECK CONSTRAINT [FKCCD6BFCD60877044]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKD43F1EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_AUD] CHECK CONSTRAINT [FKD43F1EDF74E053]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB81015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB81015879C]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB8502D5D01] FOREIGN KEY([fk_lancamento_repasse])
REFERENCES [dbo].[tb_lancamento_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB8502D5D01]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB858D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB858D83D4E]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB860877044]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH CHECK ADD  CONSTRAINT [FKC418FAB87478478B] FOREIGN KEY([fk_cooperado_executante])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB87478478B]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB87784988C] FOREIGN KEY([fk_espelho])
REFERENCES [dbo].[tb_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB87784988C]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB87CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB87CDF5F6C]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB8A1F58F18] FOREIGN KEY([fk_entidade_usuario_cadastro])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB8A1F58F18]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB8ADBD5C14] FOREIGN KEY([fk_cooperado_recebedor_cobranca])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB8ADBD5C14]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB8B6C7DC79] FOREIGN KEY([fk_importacao_unimed])
REFERENCES [dbo].[tb_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB8B6C7DC79]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual]  WITH NOCHECK ADD  CONSTRAINT [FKC418FAB8E2E872EC] FOREIGN KEY([fk_fatura])
REFERENCES [dbo].[tb_fatura] ([id])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual] CHECK CONSTRAINT [FKC418FAB8E2E872EC]
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKC5590C89DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_lancamento_repasse_eventual_AUD] CHECK CONSTRAINT [FKC5590C89DF74E053]
GO
ALTER TABLE [dbo].[tb_linha_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK3229D9D560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_linha_importacao_base] CHECK CONSTRAINT [FK3229D9D560877044]
GO
ALTER TABLE [dbo].[tb_linha_importacao_base]  WITH CHECK ADD  CONSTRAINT [FK3229D9D5B1D25BC4] FOREIGN KEY([fk_importacao_base])
REFERENCES [dbo].[tb_importacao_base] ([id])
GO
ALTER TABLE [dbo].[tb_linha_importacao_base] CHECK CONSTRAINT [FK3229D9D5B1D25BC4]
GO
ALTER TABLE [dbo].[tb_linha_importacao_base_AUD]  WITH CHECK ADD  CONSTRAINT [FKF37B1526DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_linha_importacao_base_AUD] CHECK CONSTRAINT [FKF37B1526DF74E053]
GO
ALTER TABLE [dbo].[tb_local_atendimento]  WITH NOCHECK ADD  CONSTRAINT [FKE8AC936B60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_local_atendimento] CHECK CONSTRAINT [FKE8AC936B60877044]
GO
ALTER TABLE [dbo].[tb_local_atendimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKD03B13BCDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_local_atendimento_AUD] CHECK CONSTRAINT [FKD03B13BCDF74E053]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH CHECK ADD  CONSTRAINT [FK46246EC34344ADFA] FOREIGN KEY([fk_entidade_cooperado_despesa])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC34344ADFA]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH CHECK ADD  CONSTRAINT [FK46246EC34FC8B458] FOREIGN KEY([fk_entidade_cooperado_historico_tabela_honorario])
REFERENCES [dbo].[rl_entidadeconvenio_historico_tabela_honorario] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC34FC8B458]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK46246EC3577052BC] FOREIGN KEY([fk_item_porte_anestesia])
REFERENCES [dbo].[tb_item_porte_anestesia] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC3577052BC]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK46246EC360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC360877044]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK46246EC37E8BE890] FOREIGN KEY([fk_procedimento])
REFERENCES [dbo].[tb_procedimento] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC37E8BE890]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH CHECK ADD  CONSTRAINT [FK46246EC3BD05380D] FOREIGN KEY([fk_entidade_cconvenio_despesa])
REFERENCES [dbo].[tb_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC3BD05380D]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK46246EC3BF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC3BF1B1049]
GO
ALTER TABLE [dbo].[tb_memoria_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK46246EC3D8F58BF5] FOREIGN KEY([fk_entidade_convenio_historico_tabela_honorario])
REFERENCES [dbo].[rl_entidadeconvenio_historico_tabela_honorario] ([id])
GO
ALTER TABLE [dbo].[tb_memoria_calculo] CHECK CONSTRAINT [FK46246EC3D8F58BF5]
GO
ALTER TABLE [dbo].[tb_memoria_calculo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKAD258314DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_memoria_calculo_AUD] CHECK CONSTRAINT [FKAD258314DF74E053]
GO
ALTER TABLE [dbo].[tb_modulo]  WITH NOCHECK ADD  CONSTRAINT [FK54F11D6760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_modulo] CHECK CONSTRAINT [FK54F11D6760877044]
GO
ALTER TABLE [dbo].[tb_modulo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK12F23FB8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_modulo_AUD] CHECK CONSTRAINT [FK12F23FB8DF74E053]
GO
ALTER TABLE [dbo].[tb_motivo_diferenca]  WITH NOCHECK ADD  CONSTRAINT [FK9C80657760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_motivo_diferenca] CHECK CONSTRAINT [FK9C80657760877044]
GO
ALTER TABLE [dbo].[tb_motivo_diferenca_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF27EFFC8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_motivo_diferenca_AUD] CHECK CONSTRAINT [FKF27EFFC8DF74E053]
GO
ALTER TABLE [dbo].[tb_motivo_exclusao_guias]  WITH NOCHECK ADD  CONSTRAINT [FK5E2CF9D460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_motivo_exclusao_guias] CHECK CONSTRAINT [FK5E2CF9D460877044]
GO
ALTER TABLE [dbo].[tb_motivo_exclusao_guias_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK28E01DA5DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_motivo_exclusao_guias_AUD] CHECK CONSTRAINT [FK28E01DA5DF74E053]
GO
ALTER TABLE [dbo].[tb_nacionalidade]  WITH NOCHECK ADD  CONSTRAINT [FK507DD45360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_nacionalidade] CHECK CONSTRAINT [FK507DD45360877044]
GO
ALTER TABLE [dbo].[tb_nacionalidade_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7A31A0A4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_nacionalidade_AUD] CHECK CONSTRAINT [FK7A31A0A4DF74E053]
GO
ALTER TABLE [dbo].[tb_numero_prestador]  WITH CHECK ADD  CONSTRAINT [FK108B2CD81015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_numero_prestador] CHECK CONSTRAINT [FK108B2CD81015879C]
GO
ALTER TABLE [dbo].[tb_numero_prestador]  WITH CHECK ADD  CONSTRAINT [FK108B2CD82F4C728A] FOREIGN KEY([fk_hospital])
REFERENCES [dbo].[tb_hospital] ([id])
GO
ALTER TABLE [dbo].[tb_numero_prestador] CHECK CONSTRAINT [FK108B2CD82F4C728A]
GO
ALTER TABLE [dbo].[tb_numero_prestador]  WITH CHECK ADD  CONSTRAINT [FK108B2CD858D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_numero_prestador] CHECK CONSTRAINT [FK108B2CD858D83D4E]
GO
ALTER TABLE [dbo].[tb_numero_prestador]  WITH CHECK ADD  CONSTRAINT [FK108B2CD860877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_numero_prestador] CHECK CONSTRAINT [FK108B2CD860877044]
GO
ALTER TABLE [dbo].[tb_numero_prestador_AUD]  WITH CHECK ADD  CONSTRAINT [FK4B252EA9DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_numero_prestador_AUD] CHECK CONSTRAINT [FK4B252EA9DF74E053]
GO
ALTER TABLE [dbo].[tb_pagamento_espelho]  WITH CHECK ADD  CONSTRAINT [FKE3AD30C627B34B40] FOREIGN KEY([fk_entidade_dados_bancarios])
REFERENCES [dbo].[rl_entidade_dados_bancarios] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_espelho] CHECK CONSTRAINT [FKE3AD30C627B34B40]
GO
ALTER TABLE [dbo].[tb_pagamento_espelho]  WITH CHECK ADD  CONSTRAINT [FKE3AD30C660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_espelho] CHECK CONSTRAINT [FKE3AD30C660877044]
GO
ALTER TABLE [dbo].[tb_pagamento_espelho]  WITH CHECK ADD  CONSTRAINT [FKE3AD30C67784988C] FOREIGN KEY([fk_espelho])
REFERENCES [dbo].[tb_espelho] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_espelho] CHECK CONSTRAINT [FKE3AD30C67784988C]
GO
ALTER TABLE [dbo].[tb_pagamento_espelho]  WITH CHECK ADD  CONSTRAINT [FKE3AD30C67CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_espelho] CHECK CONSTRAINT [FKE3AD30C67CDF5F6C]
GO
ALTER TABLE [dbo].[tb_pagamento_espelho]  WITH CHECK ADD  CONSTRAINT [FKE3AD30C6BE0875D5] FOREIGN KEY([fk_entidade_usuario_criacao])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_espelho] CHECK CONSTRAINT [FKE3AD30C6BE0875D5]
GO
ALTER TABLE [dbo].[tb_pagamento_espelho_AUD]  WITH CHECK ADD  CONSTRAINT [FKF4A78B97DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_pagamento_espelho_AUD] CHECK CONSTRAINT [FKF4A78B97DF74E053]
GO
ALTER TABLE [dbo].[tb_pagamento_fatura]  WITH NOCHECK ADD  CONSTRAINT [FKE709289527B34B40] FOREIGN KEY([fk_entidade_dados_bancarios])
REFERENCES [dbo].[rl_entidade_dados_bancarios] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_fatura] CHECK CONSTRAINT [FKE709289527B34B40]
GO
ALTER TABLE [dbo].[tb_pagamento_fatura]  WITH NOCHECK ADD  CONSTRAINT [FKE709289560877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_fatura] CHECK CONSTRAINT [FKE709289560877044]
GO
ALTER TABLE [dbo].[tb_pagamento_fatura]  WITH NOCHECK ADD  CONSTRAINT [FKE70928957CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_fatura] CHECK CONSTRAINT [FKE70928957CDF5F6C]
GO
ALTER TABLE [dbo].[tb_pagamento_fatura]  WITH NOCHECK ADD  CONSTRAINT [FKE7092895BE0875D5] FOREIGN KEY([fk_entidade_usuario_criacao])
REFERENCES [dbo].[rl_entidade_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_fatura] CHECK CONSTRAINT [FKE7092895BE0875D5]
GO
ALTER TABLE [dbo].[tb_pagamento_fatura]  WITH NOCHECK ADD  CONSTRAINT [FKE7092895E2E872EC] FOREIGN KEY([fk_fatura])
REFERENCES [dbo].[tb_fatura] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_fatura] CHECK CONSTRAINT [FKE7092895E2E872EC]
GO
ALTER TABLE [dbo].[tb_pagamento_fatura_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK769503E6DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_pagamento_fatura_AUD] CHECK CONSTRAINT [FK769503E6DF74E053]
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FK8F0CD02760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento] CHECK CONSTRAINT [FK8F0CD02760877044]
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FK8F0CD0277E8BE890] FOREIGN KEY([fk_procedimento])
REFERENCES [dbo].[tb_procedimento] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento] CHECK CONSTRAINT [FK8F0CD0277E8BE890]
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FK8F0CD027E2E872EC] FOREIGN KEY([fk_fatura])
REFERENCES [dbo].[tb_fatura] ([id])
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento] CHECK CONSTRAINT [FK8F0CD027E2E872EC]
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK9E769278DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_pagamento_procedimento_AUD] CHECK CONSTRAINT [FK9E769278DF74E053]
GO
ALTER TABLE [dbo].[tb_pais]  WITH CHECK ADD  CONSTRAINT [FKA4FCE20C60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_pais] CHECK CONSTRAINT [FKA4FCE20C60877044]
GO
ALTER TABLE [dbo].[tb_pais_AUD]  WITH CHECK ADD  CONSTRAINT [FK389129DDDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_pais_AUD] CHECK CONSTRAINT [FK389129DDDF74E053]
GO
ALTER TABLE [dbo].[tb_parametriza_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK978A6107700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_parametriza_digitacao] CHECK CONSTRAINT [FK978A6107700F167]
GO
ALTER TABLE [dbo].[tb_parametriza_digitacao]  WITH NOCHECK ADD  CONSTRAINT [FK978A6107EA995586] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_parametriza_digitacao] CHECK CONSTRAINT [FK978A6107EA995586]
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial]  WITH NOCHECK ADD  CONSTRAINT [FK372136C947F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial] CHECK CONSTRAINT [FK372136C947F1200E]
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial]  WITH NOCHECK ADD  CONSTRAINT [FK372136C960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial] CHECK CONSTRAINT [FK372136C960877044]
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial]  WITH NOCHECK ADD  CONSTRAINT [FK372136C9AD1A233A] FOREIGN KEY([fk_composicao_servico_especial])
REFERENCES [dbo].[tb_composicao_servico_especial] ([id])
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial] CHECK CONSTRAINT [FK372136C9AD1A233A]
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKC2D2D81ADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_participantes_composicao_servico_especial_AUD] CHECK CONSTRAINT [FKC2D2D81ADF74E053]
GO
ALTER TABLE [dbo].[tb_perfil_acesso]  WITH NOCHECK ADD  CONSTRAINT [FK6292106E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_perfil_acesso] CHECK CONSTRAINT [FK6292106E60877044]
GO
ALTER TABLE [dbo].[tb_perfil_acesso_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKB144573FDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_perfil_acesso_AUD] CHECK CONSTRAINT [FKB144573FDF74E053]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FK1EFA671147F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento] CHECK CONSTRAINT [FK1EFA671147F1200E]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FK1EFA671158D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento] CHECK CONSTRAINT [FK1EFA671158D83D4E]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FK1EFA671160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento] CHECK CONSTRAINT [FK1EFA671160877044]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FK1EFA67117E8BE890] FOREIGN KEY([fk_procedimento])
REFERENCES [dbo].[tb_procedimento] ([id])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento] CHECK CONSTRAINT [FK1EFA67117E8BE890]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento]  WITH CHECK ADD  CONSTRAINT [FK1EFA6711B6C7DC79] FOREIGN KEY([fk_importacao_unimed])
REFERENCES [dbo].[tb_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento] CHECK CONSTRAINT [FK1EFA6711B6C7DC79]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FK1EFA6711E53AB0BC] FOREIGN KEY([fk_importacao])
REFERENCES [dbo].[tb_importacao_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento] CHECK CONSTRAINT [FK1EFA6711E53AB0BC]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento]  WITH NOCHECK ADD  CONSTRAINT [FK1EFA6711F13A7D20] FOREIGN KEY([fk_lancamento_repasse_eventual])
REFERENCES [dbo].[tb_lancamento_repasse_eventual] ([id])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento] CHECK CONSTRAINT [FK1EFA6711F13A7D20]
GO
ALTER TABLE [dbo].[tb_plantao_lancamento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKBE8AA462DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_plantao_lancamento_AUD] CHECK CONSTRAINT [FKBE8AA462DF74E053]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B3577052BC] FOREIGN KEY([fk_item_porte_anestesia])
REFERENCES [dbo].[tb_item_porte_anestesia] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B3577052BC]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B35DE6FFDC] FOREIGN KEY([fk_edicao_fator_porte])
REFERENCES [dbo].[tb_edicao_fator_porte] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B35DE6FFDC]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B360877044]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B364B0BC11] FOREIGN KEY([fk_entidadeconvenio_complemento])
REFERENCES [dbo].[rl_entidadeconvenio_complemento] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B364B0BC11]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B3700F167] FOREIGN KEY([fk_entidade_convenio])
REFERENCES [dbo].[rl_entidade_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B3700F167]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B3892ABB48] FOREIGN KEY([fk_edicao_tabela_honorarios])
REFERENCES [dbo].[tb_edicao_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B3892ABB48]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B3B2E2BD57] FOREIGN KEY([fk_item_fator])
REFERENCES [dbo].[tb_item_fator] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B3B2E2BD57]
GO
ALTER TABLE [dbo].[tb_porte_anestesia]  WITH NOCHECK ADD  CONSTRAINT [FK7A1359B3EE8B9F22] FOREIGN KEY([fk_fator])
REFERENCES [dbo].[tb_fator] ([id])
GO
ALTER TABLE [dbo].[tb_porte_anestesia] CHECK CONSTRAINT [FK7A1359B3EE8B9F22]
GO
ALTER TABLE [dbo].[tb_porte_anestesia_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK28C57604DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_porte_anestesia_AUD] CHECK CONSTRAINT [FK28C57604DF74E053]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EE3C70DF08] FOREIGN KEY([fk_procedimento_detalhar_unimed])
REFERENCES [dbo].[tb_procedimento_detalhar_unimed] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EE3C70DF08]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EE45C7B0B6] FOREIGN KEY([fk_entidade_cooperado_especialidade])
REFERENCES [dbo].[rl_entidadecooperado_especialidade] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EE45C7B0B6]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EE60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EE60877044]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EE8B6715CA] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EE8B6715CA]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EE961D55] FOREIGN KEY([fk_cooperado_executante_complemento])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EE961D55]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEADBD5C14] FOREIGN KEY([fk_cooperado_recebedor_cobranca])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEADBD5C14]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEB22E4BE7] FOREIGN KEY([fk_tecnica])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEB22E4BE7]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEBF1B1049] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEBF1B1049]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEC097B6AD] FOREIGN KEY([fk_via_acesso])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEC097B6AD]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEC1CEB104] FOREIGN KEY([fk_complexidade])
REFERENCES [dbo].[tb_complexidade] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEC1CEB104]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEC588FC85] FOREIGN KEY([fk_grau_participacao])
REFERENCES [dbo].[rl_entidade_grau_participacao] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEC588FC85]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EED0F1DDBB] FOREIGN KEY([fk_unidade_medida])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EED0F1DDBB]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EED2FAA0AD] FOREIGN KEY([fk_tipo_guia])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EED2FAA0AD]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EED439C6F] FOREIGN KEY([fk_cooperado_recebedor_cobranca_anterior])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EED439C6F]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEE7CE6755] FOREIGN KEY([fk_acomodacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEE7CE6755]
GO
ALTER TABLE [dbo].[tb_procedimento]  WITH NOCHECK ADD  CONSTRAINT [FKFDF3F4EEFDBC3F96] FOREIGN KEY([fk_procedimento_tuss])
REFERENCES [dbo].[tb_tabela_tiss_versao_codigo] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento] CHECK CONSTRAINT [FKFDF3F4EEFDBC3F96]
GO
ALTER TABLE [dbo].[tb_procedimento_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK481FFBBFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_procedimento_AUD] CHECK CONSTRAINT [FK481FFBBFDF74E053]
GO
ALTER TABLE [dbo].[tb_procedimento_detalhar_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK745A37EF60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_detalhar_unimed] CHECK CONSTRAINT [FK745A37EF60877044]
GO
ALTER TABLE [dbo].[tb_procedimento_detalhar_unimed]  WITH NOCHECK ADD  CONSTRAINT [FK745A37EF88E36A36] FOREIGN KEY([fk_usuario_cadastro])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_detalhar_unimed] CHECK CONSTRAINT [FK745A37EF88E36A36]
GO
ALTER TABLE [dbo].[tb_procedimento_detalhar_unimed_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKCBBAD640DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_procedimento_detalhar_unimed_AUD] CHECK CONSTRAINT [FKCBBAD640DF74E053]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA50245C7B0B6] FOREIGN KEY([fk_entidade_cooperado_especialidade])
REFERENCES [dbo].[rl_entidadecooperado_especialidade] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA50245C7B0B6]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA5026841F9FA] FOREIGN KEY([fk_item_despesa])
REFERENCES [dbo].[tb_item_despesa_integracao] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA5026841F9FA]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA5028B00F5FB] FOREIGN KEY([fk_atendimento])
REFERENCES [dbo].[tb_atendimento_integracao] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA5028B00F5FB]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502961D55] FOREIGN KEY([fk_cooperado_executante_complemento])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502961D55]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502ADBD5C14] FOREIGN KEY([fk_cooperado_recebedor_cobranca])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502ADBD5C14]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502B22E4BE7] FOREIGN KEY([fk_tecnica])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502B22E4BE7]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502C097B6AD] FOREIGN KEY([fk_via_acesso])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502C097B6AD]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502C588FC85] FOREIGN KEY([fk_grau_participacao])
REFERENCES [dbo].[rl_entidade_grau_participacao] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502C588FC85]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502D0F1DDBB] FOREIGN KEY([fk_unidade_medida])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502D0F1DDBB]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502D2FAA0AD] FOREIGN KEY([fk_tipo_guia])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502D2FAA0AD]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502D439C6F] FOREIGN KEY([fk_cooperado_recebedor_cobranca_anterior])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502D439C6F]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502E7CE6755] FOREIGN KEY([fk_acomodacao])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502E7CE6755]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK246DA502FDBC3F96] FOREIGN KEY([fk_procedimento_tuss])
REFERENCES [dbo].[tb_tabela_tiss_versao_codigo] ([id])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao] CHECK CONSTRAINT [FK246DA502FDBC3F96]
GO
ALTER TABLE [dbo].[tb_procedimento_integracao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK3B5B81D3DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_procedimento_integracao_AUD] CHECK CONSTRAINT [FK3B5B81D3DF74E053]
GO
ALTER TABLE [dbo].[tb_processamento_dirf]  WITH CHECK ADD  CONSTRAINT [FK2E0CF0EA58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_processamento_dirf] CHECK CONSTRAINT [FK2E0CF0EA58D83D4E]
GO
ALTER TABLE [dbo].[tb_processamento_dirf]  WITH CHECK ADD  CONSTRAINT [FK2E0CF0EA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_processamento_dirf] CHECK CONSTRAINT [FK2E0CF0EA60877044]
GO
ALTER TABLE [dbo].[tb_processamento_dirf]  WITH CHECK ADD  CONSTRAINT [FK2E0CF0EA62870C08] FOREIGN KEY([fk_dirf])
REFERENCES [dbo].[tb_dirf] ([id])
GO
ALTER TABLE [dbo].[tb_processamento_dirf] CHECK CONSTRAINT [FK2E0CF0EA62870C08]
GO
ALTER TABLE [dbo].[tb_processamento_dirf_AUD]  WITH CHECK ADD  CONSTRAINT [FK8B2299BBDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_processamento_dirf_AUD] CHECK CONSTRAINT [FK8B2299BBDF74E053]
GO
ALTER TABLE [dbo].[tb_recolhimento_inss]  WITH CHECK ADD  CONSTRAINT [FKED55C21047F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_recolhimento_inss] CHECK CONSTRAINT [FKED55C21047F1200E]
GO
ALTER TABLE [dbo].[tb_recolhimento_inss]  WITH CHECK ADD  CONSTRAINT [FKED55C21058D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_recolhimento_inss] CHECK CONSTRAINT [FKED55C21058D83D4E]
GO
ALTER TABLE [dbo].[tb_recolhimento_inss]  WITH CHECK ADD  CONSTRAINT [FKED55C21060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_recolhimento_inss] CHECK CONSTRAINT [FKED55C21060877044]
GO
ALTER TABLE [dbo].[tb_recolhimento_inss]  WITH CHECK ADD  CONSTRAINT [FKED55C2107CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_recolhimento_inss] CHECK CONSTRAINT [FKED55C2107CDF5F6C]
GO
ALTER TABLE [dbo].[tb_recolhimento_inss_AUD]  WITH CHECK ADD  CONSTRAINT [FKE9B267E1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_recolhimento_inss_AUD] CHECK CONSTRAINT [FKE9B267E1DF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_1]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113DA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_1] CHECK CONSTRAINT [FKAD0113DA60877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_1_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5C6BC4ABDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_1_AUD] CHECK CONSTRAINT [FK5C6BC4ABDF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_2]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113DB60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_2] CHECK CONSTRAINT [FKAD0113DB60877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_2_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5C79DC2CDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_2_AUD] CHECK CONSTRAINT [FK5C79DC2CDF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_3]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113DC60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_3] CHECK CONSTRAINT [FKAD0113DC60877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_3_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5C87F3ADDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_3_AUD] CHECK CONSTRAINT [FK5C87F3ADDF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_4]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113DD60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_4] CHECK CONSTRAINT [FKAD0113DD60877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_4_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5C960B2EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_4_AUD] CHECK CONSTRAINT [FK5C960B2EDF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_5]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113DE60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_5] CHECK CONSTRAINT [FKAD0113DE60877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_5_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CA422AFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_5_AUD] CHECK CONSTRAINT [FK5CA422AFDF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_6]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113DF60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_6] CHECK CONSTRAINT [FKAD0113DF60877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_6_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CB23A30DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_6_AUD] CHECK CONSTRAINT [FK5CB23A30DF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_7]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113E060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_7] CHECK CONSTRAINT [FKAD0113E060877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_7_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CC051B1DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_7_AUD] CHECK CONSTRAINT [FK5CC051B1DF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_8]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113E160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_8] CHECK CONSTRAINT [FKAD0113E160877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_8_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CCE6932DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_8_AUD] CHECK CONSTRAINT [FK5CCE6932DF74E053]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_9]  WITH NOCHECK ADD  CONSTRAINT [FKAD0113E260877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_9] CHECK CONSTRAINT [FKAD0113E260877044]
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_9_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK5CDC80B3DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_registro_importacao_unimed_tipo_9_AUD] CHECK CONSTRAINT [FK5CDC80B3DF74E053]
GO
ALTER TABLE [dbo].[tb_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK41415F5058D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_repasse] CHECK CONSTRAINT [FK41415F5058D83D4E]
GO
ALTER TABLE [dbo].[tb_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK41415F5060877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_repasse] CHECK CONSTRAINT [FK41415F5060877044]
GO
ALTER TABLE [dbo].[tb_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK41415F508EA1E457] FOREIGN KEY([fk_usuario_confirmacao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_repasse] CHECK CONSTRAINT [FK41415F508EA1E457]
GO
ALTER TABLE [dbo].[tb_repasse]  WITH NOCHECK ADD  CONSTRAINT [FK41415F50DE2CA4F1] FOREIGN KEY([fk_usuario_criacao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_repasse] CHECK CONSTRAINT [FK41415F50DE2CA4F1]
GO
ALTER TABLE [dbo].[tb_repasse_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF80D6521DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_repasse_AUD] CHECK CONSTRAINT [FKF80D6521DF74E053]
GO
ALTER TABLE [dbo].[tb_repasse_inconsistencia]  WITH NOCHECK ADD  CONSTRAINT [FK51E0E5CD60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_repasse_inconsistencia] CHECK CONSTRAINT [FK51E0E5CD60877044]
GO
ALTER TABLE [dbo].[tb_repasse_inconsistencia]  WITH NOCHECK ADD  CONSTRAINT [FK51E0E5CD7CDF5F6C] FOREIGN KEY([fk_repasse])
REFERENCES [dbo].[tb_repasse] ([id])
GO
ALTER TABLE [dbo].[tb_repasse_inconsistencia] CHECK CONSTRAINT [FK51E0E5CD7CDF5F6C]
GO
ALTER TABLE [dbo].[tb_repasse_inconsistencia_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK85B651EDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_repasse_inconsistencia_AUD] CHECK CONSTRAINT [FK85B651EDF74E053]
GO
ALTER TABLE [dbo].[tb_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK40D45E6E1015879C] FOREIGN KEY([fk_convenio])
REFERENCES [dbo].[tb_convenio] ([id])
GO
ALTER TABLE [dbo].[tb_retorno_convenio] CHECK CONSTRAINT [FK40D45E6E1015879C]
GO
ALTER TABLE [dbo].[tb_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK40D45E6E570416C6] FOREIGN KEY([fk_usuario_processamento])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_retorno_convenio] CHECK CONSTRAINT [FK40D45E6E570416C6]
GO
ALTER TABLE [dbo].[tb_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK40D45E6E58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_retorno_convenio] CHECK CONSTRAINT [FK40D45E6E58D83D4E]
GO
ALTER TABLE [dbo].[tb_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK40D45E6E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_retorno_convenio] CHECK CONSTRAINT [FK40D45E6E60877044]
GO
ALTER TABLE [dbo].[tb_retorno_convenio]  WITH CHECK ADD  CONSTRAINT [FK40D45E6EA4C9B05A] FOREIGN KEY([fk_usuario_envio])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_retorno_convenio] CHECK CONSTRAINT [FK40D45E6EA4C9B05A]
GO
ALTER TABLE [dbo].[tb_retorno_convenio_AUD]  WITH CHECK ADD  CONSTRAINT [FKE9AFA53FDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_retorno_convenio_AUD] CHECK CONSTRAINT [FKE9AFA53FDF74E053]
GO
ALTER TABLE [dbo].[tb_rotina_sistema]  WITH CHECK ADD  CONSTRAINT [FKFC4C6C79287FCB22] FOREIGN KEY([fk_usuario_inicio])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_rotina_sistema] CHECK CONSTRAINT [FKFC4C6C79287FCB22]
GO
ALTER TABLE [dbo].[tb_rotina_sistema]  WITH CHECK ADD  CONSTRAINT [FKFC4C6C7958D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_rotina_sistema] CHECK CONSTRAINT [FKFC4C6C7958D83D4E]
GO
ALTER TABLE [dbo].[tb_rotina_sistema]  WITH CHECK ADD  CONSTRAINT [FKFC4C6C7960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_rotina_sistema] CHECK CONSTRAINT [FKFC4C6C7960877044]
GO
ALTER TABLE [dbo].[tb_rotina_sistema]  WITH CHECK ADD  CONSTRAINT [FKFC4C6C79D33E16D1] FOREIGN KEY([fk_usuario_fim])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_rotina_sistema] CHECK CONSTRAINT [FKFC4C6C79D33E16D1]
GO
ALTER TABLE [dbo].[tb_rotina_sistema_AUD]  WITH CHECK ADD  CONSTRAINT [FKEF0BB5CADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_rotina_sistema_AUD] CHECK CONSTRAINT [FKEF0BB5CADF74E053]
GO
ALTER TABLE [dbo].[tb_sefip]  WITH NOCHECK ADD  CONSTRAINT [FKFACB6B6A58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_sefip] CHECK CONSTRAINT [FKFACB6B6A58D83D4E]
GO
ALTER TABLE [dbo].[tb_sefip]  WITH NOCHECK ADD  CONSTRAINT [FKFACB6B6A60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_sefip] CHECK CONSTRAINT [FKFACB6B6A60877044]
GO
ALTER TABLE [dbo].[tb_sefip_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK871FD43BDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_sefip_AUD] CHECK CONSTRAINT [FK871FD43BDF74E053]
GO
ALTER TABLE [dbo].[tb_situacao_cooperado]  WITH CHECK ADD  CONSTRAINT [FK6651C88B60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_situacao_cooperado] CHECK CONSTRAINT [FK6651C88B60877044]
GO
ALTER TABLE [dbo].[tb_situacao_cooperado_AUD]  WITH CHECK ADD  CONSTRAINT [FKE000B8DCDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_situacao_cooperado_AUD] CHECK CONSTRAINT [FKE000B8DCDF74E053]
GO
ALTER TABLE [dbo].[tb_situacao_glosa]  WITH NOCHECK ADD  CONSTRAINT [FKED0AEF5160877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_situacao_glosa] CHECK CONSTRAINT [FKED0AEF5160877044]
GO
ALTER TABLE [dbo].[tb_situacao_glosa_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK849D0CA2DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_situacao_glosa_AUD] CHECK CONSTRAINT [FK849D0CA2DF74E053]
GO
ALTER TABLE [dbo].[tb_sobra_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK11CA130C60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_sobra_integracao] CHECK CONSTRAINT [FK11CA130C60877044]
GO
ALTER TABLE [dbo].[tb_sobra_integracao]  WITH NOCHECK ADD  CONSTRAINT [FK11CA130CFA9846B0] FOREIGN KEY([fk_integracao_sus])
REFERENCES [dbo].[tb_integracao_sus] ([id])
GO
ALTER TABLE [dbo].[tb_sobra_integracao] CHECK CONSTRAINT [FK11CA130CFA9846B0]
GO
ALTER TABLE [dbo].[tb_sobra_integracao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK295DDADDDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_sobra_integracao_AUD] CHECK CONSTRAINT [FK295DDADDDF74E053]
GO
ALTER TABLE [dbo].[tb_tabela_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK91C5BADA58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_calculo] CHECK CONSTRAINT [FK91C5BADA58D83D4E]
GO
ALTER TABLE [dbo].[tb_tabela_calculo]  WITH NOCHECK ADD  CONSTRAINT [FK91C5BADA60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_calculo] CHECK CONSTRAINT [FK91C5BADA60877044]
GO
ALTER TABLE [dbo].[tb_tabela_calculo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK7084EBABDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tabela_calculo_AUD] CHECK CONSTRAINT [FK7084EBABDF74E053]
GO
ALTER TABLE [dbo].[tb_tabela_honorarios]  WITH CHECK ADD  CONSTRAINT [FKD70EF01B58D83D4E] FOREIGN KEY([fk_entidade])
REFERENCES [dbo].[tb_entidade] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_honorarios] CHECK CONSTRAINT [FKD70EF01B58D83D4E]
GO
ALTER TABLE [dbo].[tb_tabela_honorarios]  WITH NOCHECK ADD  CONSTRAINT [FKD70EF01B60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_honorarios] CHECK CONSTRAINT [FKD70EF01B60877044]
GO
ALTER TABLE [dbo].[tb_tabela_honorarios]  WITH CHECK ADD  CONSTRAINT [FKD70EF01BEE6A0623] FOREIGN KEY([fk_tabela_honorarios_original])
REFERENCES [dbo].[tb_tabela_honorarios] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_honorarios] CHECK CONSTRAINT [FKD70EF01BEE6A0623]
GO
ALTER TABLE [dbo].[tb_tabela_honorarios_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKD7BF986CDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tabela_honorarios_AUD] CHECK CONSTRAINT [FKD7BF986CDF74E053]
GO
ALTER TABLE [dbo].[tb_tabela_tiss]  WITH NOCHECK ADD  CONSTRAINT [FK432A665E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_tiss] CHECK CONSTRAINT [FK432A665E60877044]
GO
ALTER TABLE [dbo].[tb_tabela_tiss]  WITH CHECK ADD  CONSTRAINT [FK432A665E859FFB6A] FOREIGN KEY([fk_unidade_federativa_fencom])
REFERENCES [dbo].[tb_uf_fencom] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_tiss] CHECK CONSTRAINT [FK432A665E859FFB6A]
GO
ALTER TABLE [dbo].[tb_tabela_tiss]  WITH NOCHECK ADD  CONSTRAINT [FK432A665E9261031F] FOREIGN KEY([fk_relacao_tuss])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_tiss] CHECK CONSTRAINT [FK432A665E9261031F]
GO
ALTER TABLE [dbo].[tb_tabela_tiss]  WITH NOCHECK ADD  CONSTRAINT [FK432A665EE754A9A8] FOREIGN KEY([fk_tipo_tabela_tiss])
REFERENCES [dbo].[tb_tipo_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_tiss] CHECK CONSTRAINT [FK432A665EE754A9A8]
GO
ALTER TABLE [dbo].[tb_tabela_tiss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK40E0352FDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tabela_tiss_AUD] CHECK CONSTRAINT [FK40E0352FDF74E053]
GO
ALTER TABLE [dbo].[tb_tabela_tiss_versao_codigo]  WITH NOCHECK ADD  CONSTRAINT [FK3B6AE87960877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_tiss_versao_codigo] CHECK CONSTRAINT [FK3B6AE87960877044]
GO
ALTER TABLE [dbo].[tb_tabela_tiss_versao_codigo]  WITH NOCHECK ADD  CONSTRAINT [FK3B6AE8797912C92B] FOREIGN KEY([fk_tabela_tiss])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_tabela_tiss_versao_codigo] CHECK CONSTRAINT [FK3B6AE8797912C92B]
GO
ALTER TABLE [dbo].[tb_tabela_tiss_versao_codigo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK428C31CADF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tabela_tiss_versao_codigo_AUD] CHECK CONSTRAINT [FK428C31CADF74E053]
GO
ALTER TABLE [dbo].[tb_termo_aditivo]  WITH NOCHECK ADD  CONSTRAINT [FK6D11CEC760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_termo_aditivo] CHECK CONSTRAINT [FK6D11CEC760877044]
GO
ALTER TABLE [dbo].[tb_termo_aditivo_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKDE9B4118DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_termo_aditivo_AUD] CHECK CONSTRAINT [FKDE9B4118DF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_empresa]  WITH CHECK ADD  CONSTRAINT [FK94D184AF60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_empresa] CHECK CONSTRAINT [FK94D184AF60877044]
GO
ALTER TABLE [dbo].[tb_tipo_empresa_AUD]  WITH CHECK ADD  CONSTRAINT [FK123DC300DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_empresa_AUD] CHECK CONSTRAINT [FK123DC300DF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK2519A86360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_endereco] CHECK CONSTRAINT [FK2519A86360877044]
GO
ALTER TABLE [dbo].[tb_tipo_endereco_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK35A4ECB4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_endereco_AUD] CHECK CONSTRAINT [FK35A4ECB4DF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_espelho]  WITH CHECK ADD  CONSTRAINT [FK9F08C89660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_espelho] CHECK CONSTRAINT [FK9F08C89660877044]
GO
ALTER TABLE [dbo].[tb_tipo_espelho_AUD]  WITH CHECK ADD  CONSTRAINT [FKE5D2BB67DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_espelho_AUD] CHECK CONSTRAINT [FKE5D2BB67DF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_item_despesa]  WITH CHECK ADD  CONSTRAINT [FK8142608360877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_item_despesa] CHECK CONSTRAINT [FK8142608360877044]
GO
ALTER TABLE [dbo].[tb_tipo_item_despesa_AUD]  WITH CHECK ADD  CONSTRAINT [FK607494D4DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_item_despesa_AUD] CHECK CONSTRAINT [FK607494D4DF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_logradouro]  WITH NOCHECK ADD  CONSTRAINT [FK51E14A8E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_logradouro] CHECK CONSTRAINT [FK51E14A8E60877044]
GO
ALTER TABLE [dbo].[tb_tipo_logradouro_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK9429815FDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_logradouro_AUD] CHECK CONSTRAINT [FK9429815FDF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_movimentacao]  WITH CHECK ADD  CONSTRAINT [FK91F9C89D2A8C7A43] FOREIGN KEY([fk_situacao_cooperado])
REFERENCES [dbo].[tb_situacao_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_movimentacao] CHECK CONSTRAINT [FK91F9C89D2A8C7A43]
GO
ALTER TABLE [dbo].[tb_tipo_movimentacao]  WITH NOCHECK ADD  CONSTRAINT [FK91F9C89D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_movimentacao] CHECK CONSTRAINT [FK91F9C89D60877044]
GO
ALTER TABLE [dbo].[tb_tipo_movimentacao_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF8A65FEEDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_movimentacao_AUD] CHECK CONSTRAINT [FKF8A65FEEDF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_pendencia]  WITH NOCHECK ADD  CONSTRAINT [FK44B7F28D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_pendencia] CHECK CONSTRAINT [FK44B7F28D60877044]
GO
ALTER TABLE [dbo].[tb_tipo_pendencia_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK6B5E11DEDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_pendencia_AUD] CHECK CONSTRAINT [FK6B5E11DEDF74E053]
GO
ALTER TABLE [dbo].[tb_tipo_procedimento]  WITH CHECK ADD  CONSTRAINT [FKC3479A5760877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tipo_procedimento] CHECK CONSTRAINT [FKC3479A5760877044]
GO
ALTER TABLE [dbo].[tb_tipo_procedimento_AUD]  WITH CHECK ADD  CONSTRAINT [FK46E0C4A8DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tipo_procedimento_AUD] CHECK CONSTRAINT [FK46E0C4A8DF74E053]
GO
ALTER TABLE [dbo].[tb_tiss]  WITH NOCHECK ADD  CONSTRAINT [FKA4FED2C660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_tiss] CHECK CONSTRAINT [FKA4FED2C660877044]
GO
ALTER TABLE [dbo].[tb_tiss]  WITH NOCHECK ADD  CONSTRAINT [FKA4FED2C6A5D0FE8D] FOREIGN KEY([fk_origem])
REFERENCES [dbo].[tb_identificacao_transacao] ([id])
GO
ALTER TABLE [dbo].[tb_tiss] CHECK CONSTRAINT [FKA4FED2C6A5D0FE8D]
GO
ALTER TABLE [dbo].[tb_tiss]  WITH NOCHECK ADD  CONSTRAINT [FKA4FED2C6F95DF3B8] FOREIGN KEY([fk_destino])
REFERENCES [dbo].[tb_identificacao_transacao] ([id])
GO
ALTER TABLE [dbo].[tb_tiss] CHECK CONSTRAINT [FKA4FED2C6F95DF3B8]
GO
ALTER TABLE [dbo].[tb_tiss_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK90582D97DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_tiss_AUD] CHECK CONSTRAINT [FK90582D97DF74E053]
GO
ALTER TABLE [dbo].[tb_total_inss_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK45F097C447F1200E] FOREIGN KEY([fk_cooperado])
REFERENCES [dbo].[tb_cooperado] ([id])
GO
ALTER TABLE [dbo].[tb_total_inss_cooperado] CHECK CONSTRAINT [FK45F097C447F1200E]
GO
ALTER TABLE [dbo].[tb_total_inss_cooperado]  WITH NOCHECK ADD  CONSTRAINT [FK45F097C460877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_total_inss_cooperado] CHECK CONSTRAINT [FK45F097C460877044]
GO
ALTER TABLE [dbo].[tb_total_inss_cooperado_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK28C34395DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_total_inss_cooperado_AUD] CHECK CONSTRAINT [FK28C34395DF74E053]
GO
ALTER TABLE [dbo].[tb_uf_fencom]  WITH NOCHECK ADD  CONSTRAINT [FK9F8C086F60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_uf_fencom] CHECK CONSTRAINT [FK9F8C086F60877044]
GO
ALTER TABLE [dbo].[tb_uf_fencom_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK709066C0DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_uf_fencom_AUD] CHECK CONSTRAINT [FK709066C0DF74E053]
GO
ALTER TABLE [dbo].[tb_url]  WITH NOCHECK ADD  CONSTRAINT [FKCB841C1E60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_url] CHECK CONSTRAINT [FKCB841C1E60877044]
GO
ALTER TABLE [dbo].[tb_url]  WITH NOCHECK ADD  CONSTRAINT [FKCB841C1ED07DAF27] FOREIGN KEY([fk_caso_de_uso])
REFERENCES [dbo].[tb_caso_de_uso] ([id])
GO
ALTER TABLE [dbo].[tb_url] CHECK CONSTRAINT [FKCB841C1ED07DAF27]
GO
ALTER TABLE [dbo].[tb_url_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKF5E90AEFDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_url_AUD] CHECK CONSTRAINT [FKF5E90AEFDF74E053]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FKF81E5A5D333DA341] FOREIGN KEY([fk_uf])
REFERENCES [dbo].[tb_tabela_tiss] ([id])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FKF81E5A5D333DA341]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH NOCHECK ADD  CONSTRAINT [FKF81E5A5D60877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FKF81E5A5D60877044]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH NOCHECK ADD  CONSTRAINT [FKF81E5A5D72D78072] FOREIGN KEY([fk_nacionalidade])
REFERENCES [dbo].[tb_nacionalidade] ([id])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FKF81E5A5D72D78072]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH NOCHECK ADD  CONSTRAINT [FKF81E5A5DC2CAD43E] FOREIGN KEY([fk_uf])
REFERENCES [dbo].[tb_uf_fencom] ([id])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FKF81E5A5DC2CAD43E]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FKF81E5A5DF5FAE103] FOREIGN KEY([fk_usuario_alteracao_senha])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FKF81E5A5DF5FAE103]
GO
ALTER TABLE [dbo].[tb_usuario_AUD]  WITH NOCHECK ADD  CONSTRAINT [FKB2AC11AEDF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_usuario_AUD] CHECK CONSTRAINT [FKB2AC11AEDF74E053]
GO
ALTER TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK87CFEF5647C26373] FOREIGN KEY([fk_tipo_endereco])
REFERENCES [dbo].[tb_tipo_endereco] ([id])
GO
ALTER TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco] CHECK CONSTRAINT [FK87CFEF5647C26373]
GO
ALTER TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco]  WITH NOCHECK ADD  CONSTRAINT [FK87CFEF5660877044] FOREIGN KEY([fk_usuario_ultima_alteracao])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco] CHECK CONSTRAINT [FK87CFEF5660877044]
GO
ALTER TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco_AUD]  WITH NOCHECK ADD  CONSTRAINT [FK35288227DF74E053] FOREIGN KEY([REV])
REFERENCES [dbo].[REVINFO] ([REV])
GO
ALTER TABLE [dbo].[tb_vinculo_tipo_pessoa_endereco_AUD] CHECK CONSTRAINT [FK35288227DF74E053]
GO
/****** Object:  StoredProcedure [dbo].[ConsultaRelacionamentos]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      <Alexandre Vilela>
-- Create date: <01/04/2015>
-- Description: <Retorna relacionamentos>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultaRelacionamentos]
                 @Tabela varchar(60),
                 @id varchar (20)
AS
BEGIN
    SET NOCOUNT ON;

DECLARE @NOME_TABELA VARCHAR(255)
DECLARE @NOME_COLUNA VARCHAR(255)
DECLARE @COMANDO1 VARCHAR(MAX)
DECLARE @COUNT_VINCULO INT = 0
DECLARE @SQL VARCHAR(MAX)

DECLARE @TABELA1
  TABLE ([NOME_TABELA]          [varchar](100),
         [NOME_COLUNA]          [varchar](100),
         [TOTAL_RELACIONAMENTO] [INT]
        )

DECLARE CURSOR_FK
CURSOR FOR (SELECT KCU1.TABLE_NAME,
                   KCU1.COLUMN_NAME
              FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
              JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU1    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG
                                                              AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
                                                              AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
              JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU2    ON KCU2.CONSTRAINT_CATALOG = RC.UNIQUE_CONSTRAINT_CATALOG
                                                              AND KCU2.CONSTRAINT_SCHEMA = RC.UNIQUE_CONSTRAINT_SCHEMA
                                                              AND KCU2.CONSTRAINT_NAME = RC.UNIQUE_CONSTRAINT_NAME
                                                              AND KCU2.ORDINAL_POSITION = KCU1.ORDINAL_POSITION
              JOIN sys.foreign_keys FK                         ON FK.NAME = KCU1.CONSTRAINT_NAME
             WHERE kcu2.TABLE_NAME = @tabela)
OPEN CURSOR_FK
FETCH NEXT FROM CURSOR_FK INTO @nome_tabela, @nome_coluna
WHILE @@FETCH_STATUS = 0
BEGIN

    DECLARE @quantidadeCampoRegistroAtivo int

    SELECT @quantidadeCampoRegistroAtivo = count(*) FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = UPPER(@nome_tabela)
            AND  COLUMN_NAME = UPPER('registro_ativo')

    IF(@quantidadeCampoRegistroAtivo > 0)
    BEGIN

    SET @SQL = 'select ''' + @nome_tabela + ''' AS NOME_TABELA, '''
                         + @nome_coluna + ''' AS NOME_COLUNA, '
                         + 'count (*) as TOTAL_RELACIONAMENTO from ' + @nome_tabela + ' where ' + @nome_tabela + '.' + @nome_coluna + ' = ' + @id + ' and ' + @nome_tabela + '.' +'registro_ativo = 1'
    END

    IF(@quantidadeCampoRegistroAtivo = 0)
    BEGIN

    SET @SQL = 'select ''' + @nome_tabela + ''' AS NOME_TABELA, '''
                         + @nome_coluna + ''' AS NOME_COLUNA, '
                         + 'count (*) as TOTAL_RELACIONAMENTO from ' + @nome_tabela + ' where ' + @nome_tabela + '.' + @nome_coluna + ' = ' + @id
    END
  PRINT @SQL
  INSERT INTO @TABELA1
  EXEC(@SQL)

FETCH NEXT FROM CURSOR_FK INTO @nome_tabela, @nome_coluna
END

CLOSE CURSOR_FK
DEALLOCATE CURSOR_FK

SELECT * FROM @TABELA1


END


GO
/****** Object:  StoredProcedure [dbo].[geraLancamentoEventual]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[geraLancamentoEventual]  @entidade bigint
AS
BEGIN
DECLARE @TABELA_NUMERO_LANCAMENTO_EVENTUAL
  TABLE ([id]          [bigint])
                --declare @id bigint;
                BEGIN TRAN T1
                SET NOCOUNT ON;
                               if(exists(select id from tb_entidade_numero_automatico where fk_entidade=@entidade))
                               BEGIN
                                               update tb_entidade_numero_automatico set numero_lancamento_eventual = coalesce(numero_lancamento_eventual,0) +1 where fk_entidade=@entidade;
                               END ELSE
                                               insert into tb_entidade_numero_automatico (resolveu_dependencia,data_ultima_alteracao,registro_ativo,ano,numero_lancamento_eventual,fk_entidade,fk_usuario_ultima_alteracao)
                                               values(0,getdate(),1,year(getdate()),1,@entidade,0)
                               
                               INSERT INTO @TABELA_NUMERO_LANCAMENTO_EVENTUAL (id)
                               (select numero_lancamento_eventual from tb_entidade_numero_automatico where fk_entidade=@entidade)
                commit TRAN T1

                select * from @TABELA_NUMERO_LANCAMENTO_EVENTUAL
END

GO
/****** Object:  StoredProcedure [dbo].[gerarPagamentoProcedimentoPorEspelho]    Script Date: 16/06/2017 11:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[gerarPagamentoProcedimentoPorEspelho] (
  @idEspelho  INTEGER,
  @usuario  INTEGER)
  as
BEGIN
	BEGIN TRAN T1
	SET NOCOUNT ON;
		
	--------------------------------------ATUALIZA PAGAMENTOS PROCEDIMENTOS-----------------------------------
	update pagamento set pagamento.registro_ativo = 0,pagamento.fk_usuario_ultima_alteracao=@usuario
	from tb_pagamento_procedimento pagamento
	inner join tb_procedimento procedimento on procedimento.id = pagamento.fk_procedimento and procedimento.registro_ativo=1
	inner join tb_atendimento atendimento on atendimento.id = procedimento.fk_atendimento and atendimento.registro_ativo=1
	where pagamento.fk_fatura is null and pagamento.registro_ativo=1 and atendimento.fk_espelho in (@idEspelho)

	INSERT INTO tb_pagamento_procedimento (resolveu_dependencia, data_criacao, data_ultima_alteracao, fk_procedimento, fk_usuario_ultima_alteracao,
	registro_ativo, valor_honorario, valor_acrescimo, valor_custo_operacional, valor_desconto, valor_filme,fk_fatura, sql_update)

     select 0, getDate(), getDate(), procedimento.id, @usuario, 1,sum(coalesce(procedimento.valor_honorario,0))+sum(coalesce(procedimento.valor_acrescimo_convenio,0)) -sum(coalesce(pagamento.valor_honorario,0)) - 
     coalesce((select top 1 valor_honorario  from tb_glosa as glosa where glosa.registro_ativo=1  
     and glosa.situacao in(0,1,2,3,7) and glosa.fk_procedimento=procedimento.id order by id desc ),0) as valorHonorario, 
      
      
     sum(coalesce(procedimento.valor_acrescimo,0))-sum(coalesce(pagamento.valor_acrescimo,0)) - 
     coalesce((select top 1 valor_acrescimo  from tb_glosa as glosa where glosa.registro_ativo=1  
     and glosa.situacao in(0,1,2,3,7) and glosa.fk_procedimento=procedimento.id order by id desc ),0) as valorAcrescimo, 
      
      
     sum(coalesce(procedimento.valor_custo_operacional,0))-sum(coalesce(pagamento.valor_custo_operacional,0)) - 
     coalesce((select top 1 valor_custo_operacional  from tb_glosa as glosa where glosa.registro_ativo=1  
     and glosa.situacao in(0,1,2,3,7) and glosa.fk_procedimento=procedimento.id order by id desc ),0) as valorCustoOperacional, 
      
     sum(coalesce(abs(procedimento.valor_desconto),0))-sum(coalesce(abs(pagamento.valor_desconto),0)) - 
     coalesce((select top 1 abs(valor_desconto)  from tb_glosa as glosa where glosa.registro_ativo=1  
     and glosa.situacao in(0,1,2,3,7) and glosa.fk_procedimento=procedimento.id order by id desc ),0) as valorDesconto, 
      
     sum(coalesce(procedimento.valor_filme,0))-sum(coalesce(pagamento.valor_filme,0))- 
     coalesce((select top 1 valor_filme  from tb_glosa as glosa where glosa.registro_ativo=1  
     and glosa.situacao in(0,1,2,3,7) and glosa.fk_procedimento=procedimento.id order by id desc ),0) as valorFilme, null, '3780' 
       
     from tb_procedimento procedimento  
     inner join tb_atendimento atendimento on (atendimento.id = procedimento.fk_atendimento and atendimento.registro_ativo = 1) 
     left join tb_pagamento_procedimento pagamento on(procedimento.id=pagamento.fk_procedimento  
     and pagamento.registro_ativo=1  
     and pagamento.fk_fatura is not null) 
     where procedimento.registro_ativo=1 and procedimento.id in (select id from tb_procedimento where fk_atendimento in (select id from tb_atendimento where fk_espelho in (@idEspelho)))

 and atendimento.situacaoAtendimento in(1,2,3,4) 
     group by procedimento.id 

	commit TRAN T1

END









GO
USE [master]
GO
ALTER DATABASE [sasc] SET  READ_WRITE 
GO
