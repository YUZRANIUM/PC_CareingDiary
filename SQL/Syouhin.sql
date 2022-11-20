-- INFO ****************************************************
-- FileName : Syouhin.sql
-- Version  : 0.2.0
-- Date     : 2022/11/20
-- Author   : YUZRANIUM（ゆずらにうむ）
-- Twitter  : https://twitter.com/YUZRANIUM
-- GitHub   : https://github.com/YUZRANIUM/PC_CareingDiary
--**********************************************************
/* Description
商品データや実績解除機能の管理をしています。
***********************************************************/


-- PRAGMA foreign_keys=OFF;
-- BEGIN TRANSACTION;
	--CREATE TABLE "Syouhin" (
	--	[ID] TEXT NOT NULL UNIQUE,
	--	[Parts] TEXT,
	--	[Name] TEXT NOT NULL,
	--	[Version] TEXT,
	--	[Value] REAL,
	--	[seinou] REAL NOT NULL,
	--	[hosei] REAL NOT NULL,
	--	[Reality] TEXT,
	--	[S0] REAL,
	--	[S1] REAL,
	--	[S2] REAL,
	--	[S3] REAL,
	--	[S4] REAL,
	--	[S5] REAL,
	--	[S6] REAL
	--);


--============================================================================--

	/*****  拡張用テンプレ  *****/


	/***  管理用  ***/

	--CREATE VIEW MyAll AS SELECT ID,Parts,Name,Version,Value,Reality FROM "Syouhin" ORDER BY ID ASC;
	--CREATE VIEW MyAlli AS SELECT ID,seinou,hosei FROM "Syouhin" ORDER BY ID ASC;
	--CREATE VIEW masdata AS SELECT ID,S0,S1,s2,S3,S4,S5,S6 FROM "Syouhin" ORDER BY ID ASC;


	/***  商品用  ***/

	--CREATE VIEW MyCPU AS SELECT ID,Parts,Name,Version,Value,Reality FROM "Syouhin" WHERE Parts = 'CPU' AND S1 = 1 ORDER BY ID ASC;
	--CREATE VIEW MyGPU AS SELECT ID,Parts,Name,Version,Value,Reality FROM Syouhin WHERE Parts = 'GPU' AND S1 = 1 ORDER BY ID ASC;
	--CREATE VIEW MyROM AS SELECT ID,Parts,Name,Version,Value,Reality FROM Syouhin WHERE Parts = 'メモリ' AND S1 = 1 ORDER BY ID ASC;
	--CREATE VIEW MySSD AS SELECT ID,Parts,Name,Version,Value,Reality FROM Syouhin WHERE Parts = 'SSD' AND S1 = 1 ORDER BY ID ASC;
	--CREATE VIEW MyFAN AS SELECT ID,Parts,Name,Version,Value,Reality FROM Syouhin WHERE Parts = 'FAN' AND S1 = 1 ORDER BY ID ASC;
	--CREATE VIEW MyPOW AS SELECT ID,Parts,Name,Version,Value,Reality FROM Syouhin WHERE Parts = 'Power' AND S1 = 1 ORDER BY ID ASC;


	/***  マスクデータ用  ***/

	--CREATE VIEW MyCPUi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'CPU' ORDER BY ID ASC;
	--CREATE VIEW MyGPUi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'GPU' ORDER BY ID ASC;
	--CREATE VIEW MyROMi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'メモリ' ORDER BY ID ASC;
	--CREATE VIEW MySSDi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'SSD' ORDER BY ID ASC;
	--CREATE VIEW MyFANi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'FAN' ORDER BY ID ASC;
	--CREATE VIEW MyPOWi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'Power' ORDER BY ID ASC;


	/***  実績解除用カラムのデータ更新  ***/

	--UPDATE Syouhin SET S0 = 1;
	--UPDATE Syouhin SET S1 = 1, S2 = 1, S3 = 1, S4 = 1, S5 = 1, S6 = 1 WHERE ID GLOB '[fp]00[0-7]';
	--UPDATE Syouhin SET Version = 'GBG-ssd2' WHERE ID GLOB 'p020';

	/***  CSVファイルからのインポート  ***/

--.import C:/HSP.git/SQL/Syouhin.csv Syouhin

--============================================================================--






	/***  確認用  ***/

	SELECT * FROM Syouhin;
	--SELECT * FROM masdata;

	--SELECT * FROM MyAll;
	--SELECT * FROM MyCPU;
	--SELECT * FROM MyGPU;
	--SELECT * FROM MyROM;
	--SELECT * FROM MySSD;
	--SELECT * FROM MyFAN;
	--SELECT * FROM MyPOW;

	--SELECT * FROM MyAlli;
	--SELECT * FROM MyCPUi;
	--SELECT * FROM MyGPUi;
	--SELECT * FROM MyROMi;
	--SELECT * FROM MySSDi;
	--SELECT * FROM MyFANi;
	--SELECT * FROM MyPOWi;

--============================================================================--

/*****  確認事項と管理  *****/


	--設定内容確認
--.show
--.databases

	--バージョン確認
	--SELECT sqlite_version();


	--メモリ解放
	--VACUUM;


	--テーブルの構造確認
--.schema
	--SELECT * FROM sqlite_master;


	--カラムの追加
	--ALTER TABLE Syouhin ADD COLUMN text;


	--ビューの削除
	--DROP VIEW MASTER;

--============================================================================--