-- ----------------------------
-- Table structure for PlannedFlightsSource
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PlannedFlightsSource]') AND type IN ('U'))
	DROP TABLE [dbo].[PlannedFlightsSource]
GO

CREATE TABLE [dbo].[PlannedFlightsSource] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [source] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [filename] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [etag] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [last_modified] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [content_length] int  NOT NULL,
  [insert_date] datetime DEFAULT (getdate()) NOT NULL,
  [active] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[PlannedFlightsSource] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
-- Indexes structure for table PlannedFlightsSource
-- ----------------------------
CREATE NONCLUSTERED INDEX [PlannedFlightsSource_id_idx]
ON [dbo].[PlannedFlightsSource] (
  [id] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlightsSource_content_length_idx]
ON [dbo].[PlannedFlightsSource] (
  [content_length] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlightsSource_insert_date_idx]
ON [dbo].[PlannedFlightsSource] (
  [insert_date] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlightsSource_active_idx]
ON [dbo].[PlannedFlightsSource] (
  [active] ASC
)
GO


-- ----------------------------
-- Uniques structure for table PlannedFlightsSource
-- ----------------------------
ALTER TABLE [dbo].[PlannedFlightsSource] ADD CONSTRAINT [PlannedFlightsSource_id_unique] UNIQUE NONCLUSTERED ([id] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table PlannedFlightsSource
-- ----------------------------
ALTER TABLE [dbo].[PlannedFlightsSource] ADD CONSTRAINT [PlannedFlightsSource_pkey] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Companies]') AND type IN ('U'))
	DROP TABLE [dbo].[Companies]
GO

CREATE TABLE [dbo].[Companies] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [icao_code] varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [iata_code] varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [company_name] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [country] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [iata_accounting_code] int  NOT NULL,
  [iata_airline_prefix_code] int  NOT NULL,
  [insert_date] datetime DEFAULT (getdate()) NOT NULL,
  [active] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[Companies] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Companies
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[Companies] ON
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'1', N'AAL', N'AA', N'American Airlines Inc.', N'United States of America', N'1', N'1', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'2', N'ACA', N'AC', N'Air Canada', N'Canada', N'14', N'14', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'3', N'AEA', N'UX', N'Air Europa Lineas Aereas, S.A.', N'Spain', N'996', N'996', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'4', N'AFR', N'AF', N'Air France', N'France', N'57', N'57', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'5', N'AMS', N'', N'', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'6', N'AMX', N'AM', N'Aeromexico', N'Mexico', N'139', N'139', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'7', N'ARG', N'AR', N'Aerolineas Argentinas S.A.', N'Argentina', N'44', N'44', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'8', N'AUT', N'AU', N'Austral Lineas Aereas - Cielos del Sur S.A.', N'Argentina', N'143', N'143', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'9', N'AUZ', N'', N'Cristalux S.A (Amaszonas Uruguay)', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'10', N'AVA', N'AV', N'Aerovias del Continente Americano S.A. AVIANCA', N'Colombia', N'134', N'134', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'11', N'AZA', N'AZ', N'Alitalia Societa Aerea Italiana S.p.A', N'Italy', N'55', N'55', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'12', N'AZN', N'', N'Compañia de Servicios de Transporte Aereo Amaszonas S/A.', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'13', N'AZP', N'ZP', N'Compania de Aviacion Paraguaya S.A dba Paranair', N'Paraguay', N'445', N'445', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'14', N'AZU', N'AD', N'Azul Linhas Aereas Brasileiras', N'Brazil', N'577', N'577', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'15', N'BAW', N'BA', N'British Airways p.l.c.', N'United Kingdom', N'125', N'125', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'16', N'BOV', N'OB', N'Boliviana de Aviacion (BoA)', N'Bolivia', N'930', N'930', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'17', N'CCA', N'CA', N'Air China LTD', N'People''s Republic of China', N'999', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'18', N'CFG', N'DE', N'Condor Flugdienst GmbH', N'Germany', N'881', N'881', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'19', N'CKP', N'', N'', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'20', N'CLX', N'CV', N'Cargolux Airlines International S.A', N'Luxembourg', N'0', N'172', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'21', N'CMP', N'CM', N'Compania Panamena de Aviacion, S.A. (COPA)', N'Panama', N'230', N'230', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'22', N'CND', N'CD', N'Corendon Dutch Airlines B.V.', N'Netherlands', N'0', N'503', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'23', N'CQB', N'', N'', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'24', N'DAL', N'DL', N'Delta Air Lines, Inc.', N'United States of America', N'6', N'6', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'25', N'DLH', N'LH', N'Deutsche Lufthansa AG', N'Germany', N'220', N'220', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'26', N'DSM', N'4M', N'LAN Argentina S.A. dba LATAM Airlines Argentina', N'Argentina', N'469', N'469', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'27', N'DTA', N'DT', N'TAAG - Linhas Aereas de Angola (Angola Airlines)', N'Angola', N'118', N'118', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'28', N'EDW', N'WK', N'Edelweiss Air AG', N'Switzerland', N'0', N'945', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'29', N'ETH', N'ET', N'Ethiopia Airlines', N'Ethiopia', N'71', N'71', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'30', N'FBZ', N'', N'FB Líneas Aéreas S.A (FLYBONDI)', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'31', N'FDX', N'FX', N'FedEx', N'United States of America', N'0', N'23', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'32', N'GEC', N'LH', N'Lufthansa Cargo AG', N'Germany', N'0', N'20', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'33', N'GLO', N'G3', N'GOL Linhas Aereas S.A.', N'Brazil', N'127', N'127', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'34', N'GTI', N'5Y', N'Atlas Air, Inc.', N'United States of America', N'0', N'369', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'35', N'IBE', N'IB', N'Iberia Lineas Aereas de Espana S.A. Operadora', N'Spain', N'75', N'75', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'36', N'JAT', N'JA', N'JETSMART SpA', N'Chile', N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'37', N'KAL', N'KE', N'Korean Air Lines Co. Ltd.', N'Republic of Korea', N'180', N'180', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'38', N'KLM', N'KL', N'KLM', N'Netherlands', N'74', N'74', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'39', N'LAE', N'L7', N'Linea Aerea Carguera de Colombia S. dba LATAM Cargo Colombia', N'Colombia', N'0', N'985', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'40', N'LAN', N'LA', N'LATAM Airlines Group S.A. dba LATAM Airlines Group', N'Chile', N'45', N'45', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'41', N'LAP', N'PZ', N'Transportes Aereos del Mercosur S.A dba LATAM Airlines Paraguay', N'Paraguay', N'692', N'692', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'42', N'LAU', N'4L', N'Lineas Aereas Suramericanas SA "LAS S.A."', N'Colombia', N'0', N'174', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'43', N'LCO', N'UC', N'Lan Cargo S.A. dba LATAM Cargo Chile', N'Chile', N'0', N'145', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'44', N'LPE', N'LP', N'LATAM Airlines Peru S.A.', N'Peru', N'544', N'544', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'45', N'LTG', N'M3', N'ABSA - Aerolinhas Brasileiras S.A dba LATAM Cargo Brasil', N'Brazil', N'0', N'549', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'46', N'MPH', N'MP', N'Martinair Holland N.V.', N'Netherlands', N'0', N'129', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'47', N'MWM', N'WD', N'Modern Transporte Aereo de Carga SA dba Modern Logistics', N'Brazil', N'0', N'372', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'48', N'NRS', N'DI', N'Norwegian Air UK ltd', N'United Kingdom', N'762', N'762', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'49', N'OMI', N'', N'', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'50', N'OWT', N'2F', N'Two Taxi Aéreo Ltda.', N'Brazil', N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'51', N'PAM', N'7M', N'MAP Linhas Aereas', N'Brazil', N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'52', N'PTB', N'2Z', N'Passaredo Transportes Aereos S.A.', N'Brazil', N'678', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'53', N'QTR', N'QR', N'Qatar Airways (Q.C.S.C.)', N'Qatar', N'157', N'157', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'54', N'RAM', N'AT', N'Royal Air Maroc', N'Morocco', N'147', N'147', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'55', N'RIM', N'', N'', NULL, N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'56', N'ROI', N'9V', N'Avior Airlines, C.A.', N'Venezuela', N'742', N'742', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'57', N'SAA', N'SA', N'South African Airways SOC LTD dba South African Airways', N'South Africa', N'83', N'83', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'58', N'SID', N'', N'Sideral Linhas Aéreas Ltda.', N'Brazil', N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'59', N'SKU', N'H2', N'Sky Airline S.A.', N'Chile', N'605', N'605', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'60', N'SLM', N'PY', N'Surinaamse Luchtvaart Maatschappij N.V dba Surinam Airways', N'Suriname', N'192', N'192', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'61', N'SUL', N'0A', N'Asta Linhas Aereas Ltda', N'Brazil', N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'62', N'SWR', N'LX', N'SWISS International Air Lines Ltd dba SWISS', N'Switzerland', N'724', N'724', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'63', N'TAM', N'JJ', N'TAM Linhas Aereas S.A. dba LATAM Airlines Brasil', N'Brazil', N'957', N'957', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'64', N'TAP', N'TP', N'TAP Portugal', N'Portugal', N'47', N'47', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'65', N'TCV', N'VR', N'Transportes Aereos de Cabo Verde', N'Cape Verde', N'696', N'696', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'66', N'THY', N'TK', N'Turkish Airlines Inc.', N'Turkey', N'235', N'235', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'67', N'TPA', N'QT', N'Tampa Cargo S.A.S', N'Colombia', N'0', N'729', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'68', N'TPU', N'T0', N'Avianca Peru S.A.', N'Peru', N'530', N'530', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'69', N'TTL', N'', N'Total Linhas Aéreas S.A.', N'Brazil', N'0', N'0', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'70', N'UAE', N'EK', N'Emirates', N'United Arab Emirates', N'176', N'176', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'71', N'UAL', N'UA', N'United Airlines, Inc.', N'United States of America', N'16', N'16', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'72', N'UPS', N'5X', N'UPS', N'United States of America', N'0', N'406', N'2020-03-03 22:31:15.960', N'1')
GO

INSERT INTO [dbo].[Companies] ([id], [icao_code], [iata_code], [company_name], [country], [iata_accounting_code], [iata_airline_prefix_code], [insert_date], [active]) VALUES (N'73', N'VIR', N'VS', N'Virgin Atlantic Airways Limited', N'United Kingdom', N'932', N'932', N'2020-03-03 22:31:15.960', N'1')
GO

SET IDENTITY_INSERT [dbo].[Companies] OFF
GO

COMMIT
GO

-- ----------------------------
-- Indexes structure for table Companies
-- ----------------------------
CREATE NONCLUSTERED INDEX [Companies_id_idx]
ON [dbo].[Companies] (
  [id] ASC
)
GO

CREATE NONCLUSTERED INDEX [Companies_iata_accounting_code_idx]
ON [dbo].[Companies] (
  [iata_accounting_code] ASC
)
GO

CREATE NONCLUSTERED INDEX [Companies_iata_airline_prefix_code_idx]
ON [dbo].[Companies] (
  [iata_airline_prefix_code] ASC
)
GO

CREATE NONCLUSTERED INDEX [Companies_insert_date_idx]
ON [dbo].[Companies] (
  [insert_date] ASC
)
GO

CREATE NONCLUSTERED INDEX [Companies_active_idx]
ON [dbo].[Companies] (
  [active] ASC
)
GO


-- ----------------------------
-- Uniques structure for table Companies
-- ----------------------------
ALTER TABLE [dbo].[Companies] ADD CONSTRAINT [Companies_id_unique] UNIQUE NONCLUSTERED ([id] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Companies
-- ----------------------------
ALTER TABLE [dbo].[Companies] ADD CONSTRAINT [Companies_pkey] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Table structure for PlannedFlights
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PlannedFlights]') AND type IN ('U'))
        DROP TABLE [dbo].[PlannedFlights]
GO

CREATE TABLE [dbo].[PlannedFlights] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [etag] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [company_code] varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [flight_number] int  NOT NULL,
  [equipment] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [seat_number] int  NOT NULL,
  [siros_id] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [siros_status] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [date_request] datetime  NOT NULL,
  [operation_type] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [flight_stage] int  NOT NULL,
  [departure_time] datetime  NOT NULL,
  [arrival_time] datetime  NOT NULL,
  [departure_airport] varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [arrival_airport] varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [servicetype] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [transport_type] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [codeshare] varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [insert_date] datetime DEFAULT (getdate()) NOT NULL,
  [active] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[PlannedFlights] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
-- Indexes structure for table PlannedFlights
-- ----------------------------
CREATE NONCLUSTERED INDEX [PlannedFlights_id_idx]
ON [dbo].[PlannedFlights] (
  [id] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_flight_number_idx]
ON [dbo].[PlannedFlights] (
  [flight_number] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_seat_number_idx]
ON [dbo].[PlannedFlights] (
  [seat_number] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_date_request_idx]
ON [dbo].[PlannedFlights] (
  [date_request] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_flight_stage_idx]
ON [dbo].[PlannedFlights] (
  [flight_stage] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_departure_time_idx]
ON [dbo].[PlannedFlights] (
  [departure_time] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_arrival_time_idx]
ON [dbo].[PlannedFlights] (
  [arrival_time] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_insert_date_idx]
ON [dbo].[PlannedFlights] (
  [insert_date] ASC
)
GO

CREATE NONCLUSTERED INDEX [PlannedFlights_active_idx]
ON [dbo].[PlannedFlights] (
  [active] ASC
)
GO


-- ----------------------------
-- Uniques structure for table PlannedFlights
-- ----------------------------
ALTER TABLE [dbo].[PlannedFlights] ADD CONSTRAINT [PlannedFlights_id_unique] UNIQUE NONCLUSTERED ([id] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table PlannedFlights
-- ----------------------------
ALTER TABLE [dbo].[PlannedFlights] ADD CONSTRAINT [PlannedFlights_pkey] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO