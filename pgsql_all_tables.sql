/*

#Script adapted to work with PostgreSQL 9.2.5 and UMLS2018AA by Juan M. Banda (juan@jmbanda.com)
PostgreSQL load script authored and contributed by Steve Bedrick (bedricks@ohsu.edu).
Please point each 'COPY' statement to your local '/tmp/META' installation directory, or wherever you have stored the .RRF files output by MetamorphoSys. 
This script has been tested in PostgreSQL 8.2.3 on Mac OS 10.4.10

# The script can also work with PostgreSQL 11.2 and UMLS-2020AB by Zhao Zhengyang (tsingcheng1327@live.cn)
Thank you for Mr Banda and Mr Bedrick!
Please point each 'COPY' statement to your local '/tmp/META' installation directory, or wherever you have stored the .RRF files output by MetamorphoSys. 
This script has been tested in PostgreSQL 11.2 on Linux (Deepin 20.1, Debain 10 cored).

*/

create schema if not exists _2020ab;
set schema '_2020ab';

DROP TABLE if exists MRCOLS;
CREATE TABLE MRCOLS (
	COL	varchar(20),
	DES	varchar(200),
	REF	varchar(20),
	MIN	int,
	AV	numeric(5,2),
	MAX	int,
	FIL	varchar(50),
	DTY	varchar(20),
	dummy char(1)
);

COPY MRCOLS FROM '/media/yuebing/new_dev/umls/2020AB/META/MRCOLS.RRF' 
WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRCOLS DROP COLUMN dummy;


DROP TABLE if exists MRCONSO;
CREATE TABLE  MRCONSO (
	CUI	char(12) NOT NULL,
	LAT	char(3) NOT NULL,
	TS	char(1) NOT NULL,
	LUI	char(12) NOT NULL,
	STT	varchar(3) NOT NULL,
	SUI	char(12) NOT NULL,
	ISPREF	char(1) NOT NULL,
	AUI	varchar(9) NOT NULL,
	SAUI	varchar(50),
	SCUI	varchar(50),
	SDUI	varchar(50),
	SAB	varchar(20) NOT NULL,
	TTY	varchar(20) NOT NULL,
	CODE	varchar(100) NOT NULL,
	STR	text NOT NULL,
	SRL	int NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);

COPY MRCONSO FROM '/media/yuebing/new_dev/umls/2020AB/META/MRCONSO.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRCONSO DROP COLUMN dummy;


DROP TABLE if exists MRCUI;
CREATE TABLE MRCUI (
	CUI1	char(12) NOT NULL,
	VER	varchar(10) NOT NULL,
	REL	varchar(4) NOT NULL,
	RELA	varchar(100),
	MAPREASON	text,
	CUI2	char(12),
	MAPIN	char(1),
	dummy char(1)
);

COPY MRCUI FROM '/media/yuebing/new_dev/umls/2020AB/META/MRCUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRCUI DROP COLUMN dummy;


DROP TABLE if exists MRDEF;
CREATE TABLE MRDEF (
	CUI	char(12) NOT NULL,
	AUI	varchar(9) NOT NULL,
	ATUI	varchar(15) NOT NULL,
	SATUI	varchar(50),
	SAB	varchar(20) NOT NULL,
	DEF	text NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);

COPY MRDEF FROM '/media/yuebing/new_dev/umls/2020AB/META/MRDEF.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRDEF DROP COLUMN dummy;


DROP TABLE if exists MRDOC;
CREATE TABLE MRDOC (
	DOCKEY	varchar(50) NOT NULL,
	VALUE	varchar(200),
	TYPE	varchar(50) NOT NULL,
	EXPL	text,
	dummy char(1)
);

COPY MRDOC FROM '/media/yuebing/new_dev/umls/2020AB/META/MRDOC.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRDOC DROP COLUMN dummy;


DROP TABLE if exists MRFILES;
CREATE TABLE MRFILES (
	FIL	varchar(50),
	DES	varchar(200),
	FMT	text,
	CLS	int,
	RWS	int,
	BTS	bigint,
	dummy char(1)
);

COPY MRFILES FROM '/media/yuebing/new_dev/umls/2020AB/META/MRFILES.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRFILES DROP COLUMN dummy;


DROP TABLE if exists MRHIER;
CREATE TABLE MRHIER (
	CUI	char(12) NOT NULL,
	AUI	varchar(9) NOT NULL,
	CXN	int NOT NULL,
	PAUI	varchar(9),
	SAB	varchar(20) NOT NULL,
	RELA	varchar(100),
	PTR	text,
	HCD	varchar(70),
	CVF	int,
	dummy char(1)
);

COPY MRHIER FROM '/media/yuebing/new_dev/umls/2020AB/META//MRHIER.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRHIER DROP COLUMN dummy;


DROP TABLE if exists MRHIST;
CREATE TABLE MRHIST (
	CUI	char(12) NOT NULL,
	SOURCEUI	varchar(50) NOT NULL,
	SAB	varchar(20) NOT NULL,
	SVER	varchar(20) NOT NULL,
	CHANGETYPE	text NOT NULL,
	CHANGEKEY	text NOT NULL,
	CHANGEVAL	text NOT NULL,
	REASON	text,
	CVF	int,
	dummy char(1)
);

COPY MRHIST FROM '/media/yuebing/new_dev/umls/2020AB/META//MRHIST.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRHIST DROP COLUMN dummy;


DROP TABLE if exists MRMAP;
CREATE TABLE MRMAP (
	MAPSETCUI	char(12),
	MAPSETSAB	varchar(20),
	MAPSUBSETID	varchar(10),
	MAPRANK	int,
	MAPID	varchar(50),
	MAPSID	varchar(50),
	FROMID	varchar(50),
	FROMSID	varchar(50),
	FROMEXPR	text,
	FROMTYPE	varchar(50),
	FROMRULE	text,
	FROMRES	text,
	REL	varchar(4),
	RELA	varchar(100),
	TOID	varchar(50),
	TOSID	varchar(50),
	TOEXPR	text,
	TOTYPE	varchar(50),
	TORULE	text,
	TORES	text,
	MAPRULE	text,
	MAPRES	text,
	MAPTYPE	varchar(50),
	MAPATN	varchar(20),
	MAPATV	text,
	CVF	int,
	dummy char(1)
);
COPY MRMAP FROM '/media/yuebing/new_dev/umls/2020AB/META/MRMAP.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRMAP DROP COLUMN dummy;


DROP TABLE if exists MRRANK;
CREATE TABLE MRRANK (
	RANK	int NOT NULL,
	SAB	varchar(20) NOT NULL,
	TTY	varchar(20) NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	dummy char(1)
);
COPY MRRANK FROM '/media/yuebing/new_dev/umls/2020AB/META/MRRANK.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRRANK DROP COLUMN dummy;


DROP TABLE if exists MRREL;
CREATE TABLE MRREL (
	CUI1	char(12) NOT NULL,
	AUI1	varchar(9),
	STYPE1	varchar(50) NOT NULL,
	REL	varchar(4) NOT NULL,
	CUI2	char(12) NOT NULL,
	AUI2	varchar(9),
	STYPE2	varchar(50) NOT NULL,
	RELA	varchar(100),
	RUI	varchar(10) NOT NULL,
	SRUI	varchar(50),
	SAB	varchar(20) NOT NULL,
	SL	varchar(20) NOT NULL,
	RG	varchar(10),
	DIR	varchar(1),
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);

COPY MRREL FROM '/media/yuebing/new_dev/umls/2020AB/META/MRREL.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRREL DROP COLUMN dummy;

DROP TABLE if exists MRSAB;
CREATE TABLE MRSAB (
	VCUI	char(12),
	RCUI	char(12),
	VSAB	varchar(50) NOT NULL,
	RSAB	varchar(20) NOT NULL,
	SON	text NOT NULL,
	SF	varchar(20) NOT NULL,
	SVER	varchar(20),
	VSTART	char(10),
	VEND	char(10),
	IMETA	varchar(10) NOT NULL,
	RMETA	varchar(10),
	SLC	text,
	SCC	text,
	SRL	int NOT NULL,
	TFR	int,
	CFR	int,
	CXTY	varchar(50),
	TTYL	varchar(200),
	ATNL	text,
	LAT	char(3),
	CENC	varchar(20) NOT NULL,
	CURVER	char(1) NOT NULL,
	SABIN	char(1) NOT NULL,
	SSN	text NOT NULL,
	SCIT	text NOT NULL,
	dummy char(1)
);
COPY MRSAB FROM '/media/yuebing/new_dev/umls/2020AB/META/MRSAB.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSAB DROP COLUMN dummy;


DROP TABLE if exists MRSAT;
CREATE TABLE MRSAT (
	CUI	char(12) NOT NULL,
	LUI	char(12),
	SUI	char(12),
	METAUI	varchar(50),
	STYPE	varchar(50) NOT NULL,
	CODE	varchar(50),
	ATUI	varchar(15) NOT NULL,
	SATUI	varchar(50),
	ATN	varchar(80) NOT NULL,
	SAB	varchar(20) NOT NULL,
	ATV	text,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);
COPY MRSAT FROM '/media/yuebing/new_dev/umls/2020AB/META//MRSAT.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSAT DROP COLUMN dummy;


DROP TABLE if exists MRSMAP;
CREATE TABLE MRSMAP (
	MAPSETCUI	char(12),
	MAPSETSAB	varchar(20),
	MAPID	varchar(50),
	MAPSID	varchar(50),
	FROMEXPR	text,
	FROMTYPE	varchar(50),
	REL	varchar(4),
	RELA	varchar(100),
	TOEXPR	text,
	TOTYPE	varchar(50),
	CVF	int,
	dummy char(1)
);
COPY MRSMAP FROM '/media/yuebing/new_dev/umls/2020AB/META/MRSMAP.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSMAP DROP COLUMN dummy;


DROP TABLE if exists MRSTY;
CREATE TABLE MRSTY (
	CUI	char(12) NOT NULL,
	TUI	char(4) NOT NULL,
	STN	varchar(100) NOT NULL,
	STY	varchar(50) NOT NULL,
	ATUI	varchar(15) NOT NULL,
	CVF	int,
	dummy char(1)
);
COPY MRSTY FROM '/media/yuebing/new_dev/umls/2020AB/META/MRSTY.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSTY DROP COLUMN dummy;


DROP TABLE if exists MRXNS_ENG;
CREATE TABLE MRXNS_ENG (
	LAT	char(3) NOT NULL,
	NSTR	text NOT NULL,
	CUI	char(12) NOT NULL,
	LUI	char(12) NOT NULL,
	SUI	char(12) NOT NULL,
	dummy char(1)
);
COPY MRXNS_ENG FROM '/media/yuebing/new_dev/umls/2020AB/META/MRXNS_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRXNS_ENG DROP COLUMN dummy;


DROP TABLE if exists MRXNW_ENG;
CREATE TABLE MRXNW_ENG (
	LAT	char(3) NOT NULL,
	NWD	varchar(100) NOT NULL,
	CUI	char(12) NOT NULL,
	LUI	char(12) NOT NULL,
	SUI	char(12) NOT NULL,
	dummy char(1)
);
COPY MRXNW_ENG FROM '/media/yuebing/new_dev/umls/2020AB/META/MRXNW_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRXNW_ENG DROP COLUMN dummy;

DROP TABLE if exists MRAUI;
CREATE TABLE MRAUI (
	AUI1	varchar(9) NOT NULL,
	CUI1	char(12) NOT NULL,
	VER	varchar(10) NOT NULL,
	REL	varchar(4),
	RELA	varchar(100),
	MAPREASON	text NOT NULL,
	AUI2	varchar(9) NOT NULL,
	CUI2	char(12) NOT NULL,
	MAPIN	char(1) NOT NULL,
	dummy char(1)
);
COPY MRAUI FROM '/media/yuebing/new_dev/umls/2020AB/META//MRAUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRAUI DROP COLUMN dummy;


DROP TABLE if exists AMBIGSUI;
CREATE TABLE AMBIGSUI (
	SUI	char(12) NOT NULL,
	CUI	char(12) NOT NULL,
	dummy char(1)
);

COPY AMBIGSUI FROM '/media/yuebing/new_dev/umls/2020AB/META/AMBIGSUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE AMBIGSUI DROP COLUMN dummy;


DROP TABLE if exists AMBIGLUI;
CREATE TABLE AMBIGLUI (
	LUI	char(12) NOT NULL,
	CUI	char(12) NOT NULL,
	dummy char(1)
);

COPY AMBIGLUI FROM '/tmp/META/AMBIGLUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE AMBIGLUI DROP COLUMN dummy;


DROP TABLE if exists DELETEDCUI;
CREATE TABLE DELETEDCUI (
	PCUI	char(12) NOT NULL,
	PSTR	text NOT NULL,
	dummy char(1)
);
COPY DELETEDCUI FROM '/media/yuebing/new_dev/umls/2020AB/META/CHANGE/DELETEDCUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE DELETEDCUI DROP COLUMN dummy;


DROP TABLE if exists DELETEDLUI;
CREATE TABLE DELETEDLUI (
	PLUI	char(12) NOT NULL,
	PSTR	text NOT NULL,
	dummy char(1)
);
COPY DELETEDLUI FROM '/media/yuebing/new_dev/umls/2020AB/META/CHANGE/DELETEDLUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE DELETEDLUI DROP COLUMN dummy;

DROP TABLE if exists DELETEDSUI;
CREATE TABLE DELETEDSUI (
	PSUI	char(12) NOT NULL,
	LAT	char(3) NOT NULL,
	PSTR	text NOT NULL,
	dummy char(1)
);
COPY DELETEDSUI FROM '/media/yuebing/new_dev/umls/2020AB/META/CHANGE/DELETEDSUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE DELETEDSUI DROP COLUMN dummy;


DROP TABLE if exists MERGEDCUI;
CREATE TABLE MERGEDCUI (
	PCUI	char(12) NOT NULL,
	CUI	char(12) NOT NULL,
	dummy char(1)
);
COPY MERGEDCUI FROM '/media/yuebing/new_dev/umls/2020AB/META/CHANGE/MERGEDCUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MERGEDCUI DROP COLUMN dummy;


DROP TABLE if exists MERGEDLUI;
CREATE TABLE MERGEDLUI (
	PLUI	char(12),
	LUI	char(12),
	dummy char(1)
);
COPY MERGEDLUI FROM '/media/yuebing/new_dev/umls/2020AB/META/CHANGE/MERGEDLUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MERGEDLUI DROP COLUMN dummy;