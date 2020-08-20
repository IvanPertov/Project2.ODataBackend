﻿



CREATE TABLE [Начисления] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [primarykey] uniqueidentifier  NULL,

	 [Период] VARCHAR(255)  NULL,

	 [Сумма] DECIMAL  NULL,

	 [Договор_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [Договор] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [primarykey] uniqueidentifier  NULL,

	 [Идентификатор] INT  NULL,

	 [ДатаНачала] DATETIME  NULL,

	 [ДатаОкончания] DATETIME  NULL,

	 [Состояние] String  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [Контрагент] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [primarykey] uniqueidentifier  NULL,

	 [Тип] VARCHAR(255)  NULL,

	 [Наименование] VARCHAR(255)  NULL,

	 [ИНН] VARCHAR(255)  NULL,

	 [ОГРН] VARCHAR(255)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [КонтрДоговора] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [primarykey] uniqueidentifier  NULL,

	 [Контрагент_m0] UNIQUEIDENTIFIER  NOT NULL,

	 [Договор_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [ЗУДоговора] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [primarykey] uniqueidentifier  NULL,

	 [ЗУ_m0] UNIQUEIDENTIFIER  NOT NULL,

	 [Договор_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [Оплаты] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [primarykey] uniqueidentifier  NULL,

	 [Дата] DATETIME  NULL,

	 [Сумма] DECIMAL  NULL,

	 [Договор_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [ЗУ] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [primarykey] uniqueidentifier  NULL,

	 [КадНомер] VARCHAR(255)  NULL,

	 [Адрес] VARCHAR(255)  NULL,

	 [РазрИсп] VARCHAR(255)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMNETLOCKDATA] (

	 [LockKey] VARCHAR(300)  NOT NULL,

	 [UserName] VARCHAR(300)  NOT NULL,

	 [LockDate] DATETIME  NULL,

	 PRIMARY KEY ([LockKey]))


CREATE TABLE [STORMSETTINGS] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Module] varchar(1000)  NULL,

	 [Name] varchar(255)  NULL,

	 [Value] text  NULL,

	 [User] varchar(255)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMAdvLimit] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [User] varchar(255)  NULL,

	 [Published] bit  NULL,

	 [Module] varchar(255)  NULL,

	 [Name] varchar(255)  NULL,

	 [Value] text  NULL,

	 [HotKeyData] int  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERSETTING] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Name] varchar(255)  NOT NULL,

	 [DataObjectView] varchar(255)  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMWEBSEARCH] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Name] varchar(255)  NOT NULL,

	 [Order] INT  NOT NULL,

	 [PresentView] varchar(255)  NOT NULL,

	 [DetailedView] varchar(255)  NOT NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERDETAIL] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Caption] varchar(255)  NOT NULL,

	 [DataObjectView] varchar(255)  NOT NULL,

	 [ConnectMasterProp] varchar(255)  NOT NULL,

	 [OwnerConnectProp] varchar(255)  NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERLOOKUP] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [DataObjectType] varchar(255)  NOT NULL,

	 [Container] varchar(255)  NULL,

	 [ContainerTag] varchar(255)  NULL,

	 [FieldsToView] varchar(255)  NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [UserSetting] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [AppName] varchar(256)  NULL,

	 [UserName] varchar(512)  NULL,

	 [UserGuid] uniqueidentifier  NULL,

	 [ModuleName] varchar(1024)  NULL,

	 [ModuleGuid] uniqueidentifier  NULL,

	 [SettName] varchar(256)  NULL,

	 [SettGuid] uniqueidentifier  NULL,

	 [SettLastAccessTime] DATETIME  NULL,

	 [StrVal] varchar(256)  NULL,

	 [TxtVal] varchar(max)  NULL,

	 [IntVal] int  NULL,

	 [BoolVal] bit  NULL,

	 [GuidVal] uniqueidentifier  NULL,

	 [DecimalVal] decimal(20,10)  NULL,

	 [DateTimeVal] DATETIME  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [ApplicationLog] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Category] varchar(64)  NULL,

	 [EventId] INT  NULL,

	 [Priority] INT  NULL,

	 [Severity] varchar(32)  NULL,

	 [Title] varchar(256)  NULL,

	 [Timestamp] DATETIME  NULL,

	 [MachineName] varchar(32)  NULL,

	 [AppDomainName] varchar(512)  NULL,

	 [ProcessId] varchar(256)  NULL,

	 [ProcessName] varchar(512)  NULL,

	 [ThreadName] varchar(512)  NULL,

	 [Win32ThreadId] varchar(128)  NULL,

	 [Message] varchar(2500)  NULL,

	 [FormattedMessage] varchar(max)  NULL,

	 PRIMARY KEY ([primaryKey]))




 ALTER TABLE [Начисления] ADD CONSTRAINT [Начисления_FДоговор_0] FOREIGN KEY ([Договор_m0]) REFERENCES [Договор]
CREATE INDEX Начисления_IДоговор_m0 on [Начисления] ([Договор_m0])

 ALTER TABLE [КонтрДоговора] ADD CONSTRAINT [КонтрДоговора_FКонтрагент_0] FOREIGN KEY ([Контрагент_m0]) REFERENCES [Контрагент]
CREATE INDEX КонтрДоговора_IКонтрагент_m0 on [КонтрДоговора] ([Контрагент_m0])

 ALTER TABLE [КонтрДоговора] ADD CONSTRAINT [КонтрДоговора_FДоговор_0] FOREIGN KEY ([Договор_m0]) REFERENCES [Договор]
CREATE INDEX КонтрДоговора_IДоговор_m0 on [КонтрДоговора] ([Договор_m0])

 ALTER TABLE [ЗУДоговора] ADD CONSTRAINT [ЗУДоговора_FЗУ_0] FOREIGN KEY ([ЗУ_m0]) REFERENCES [ЗУ]
CREATE INDEX ЗУДоговора_IЗУ_m0 on [ЗУДоговора] ([ЗУ_m0])

 ALTER TABLE [ЗУДоговора] ADD CONSTRAINT [ЗУДоговора_FДоговор_0] FOREIGN KEY ([Договор_m0]) REFERENCES [Договор]
CREATE INDEX ЗУДоговора_IДоговор_m0 on [ЗУДоговора] ([Договор_m0])

 ALTER TABLE [Оплаты] ADD CONSTRAINT [Оплаты_FДоговор_0] FOREIGN KEY ([Договор_m0]) REFERENCES [Договор]
CREATE INDEX Оплаты_IДоговор_m0 on [Оплаты] ([Договор_m0])

 ALTER TABLE [STORMWEBSEARCH] ADD CONSTRAINT [STORMWEBSEARCH_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

 ALTER TABLE [STORMFILTERDETAIL] ADD CONSTRAINT [STORMFILTERDETAIL_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

 ALTER TABLE [STORMFILTERLOOKUP] ADD CONSTRAINT [STORMFILTERLOOKUP_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

