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

--テーブルの構造確認
--.schema
--SELECT * FROM sqlite_master;
--バージョン確認
	--SELECT sqlite_version();
--メモリ解放
	--VACUUM;
--カラムの追加
--	ALTER TABLE Syouhin ADD COLUMN text;

	--CREATE VIEW MyAll AS SELECT ID,Parts,Name,Version,Value,Reality FROM "Syouhin" ORDER BY ID ASC;
	--CREATE VIEW MyAlli AS SELECT ID,seinou,hosei FROM "Syouhin" ORDER BY ID ASC;
	--CREATE VIEW masdata AS SELECT ID,S0,S1,s2,S3,S4,S5,S6 FROM "Syouhin" ORDER BY ID ASC;

	--CREATE VIEW MyCPU AS SELECT ID,Parts,Name,Version,Value,Reality FROM "Syouhin" WHERE Parts = 'CPU' AND S1 = 1 ORDER BY ID ASC;
	--CREATE VIEW MyGPU AS SELECT ID,Parts,Name,Version,Value,Reality FROM Syouhin WHERE Parts = 'GPU' AND S1 = 1 ORDER BY ID ASC;
	--CREATE VIEW MyROM AS SELECT ID,Parts,Name,Version,Value,Reality FROM Syouhin WHERE Parts = 'メモリ' AND S1 = 1 ORDER BY ID ASC;

	--CREATE VIEW MyCPUi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'CPU' ORDER BY ID ASC;
	--CREATE VIEW MyGPUi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'GPU' ORDER BY ID ASC;
	--CREATE VIEW MyROMi AS SELECT ID, seinou, hosei FROM "Syouhin" WHERE Parts = 'メモリ' ORDER BY ID ASC;

	--SELECT * FROM masdata;
	SELECT * FROM Syouhin;




	UPDATE Syouhin SET S1 = 1 WHERE ID GLOB '[crg]006';
	SELECT * FROM MyCPU;
	SELECT * FROM MyGPU;
	SELECT * FROM MyROM;