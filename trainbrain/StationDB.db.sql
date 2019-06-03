BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "ExitEntity" (
	"exitType"	TEXT,
	"carriageNumber"	INTEGER,
	"doorNumber"	INTEGER,
	"platform"	INTEGER,
	"station"	INTEGER,
	"exitID"	INTEGER,
	"platformID"	INTEGER,
	PRIMARY KEY("exitID"),
	FOREIGN KEY("platformID") REFERENCES "PlatformEntity"("platformID")
);
CREATE TABLE IF NOT EXISTS "PlatformEntity" (
	"number"	INTEGER,
	"exits"	INTEGER,
	"station"	TEXT,
	"platformID"	INTEGER,
	"stationID"	INTEGER,
	PRIMARY KEY("platformID"),
	FOREIGN KEY("stationID") REFERENCES "StationEntity"("stationID")
);
CREATE TABLE IF NOT EXISTS "StationEntity" (
	"name"	TEXT,
	"platforms"	INTEGER,
	"stationID"	INTEGER,
	PRIMARY KEY("stationID")
);
INSERT INTO "ExitEntity" VALUES ('elevator',1,2,1,'Summer Hill',1,1);
INSERT INTO "ExitEntity" VALUES ('elevator',8,1,2,'Summer Hill',2,2);
INSERT INTO "ExitEntity" VALUES ('stairs',2,2,1,'Summer Hill',3,1);
INSERT INTO "ExitEntity" VALUES ('stairs',6,1,2,'Summer Hill',4,2);
INSERT INTO "ExitEntity" VALUES ('elevator',4,1,1,'Newtown',5,5);
INSERT INTO "ExitEntity" VALUES ('elevator',4,2,2,'Newtown',6,6);
INSERT INTO "ExitEntity" VALUES ('stairs',3,1,1,'Newtown',7,5);
INSERT INTO "ExitEntity" VALUES ('stairs',5,2,2,'Newtown',8,6);
INSERT INTO "ExitEntity" VALUES ('stairs',8,2,1,'Rockdale',9,3);
INSERT INTO "ExitEntity" VALUES ('elevator',8,2,1,'Rockdale',10,3);
INSERT INTO "ExitEntity" VALUES ('stairs',2,1,2,'Rockdale',11,4);
INSERT INTO "ExitEntity" VALUES ('elevator',1,2,2,'Rockdale',12,4);
INSERT INTO "ExitEntity" VALUES ('stairs',8,2,1,'Kogarah',13,7);
INSERT INTO "ExitEntity" VALUES ('elevator',2,1,1,'Kogarah',14,7);
INSERT INTO "ExitEntity" VALUES ('stairs',2,1,2,'Kogarah',15,8);
INSERT INTO "ExitEntity" VALUES ('elevator',1,2,2,'Kogarah',16,8);
INSERT INTO "PlatformEntity" VALUES (2,2,'Summer Hill',1,1);
INSERT INTO "PlatformEntity" VALUES (1,2,'Summer Hill',2,1);
INSERT INTO "PlatformEntity" VALUES (1,2,'Newtown',3,4);
INSERT INTO "PlatformEntity" VALUES (2,2,'Newtown',4,4);
INSERT INTO "PlatformEntity" VALUES (1,2,'Rockdale',5,2);
INSERT INTO "PlatformEntity" VALUES (2,2,'Rockdale',6,2);
INSERT INTO "PlatformEntity" VALUES (1,2,'Kogarah',7,3);
INSERT INTO "PlatformEntity" VALUES (2,2,'Kogarah',8,3);
INSERT INTO "StationEntity" VALUES ('Summer Hill',2,1);
INSERT INTO "StationEntity" VALUES ('Rockdale',4,2);
INSERT INTO "StationEntity" VALUES ('Kogarah',2,3);
INSERT INTO "StationEntity" VALUES ('Newtown',2,4);
COMMIT;
