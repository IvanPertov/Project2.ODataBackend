




CREATE TABLE Начисления (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 Период VARCHAR(255) NULL,

 Сумма DECIMAL NULL,

 Договор_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE Договор (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 Идентификатор INT NULL,

 ДатаНачала TIMESTAMP(3) NULL,

 ДатаОкончания TIMESTAMP(3) NULL,

 Состояние STRING NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE Контрагент (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 Тип VARCHAR(255) NULL,

 Наименование VARCHAR(255) NULL,

 ИНН VARCHAR(255) NULL,

 ОГРН VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE КонтрДоговора (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 Контрагент_m0 UUID NOT NULL,

 Договор_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE ЗУДоговора (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 ЗУ_m0 UUID NOT NULL,

 Договор_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE Оплаты (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 Дата TIMESTAMP(3) NULL,

 Сумма DECIMAL NULL,

 Договор_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE ЗУ (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 КадНомер VARCHAR(255) NULL,

 Адрес VARCHAR(255) NULL,

 РазрИсп VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMNETLOCKDATA (

 LockKey VARCHAR(300) NOT NULL,

 UserName VARCHAR(300) NOT NULL,

 LockDate TIMESTAMP(3) NULL,

 PRIMARY KEY (LockKey));



CREATE TABLE STORMSETTINGS (

 primaryKey UUID NOT NULL,

 Module VARCHAR(1000) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 "User" VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMAdvLimit (

 primaryKey UUID NOT NULL,

 "User" VARCHAR(255) NULL,

 Published BOOLEAN NULL,

 Module VARCHAR(255) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 HotKeyData INT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMFILTERSETTING (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMWEBSEARCH (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 "Order" INT NOT NULL,

 PresentView VARCHAR(255) NOT NULL,

 DetailedView VARCHAR(255) NOT NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMFILTERDETAIL (

 primaryKey UUID NOT NULL,

 Caption VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 ConnectMasterProp VARCHAR(255) NOT NULL,

 OwnerConnectProp VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMFILTERLOOKUP (

 primaryKey UUID NOT NULL,

 DataObjectType VARCHAR(255) NOT NULL,

 Container VARCHAR(255) NULL,

 ContainerTag VARCHAR(255) NULL,

 FieldsToView VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE UserSetting (

 primaryKey UUID NOT NULL,

 AppName VARCHAR(256) NULL,

 UserName VARCHAR(512) NULL,

 UserGuid UUID NULL,

 ModuleName VARCHAR(1024) NULL,

 ModuleGuid UUID NULL,

 SettName VARCHAR(256) NULL,

 SettGuid UUID NULL,

 SettLastAccessTime TIMESTAMP(3) NULL,

 StrVal VARCHAR(256) NULL,

 TxtVal TEXT NULL,

 IntVal INT NULL,

 BoolVal BOOLEAN NULL,

 GuidVal UUID NULL,

 DecimalVal DECIMAL(20,10) NULL,

 DateTimeVal TIMESTAMP(3) NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE ApplicationLog (

 primaryKey UUID NOT NULL,

 Category VARCHAR(64) NULL,

 EventId INT NULL,

 Priority INT NULL,

 Severity VARCHAR(32) NULL,

 Title VARCHAR(256) NULL,

 Timestamp TIMESTAMP(3) NULL,

 MachineName VARCHAR(32) NULL,

 AppDomainName VARCHAR(512) NULL,

 ProcessId VARCHAR(256) NULL,

 ProcessName VARCHAR(512) NULL,

 ThreadName VARCHAR(512) NULL,

 Win32ThreadId VARCHAR(128) NULL,

 Message VARCHAR(2500) NULL,

 FormattedMessage TEXT NULL,

 PRIMARY KEY (primaryKey));




 ALTER TABLE Начисления ADD CONSTRAINT FK955ad51666434484a55c711661886615 FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Index3edc1733b19924fe82aa39a6437ce4091d20038e on Начисления (Договор_m0); 

 ALTER TABLE КонтрДоговора ADD CONSTRAINT FK2a89ed5fc991462191d496aeb81c950c FOREIGN KEY (Контрагент_m0) REFERENCES Контрагент; 
CREATE INDEX Indexf78b57969567ca8c06a4fed53fff0c10bcebd8ca on КонтрДоговора (Контрагент_m0); 

 ALTER TABLE КонтрДоговора ADD CONSTRAINT FK6fa3e5c36f47423780d54b607dd72040 FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Indexe077502febf3fe8ee438387626bd2cb243caee79 on КонтрДоговора (Договор_m0); 

 ALTER TABLE ЗУДоговора ADD CONSTRAINT FK89c5ce53400d4c5a8004132040e11d10 FOREIGN KEY (ЗУ_m0) REFERENCES ЗУ; 
CREATE INDEX Index18a37dbfeb3f9d18eadf5e432274087f0564faa9 on ЗУДоговора (ЗУ_m0); 

 ALTER TABLE ЗУДоговора ADD CONSTRAINT FK07b83483e94645b385570dd4eed9d86b FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Index434365021ec3ac96fc6869fb3a34bc697140f6c3 on ЗУДоговора (Договор_m0); 

 ALTER TABLE Оплаты ADD CONSTRAINT FK0b04d37cab144a16b3c083d12416cecf FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Index2073fb1d9cfb810c58ce39c2215b38c693297a35 on Оплаты (Договор_m0); 

 ALTER TABLE STORMWEBSEARCH ADD CONSTRAINT FK2e0971e48f0a4daf8ad777bb17c637a6 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERDETAIL ADD CONSTRAINT FK18db4ae59ca6487798b2f494385585f6 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERLOOKUP ADD CONSTRAINT FKf678ba675c2d492f87f6ea0f75cc2431 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

