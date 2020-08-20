




CREATE TABLE Начисления (

 primaryKey UUID NOT NULL,

 primarykey UUID NULL,

 Период VARCHAR(255) NULL,

 Сумма DECIMAL NULL,

 Договор_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE Договор (

 primaryKey UUID NOT NULL,

 Идентификатор INT NULL,

 primarykey UUID NULL,

 ДатаНачала TIMESTAMP(3) NULL,

 ДатаОкончания TIMESTAMP(3) NULL,

 Состояние VARCHAR(255) NULL,

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




 ALTER TABLE Начисления ADD CONSTRAINT FK80c6ff624edd424baf95f6231105a32c FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Index3edc1733b19924fe82aa39a6437ce4091d20038e on Начисления (Договор_m0); 

 ALTER TABLE КонтрДоговора ADD CONSTRAINT FK33592242e0844e1992a82666397ed70b FOREIGN KEY (Контрагент_m0) REFERENCES Контрагент; 
CREATE INDEX Indexf78b57969567ca8c06a4fed53fff0c10bcebd8ca on КонтрДоговора (Контрагент_m0); 

 ALTER TABLE КонтрДоговора ADD CONSTRAINT FKdd3359b01be74bcfb568a0e01bdfe9df FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Indexe077502febf3fe8ee438387626bd2cb243caee79 on КонтрДоговора (Договор_m0); 

 ALTER TABLE ЗУДоговора ADD CONSTRAINT FK1c3cb75b92f34492a7b766fefc78370a FOREIGN KEY (ЗУ_m0) REFERENCES ЗУ; 
CREATE INDEX Index18a37dbfeb3f9d18eadf5e432274087f0564faa9 on ЗУДоговора (ЗУ_m0); 

 ALTER TABLE ЗУДоговора ADD CONSTRAINT FKd277a275e23c4772bdc77818c386a721 FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Index434365021ec3ac96fc6869fb3a34bc697140f6c3 on ЗУДоговора (Договор_m0); 

 ALTER TABLE Оплаты ADD CONSTRAINT FK9b89f722983541bea5abbfe9daf768cd FOREIGN KEY (Договор_m0) REFERENCES Договор; 
CREATE INDEX Index2073fb1d9cfb810c58ce39c2215b38c693297a35 on Оплаты (Договор_m0); 

 ALTER TABLE STORMWEBSEARCH ADD CONSTRAINT FKdc49757697bc423889ef483d62105c52 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERDETAIL ADD CONSTRAINT FK40efba8086aa4678a1d06e111a29689b FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERLOOKUP ADD CONSTRAINT FKfed20be89b7442038571f777d9f7e443 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

