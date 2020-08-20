﻿



CREATE TABLE "Начисления"
(

	"primaryKey" RAW(16) NOT NULL,

	"primarykey" RAW(16) NULL,

	"Период" NVARCHAR2(255) NULL,

	"Сумма" NUMBER(38) NULL,

	"Договор_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "Договор"
(

	"primaryKey" RAW(16) NOT NULL,

	"Идентификатор" NUMBER(10) NULL,

	"primarykey" RAW(16) NULL,

	"ДатаНачала" DATE NULL,

	"ДатаОкончания" DATE NULL,

	"Состояние" String NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "Контрагент"
(

	"primaryKey" RAW(16) NOT NULL,

	"primarykey" RAW(16) NULL,

	"Тип" NVARCHAR2(255) NULL,

	"Наименование" NVARCHAR2(255) NULL,

	"ИНН" NVARCHAR2(255) NULL,

	"ОГРН" NVARCHAR2(255) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "КонтрДоговора"
(

	"primaryKey" RAW(16) NOT NULL,

	"primarykey" RAW(16) NULL,

	"Контрагент_m0" RAW(16) NOT NULL,

	"Договор_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "ЗУДоговора"
(

	"primaryKey" RAW(16) NOT NULL,

	"primarykey" RAW(16) NULL,

	"ЗУ_m0" RAW(16) NOT NULL,

	"Договор_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "Оплаты"
(

	"primaryKey" RAW(16) NOT NULL,

	"primarykey" RAW(16) NULL,

	"Дата" DATE NULL,

	"Сумма" NUMBER(38) NULL,

	"Договор_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "ЗУ"
(

	"primaryKey" RAW(16) NOT NULL,

	"primarykey" RAW(16) NULL,

	"КадНомер" NVARCHAR2(255) NULL,

	"Адрес" NVARCHAR2(255) NULL,

	"РазрИсп" NVARCHAR2(255) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMNETLOCKDATA"
(

	"LockKey" NVARCHAR2(300) NOT NULL,

	"UserName" NVARCHAR2(300) NOT NULL,

	"LockDate" DATE NULL,

	 PRIMARY KEY ("LockKey")
) ;


CREATE TABLE "STORMSETTINGS"
(

	"primaryKey" RAW(16) NOT NULL,

	"Module" nvarchar2(1000) NULL,

	"Name" nvarchar2(255) NULL,

	"Value" CLOB NULL,

	"User" nvarchar2(255) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMAdvLimit"
(

	"primaryKey" RAW(16) NOT NULL,

	"User" nvarchar2(255) NULL,

	"Published" NUMBER(1) NULL,

	"Module" nvarchar2(255) NULL,

	"Name" nvarchar2(255) NULL,

	"Value" CLOB NULL,

	"HotKeyData" NUMBER(10) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMFILTERSETTING"
(

	"primaryKey" RAW(16) NOT NULL,

	"Name" nvarchar2(255) NOT NULL,

	"DataObjectView" nvarchar2(255) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMWEBSEARCH"
(

	"primaryKey" RAW(16) NOT NULL,

	"Name" nvarchar2(255) NOT NULL,

	"Order" NUMBER(10) NOT NULL,

	"PresentView" nvarchar2(255) NOT NULL,

	"DetailedView" nvarchar2(255) NOT NULL,

	"FilterSetting_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMFILTERDETAIL"
(

	"primaryKey" RAW(16) NOT NULL,

	"Caption" nvarchar2(255) NOT NULL,

	"DataObjectView" nvarchar2(255) NOT NULL,

	"ConnectMasterProp" nvarchar2(255) NOT NULL,

	"OwnerConnectProp" nvarchar2(255) NULL,

	"FilterSetting_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMFILTERLOOKUP"
(

	"primaryKey" RAW(16) NOT NULL,

	"DataObjectType" nvarchar2(255) NOT NULL,

	"Container" nvarchar2(255) NULL,

	"ContainerTag" nvarchar2(255) NULL,

	"FieldsToView" nvarchar2(255) NULL,

	"FilterSetting_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "UserSetting"
(

	"primaryKey" RAW(16) NOT NULL,

	"AppName" nvarchar2(256) NULL,

	"UserName" nvarchar2(512) NULL,

	"UserGuid" RAW(16) NULL,

	"ModuleName" nvarchar2(1024) NULL,

	"ModuleGuid" RAW(16) NULL,

	"SettName" nvarchar2(256) NULL,

	"SettGuid" RAW(16) NULL,

	"SettLastAccessTime" DATE NULL,

	"StrVal" nvarchar2(256) NULL,

	"TxtVal" CLOB NULL,

	"IntVal" NUMBER(10) NULL,

	"BoolVal" NUMBER(1) NULL,

	"GuidVal" RAW(16) NULL,

	"DecimalVal" NUMBER(20,10) NULL,

	"DateTimeVal" DATE NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "ApplicationLog"
(

	"primaryKey" RAW(16) NOT NULL,

	"Category" nvarchar2(64) NULL,

	"EventId" NUMBER(10) NULL,

	"Priority" NUMBER(10) NULL,

	"Severity" nvarchar2(32) NULL,

	"Title" nvarchar2(256) NULL,

	"Timestamp" DATE NULL,

	"MachineName" nvarchar2(32) NULL,

	"AppDomainName" nvarchar2(512) NULL,

	"ProcessId" nvarchar2(256) NULL,

	"ProcessName" nvarchar2(512) NULL,

	"ThreadName" nvarchar2(512) NULL,

	"Win32ThreadId" nvarchar2(128) NULL,

	"Message" nvarchar2(2000) NULL,

	"FormattedMessage" nvarchar2(2000) NULL,

	 PRIMARY KEY ("primaryKey")
) ;



ALTER TABLE "Начисления"
	ADD CONSTRAINT "Начисления_FД_6046" FOREIGN KEY ("Договор_m0") REFERENCES "Договор" ("primaryKey");

CREATE INDEX "Начисления_IД_4731" on "Начисления" ("Договор_m0");

ALTER TABLE "КонтрДоговора"
	ADD CONSTRAINT "КонтрДоговор_3714" FOREIGN KEY ("Контрагент_m0") REFERENCES "Контрагент" ("primaryKey");

CREATE INDEX "КонтрДоговор_9620" on "КонтрДоговора" ("Контрагент_m0");

ALTER TABLE "КонтрДоговора"
	ADD CONSTRAINT "КонтрДоговор_5384" FOREIGN KEY ("Договор_m0") REFERENCES "Договор" ("primaryKey");

CREATE INDEX "КонтрДоговор_5547" on "КонтрДоговора" ("Договор_m0");

ALTER TABLE "ЗУДоговора"
	ADD CONSTRAINT "ЗУДоговора_FЗУ_0" FOREIGN KEY ("ЗУ_m0") REFERENCES "ЗУ" ("primaryKey");

CREATE INDEX "ЗУДоговора_IЗУ_m0" on "ЗУДоговора" ("ЗУ_m0");

ALTER TABLE "ЗУДоговора"
	ADD CONSTRAINT "ЗУДоговора_FДо_913" FOREIGN KEY ("Договор_m0") REFERENCES "Договор" ("primaryKey");

CREATE INDEX "ЗУДоговора_IД_5979" on "ЗУДоговора" ("Договор_m0");

ALTER TABLE "Оплаты"
	ADD CONSTRAINT "Оплаты_FДоговор_0" FOREIGN KEY ("Договор_m0") REFERENCES "Договор" ("primaryKey");

CREATE INDEX "Оплаты_IДогов_1984" on "Оплаты" ("Договор_m0");

ALTER TABLE "STORMWEBSEARCH"
	ADD CONSTRAINT "STORMWEBSEARCH_FSTORMFILT_6521" FOREIGN KEY ("FilterSetting_m0") REFERENCES "STORMFILTERSETTING" ("primaryKey");

ALTER TABLE "STORMFILTERDETAIL"
	ADD CONSTRAINT "STORMFILTERDETAIL_FSTORMF_2900" FOREIGN KEY ("FilterSetting_m0") REFERENCES "STORMFILTERSETTING" ("primaryKey");

ALTER TABLE "STORMFILTERLOOKUP"
	ADD CONSTRAINT "STORMFILTERLOOKUP_FSTORMF_1583" FOREIGN KEY ("FilterSetting_m0") REFERENCES "STORMFILTERSETTING" ("primaryKey");


