/*
   Friday, February 24, 202312:17:43 PM
   User: 
   Server: HESHAN-KALHARA
   Database: PillFinder
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Pharmacy_owner
	(
	pharmacy_owner_id int NOT NULL,
	name varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	phone varchar(10) NOT NULL,
	email varchar(50) NOT NULL,
	nic varchar(12) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Pharmacy_owner ADD CONSTRAINT
	PK_Pharmacy_owner PRIMARY KEY CLUSTERED 
	(
	pharmacy_owner_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Pharmacy_owner SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Pharmacy_owner', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Pharmacy_owner', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Pharmacy_owner', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Province
	(
	province_id int NOT NULL,
	name nchar(10) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Province ADD CONSTRAINT
	PK_Province PRIMARY KEY CLUSTERED 
	(
	province_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Province SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Province', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Province', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Province', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.City
	(
	city_id int NOT NULL,
	name varchar(20) NOT NULL,
	province_id int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.City ADD CONSTRAINT
	PK_City PRIMARY KEY CLUSTERED 
	(
	city_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.City ADD CONSTRAINT
	FK_City_Province FOREIGN KEY
	(
	province_id
	) REFERENCES dbo.Province
	(
	province_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.City SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.City', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.City', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.City', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Medicine
	(
	medicine_id int NOT NULL,
	name varchar(50) NOT NULL,
	dosage varchar(10) NULL,
	manufacturer varchar(50) NOT NULL,
	supplier varchar(50) NOT NULL,
	NDC varchar(10) NOT NULL,
	expiration_date varchar(10) NOT NULL,
	unit_price float(53) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Medicine ADD CONSTRAINT
	PK_Medicine PRIMARY KEY CLUSTERED 
	(
	medicine_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Medicine SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Medicine', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Medicine', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Medicine', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.[User]
	(
	user_id int NOT NULL IDENTITY (1, 1),
	name varchar(20) NOT NULL,
	email varchar(20) NOT NULL,
	NIC varchar(12) NOT NULL,
	password varchar(16) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.[User] ADD CONSTRAINT
	PK_User PRIMARY KEY CLUSTERED 
	(
	user_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[User] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.[User]', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.[User]', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.[User]', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Pharmacy
	(
	pharmacy_id int NOT NULL,
	name varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	phone varchar(10) NOT NULL,
	user_id int NOT NULL,
	city_id int NOT NULL,
	is_approved bit NOT NULL,
	pharmacy_license varchar(20) NOT NULL,
	password varchar(12) NOT NULL,
	approved_by int NOT NULL,
	website varchar(50) NULL,
	operating_hours varchar(20) NOT NULL,
	owner_id int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Pharmacy ADD CONSTRAINT
	PK_Pharmacy PRIMARY KEY CLUSTERED 
	(
	pharmacy_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Pharmacy ADD CONSTRAINT
	FK_Pharmacy_City FOREIGN KEY
	(
	city_id
	) REFERENCES dbo.City
	(
	city_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Pharmacy ADD CONSTRAINT
	FK_Pharmacy_User FOREIGN KEY
	(
	approved_by
	) REFERENCES dbo.[User]
	(
	user_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Pharmacy ADD CONSTRAINT
	FK_Pharmacy_Pharmacy_owner FOREIGN KEY
	(
	owner_id
	) REFERENCES dbo.Pharmacy_owner
	(
	pharmacy_owner_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
DECLARE @v sql_variant 
SET @v = N'owner Details'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Pharmacy', N'CONSTRAINT', N'FK_Pharmacy_Pharmacy_owner'
GO
ALTER TABLE dbo.Pharmacy SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Pharmacy', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Pharmacy', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Pharmacy', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Pharmacy_medicine
	(
	pharmacy_id int NOT NULL,
	medicine_id int NOT NULL,
	quantity int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Pharmacy_medicine ADD CONSTRAINT
	FK_Pharmacy_medicine_Medicine FOREIGN KEY
	(
	medicine_id
	) REFERENCES dbo.Medicine
	(
	medicine_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Pharmacy_medicine ADD CONSTRAINT
	FK_Pharmacy_medicine_Pharmacy FOREIGN KEY
	(
	pharmacy_id
	) REFERENCES dbo.Pharmacy
	(
	pharmacy_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Pharmacy_medicine SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Pharmacy_medicine', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Pharmacy_medicine', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Pharmacy_medicine', 'Object', 'CONTROL') as Contr_Per 