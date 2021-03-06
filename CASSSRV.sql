/******************************************************************************/
/***         Generated by IBExpert 2013.9.17.1 02.07.2014 11:02:54          ***/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1251;

SET CLIENTLIB 'C:\CassSrv\gds32.dll';

CREATE DATABASE '127.0.0.1/3053:C:\CassSrv\Data\CASSSRVDB.GDB'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 4096
DEFAULT CHARACTER SET WIN1251 COLLATION WIN1251;



/******************************************************************************/
/***                               Generators                               ***/
/******************************************************************************/

CREATE GENERATOR GEN_BARCODES_ID;
SET GENERATOR GEN_BARCODES_ID TO 18864;

CREATE GENERATOR GEN_DEPARTS_ID;
SET GENERATOR GEN_DEPARTS_ID TO 3;

CREATE GENERATOR GEN_DEPPRICE_ID;
SET GENERATOR GEN_DEPPRICE_ID TO 11776;

CREATE GENERATOR GEN_ECRGOODS_ID;
SET GENERATOR GEN_ECRGOODS_ID TO 1;

CREATE GENERATOR GEN_ECRPAYS_ID;
SET GENERATOR GEN_ECRPAYS_ID TO 125875;

CREATE GENERATOR GEN_ECRSELLS_ID;
SET GENERATOR GEN_ECRSELLS_ID TO 420690;

CREATE GENERATOR GEN_ECRS_ID;
SET GENERATOR GEN_ECRS_ID TO 1;

CREATE GENERATOR GEN_GOODS_ID;
SET GENERATOR GEN_GOODS_ID TO 11776;

CREATE GENERATOR GEN_HOURS_ID;
SET GENERATOR GEN_HOURS_ID TO 24;

CREATE GENERATOR GEN_PORTS_ID;
SET GENERATOR GEN_PORTS_ID TO 2;

CREATE GENERATOR GEN_TAXES_ID;
SET GENERATOR GEN_TAXES_ID TO 3;



SET TERM ^ ; 



/******************************************************************************/
/***                           Stored Procedures                            ***/
/******************************************************************************/

CREATE PROCEDURE ADD_BARCODE (
    IMTU INTEGER,
    BARCODE VARCHAR(13),
    ZOOM DOUBLE PRECISION,
    CHANGE INTEGER)
RETURNS (
    RES INTEGER)
AS
BEGIN
  SUSPEND;
END^





CREATE PROCEDURE ADD_GOODS (
    CODE INTEGER,
    IMTU INTEGER,
    IED INTEGER,
    NAME VARCHAR(30),
    ANYPRICE CHAR(1),
    CHCKINT CHAR(1),
    CHCKCNT CHAR(1))
RETURNS (
    RES INTEGER)
AS
BEGIN
  SUSPEND;
END^





CREATE PROCEDURE ADD_PRICE (
    IMTU INTEGER,
    DEPART INTEGER,
    PRICE DOUBLE PRECISION,
    TAXID INTEGER)
RETURNS (
    RES INTEGER)
AS
BEGIN
  SUSPEND;
END^





CREATE PROCEDURE INSERT_CHECK (
    SERNUMBER INTEGER,
    MOMENT TIMESTAMP,
    CHKNUMBER INTEGER,
    SUMM DOUBLE PRECISION,
    KIND INTEGER,
    OPER INTEGER)
RETURNS (
    RES INTEGER)
AS
BEGIN
  SUSPEND;
END^





CREATE PROCEDURE UPD_BARCODES
AS
BEGIN
  EXIT;
END^





CREATE PROCEDURE UPD_DEPPRICES
AS
BEGIN
  EXIT;
END^





CREATE PROCEDURE UPD_GOODS
AS
BEGIN
  EXIT;
END^





CREATE PROCEDURE UPDATE_CHECK (
    ID INTEGER,
    SERNUMBER INTEGER,
    MOMENT TIMESTAMP,
    CHKNUMBER INTEGER,
    SUMM DOUBLE PRECISION,
    KIND INTEGER,
    OPER INTEGER)
RETURNS (
    RES INTEGER)
AS
BEGIN
  SUSPEND;
END^






SET TERM ; ^



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE "BarCodes" (
    ID       INTEGER NOT NULL,
    GOODSID  INTEGER NOT NULL,
    BARCODE  VARCHAR(13) NOT NULL,
    ZOOM     DOUBLE PRECISION
);

CREATE TABLE "Departs" (
    ID      INTEGER NOT NULL,
    NUMBER  INTEGER NOT NULL,
    NAME    VARCHAR(40) NOT NULL
);

CREATE TABLE "DepPrice" (
    ID        INTEGER NOT NULL,
    DEPARTID  INTEGER NOT NULL,
    GOODSID   INTEGER NOT NULL,
    PRICE     DOUBLE PRECISION NOT NULL,
    TAXID     INTEGER
);

CREATE TABLE "EcrGoods" (
    ID         INTEGER NOT NULL,
    SERNUMBER  INTEGER NOT NULL,
    ECRLINE    INTEGER NOT NULL,
    CODE       INTEGER,
    NAME       VARCHAR(22),
    PRICE      DOUBLE PRECISION,
    QUANTITY   DOUBLE PRECISION,
    DEPNUMBER  SMALLINT,
    GRPNUMBER  SMALLINT,
    TAXNUMBER  SMALLINT,
    ANYPRICE   SMALLINT,
    CHKCOUNT   SMALLINT,
    BARCODE    VARCHAR(13),
    MOMENT     TIMESTAMP,
    GOODSID    INTEGER
);

CREATE TABLE "EcrPays" (
    ID         INTEGER NOT NULL,
    MOMENT     TIMESTAMP NOT NULL,
    SERNUMBER  INTEGER NOT NULL,
    CHKNUMBER  INTEGER,
    SUMMA      DOUBLE PRECISION,
    ADDITION   DOUBLE PRECISION,
    DISCOUNT   DOUBLE PRECISION,
    TOTAL      DOUBLE PRECISION,
    PAYCASH    DOUBLE PRECISION,
    PAYCHECK   DOUBLE PRECISION,
    PAYCREDIT  DOUBLE PRECISION,
    PAYCARD    DOUBLE PRECISION,
    PAYSUM     DOUBLE PRECISION,
    DEPART     INTEGER,
    EXPORTED   SMALLINT,
    OPER       INTEGER
);

CREATE TABLE "Ecrs" (
    ID         INTEGER NOT NULL,
    SERNUMBER  INTEGER NOT NULL,
    NAME       VARCHAR(40) NOT NULL,
    DEPARTID   INTEGER NOT NULL,
    COMMENT    BLOB SUB_TYPE 1 SEGMENT SIZE 128,
    PORTID     INTEGER,
    NUMBER     SMALLINT NOT NULL,
    OFF        SMALLINT DEFAULT 0 NOT NULL
);

CREATE TABLE "EcrSells" (
    ID         INTEGER NOT NULL,
    MOMENT     TIMESTAMP NOT NULL,
    SERNUMBER  INTEGER NOT NULL,
    GOODSID    INTEGER,
    ECRCODE    INTEGER NOT NULL,
    PRICE      DOUBLE PRECISION NOT NULL,
    QUANTITY   DOUBLE PRECISION NOT NULL,
    SUMMA      DOUBLE PRECISION NOT NULL,
    ADDITION   DOUBLE PRECISION DEFAULT 0.00,
    DISCOUNT   DOUBLE PRECISION DEFAULT 0.00,
    TOTAL      DOUBLE PRECISION NOT NULL,
    TAXNUMBER  SMALLINT NOT NULL,
    TAXSUM     DOUBLE PRECISION DEFAULT 0.00,
    EXPORTED   SMALLINT,
    DEPART     INTEGER,
    ECRDEPART  INTEGER,
    CHECKED    CHAR(1) DEFAULT 'F',
    OFFLINE    CHAR(1) DEFAULT 'F',
    ECRPAYID   INTEGER,
    CHKNUMBER  INTEGER
);

CREATE TABLE "Goods" (
    ID          INTEGER NOT NULL,
    CODE        INTEGER NOT NULL,
    NAME        VARCHAR(120) NOT NULL,
    ECRNAME     VARCHAR(30) NOT NULL,
    PRODUCER    VARCHAR(40),
    DEFPRICE    DOUBLE PRECISION,
    TAXID       INTEGER,
    DEPART      INTEGER,
    DISABLED    CHAR(1) DEFAULT 'F',
    CHKINTEGER  CHAR(1) DEFAULT 'F',
    ANYPRICE    CHAR(1) DEFAULT 'F',
    CHKCOUNT    CHAR(1) DEFAULT 'F',
    ISSERVICE   CHAR(1) DEFAULT 'F',
    COMMENT     BLOB SUB_TYPE 1 SEGMENT SIZE 128,
    ARTICUL     VARCHAR(15),
    INCRMTU     INTEGER,
    INCRED      INTEGER
);

CREATE TABLE "Hours" (
    ID     INTEGER NOT NULL,
    ZHOUR  SMALLINT NOT NULL
);

CREATE TABLE "Ports" (
    ID          INTEGER NOT NULL,
    NUMBER      INTEGER NOT NULL,
    BAUDNUMBER  INTEGER NOT NULL,
    PROTOCOL    VARCHAR(20) NOT NULL
);

CREATE TABLE "Taxes" (
    ID        INTEGER NOT NULL,
    NUMBER    SMALLINT NOT NULL,
    NAME      VARCHAR(40) NOT NULL,
    TAXVALUE  DOUBLE PRECISION
);



/******************************************************************************/
/***                           Unique Constraints                           ***/
/******************************************************************************/

ALTER TABLE "BarCodes" ADD UNIQUE (BARCODE);
ALTER TABLE "Departs" ADD UNIQUE (NUMBER);
ALTER TABLE "Ecrs" ADD UNIQUE (SERNUMBER);
ALTER TABLE "Goods" ADD UNIQUE (CODE);
ALTER TABLE "Hours" ADD UNIQUE (ZHOUR);
ALTER TABLE "Taxes" ADD UNIQUE (NUMBER);


/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE "BarCodes" ADD PRIMARY KEY (ID);
ALTER TABLE "DepPrice" ADD PRIMARY KEY (ID);
ALTER TABLE "Departs" ADD PRIMARY KEY (ID);
ALTER TABLE "EcrGoods" ADD PRIMARY KEY (ID);
ALTER TABLE "EcrPays" ADD PRIMARY KEY (ID);
ALTER TABLE "EcrSells" ADD PRIMARY KEY (ID);
ALTER TABLE "Ecrs" ADD PRIMARY KEY (ID);
ALTER TABLE "Goods" ADD PRIMARY KEY (ID);
ALTER TABLE "Hours" ADD PRIMARY KEY (ID);
ALTER TABLE "Ports" ADD PRIMARY KEY (ID);
ALTER TABLE "Taxes" ADD PRIMARY KEY (ID);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE "BarCodes" ADD CONSTRAINT FK$47$49$6$7 FOREIGN KEY (GOODSID) REFERENCES "Goods" (ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DepPrice" ADD CONSTRAINT FK$46A$46C$3C$3D FOREIGN KEY (DEPARTID) REFERENCES "Departs" (ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DepPrice" ADD CONSTRAINT FK$46A$46D$6$7 FOREIGN KEY (GOODSID) REFERENCES "Goods" (ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "EcrGoods" ADD CONSTRAINT FK$2C6$2D0$1F$21 FOREIGN KEY (SERNUMBER) REFERENCES "Ecrs" (SERNUMBER) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "EcrGoods" ADD CONSTRAINT FK$2C6$2D4$6$7 FOREIGN KEY (GOODSID) REFERENCES "Goods" (ID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "EcrPays" ADD CONSTRAINT FK$7A$7E$1F$21 FOREIGN KEY (SERNUMBER) REFERENCES "Ecrs" (SERNUMBER) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "EcrPays" ADD CONSTRAINT FK$7A$B9$3C$61 FOREIGN KEY (DEPART) REFERENCES "Departs" (NUMBER) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "EcrSells" ADD CONSTRAINT FK$7C$8D$1F$21 FOREIGN KEY (SERNUMBER) REFERENCES "Ecrs" (SERNUMBER) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "EcrSells" ADD CONSTRAINT FK$7C$8E$6$7 FOREIGN KEY (GOODSID) REFERENCES "Goods" (ID) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "EcrSells" ADD CONSTRAINT FK$7C$95$D$50 FOREIGN KEY (TAXNUMBER) REFERENCES "Taxes" (NUMBER) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "EcrSells" ADD CONSTRAINT FK$7C$96$7A$7B FOREIGN KEY (ECRPAYID) REFERENCES "EcrPays" (ID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "EcrSells" ADD CONSTRAINT FK$7C$EF$3C$61 FOREIGN KEY (DEPART) REFERENCES "Departs" (NUMBER) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "EcrSells" ADD CONSTRAINT FK$7C$F0$3C$61 FOREIGN KEY (ECRDEPART) REFERENCES "Departs" (NUMBER) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "Ecrs" ADD CONSTRAINT FK$1F$3E$3C$3D FOREIGN KEY (DEPARTID) REFERENCES "Departs" (ID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "Ecrs" ADD CONSTRAINT FK$1F$D9$58$60 FOREIGN KEY (PORTID) REFERENCES "Ports" (ID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "Goods" ADD CONSTRAINT FK$6$1C$D$E FOREIGN KEY (TAXID) REFERENCES "Taxes" (ID) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "Goods" ADD CONSTRAINT FK$6$433$3C$61 FOREIGN KEY (DEPART) REFERENCES "Departs" (NUMBER) ON DELETE SET NULL ON UPDATE CASCADE;


/******************************************************************************/
/***                                Indices                                 ***/
/******************************************************************************/

CREATE UNIQUE DESCENDING INDEX DIX_BARCODES_BARCODE ON "BarCodes" (BARCODE);
CREATE UNIQUE INDEX DIX_BARCODES_ID ON "BarCodes" (ID);
CREATE UNIQUE INDEX IX_BARCODES_BARCODE ON "BarCodes" (BARCODE);
CREATE UNIQUE INDEX DIX_DEPPRICE_ID ON "DepPrice" (ID);
CREATE UNIQUE INDEX UIX_DEPPRICE_235 ON "DepPrice" (DEPARTID, GOODSID);
CREATE UNIQUE INDEX DIX_DEPARTS_ID ON "Departs" (ID);
CREATE UNIQUE DESCENDING INDEX DIX_DEPARTS_NUMBER ON "Departs" (NUMBER);
CREATE INDEX IX_DEPARTS_NAME ON "Departs" (NAME);
CREATE UNIQUE INDEX IX_DEPARTS_NUMBER ON "Departs" (NUMBER);
CREATE DESCENDING INDEX DIX_ECRGOODS_CODE ON "EcrGoods" (CODE);
CREATE DESCENDING INDEX DIX_ECRGOODS_ECRLINE ON "EcrGoods" (ECRLINE);
CREATE UNIQUE INDEX DIX_ECRGOODS_ID ON "EcrGoods" (ID);
CREATE DESCENDING INDEX DIX_ECRGOODS_SERNUMBER ON "EcrGoods" (SERNUMBER);
CREATE INDEX IX_ECRGOODS_BARCODE ON "EcrGoods" (BARCODE);
CREATE INDEX IX_ECRGOODS_CODE ON "EcrGoods" (CODE);
CREATE INDEX IX_ECRGOODS_ECRLINE ON "EcrGoods" (ECRLINE);
CREATE INDEX IX_ECRGOODS_MOMENT ON "EcrGoods" (MOMENT);
CREATE INDEX IX_ECRGOODS_NAME ON "EcrGoods" (NAME);
CREATE INDEX IX_ECRGOODS_SERNUMBER ON "EcrGoods" (SERNUMBER);
CREATE UNIQUE INDEX UIX_ECRGOODS_734 ON "EcrGoods" (SERNUMBER, ECRLINE);
CREATE UNIQUE INDEX DIX_ECRPAYS_ID ON "EcrPays" (ID);
CREATE INDEX IX_ECRPAYS_CHKNUMBER ON "EcrPays" (CHKNUMBER);
CREATE INDEX IX_ECRPAYS_MOMENT ON "EcrPays" (MOMENT);
CREATE INDEX IX_ECRPAYS_SERNUMBER ON "EcrPays" (SERNUMBER);
CREATE DESCENDING INDEX DIX_ECRSELLS_ECRCODE ON "EcrSells" (ECRCODE);
CREATE UNIQUE INDEX DIX_ECRSELLS_ID ON "EcrSells" (ID);
CREATE INDEX IX_ECRSELLS_ECRCODE ON "EcrSells" (ECRCODE);
CREATE INDEX IX_ECRSELLS_MOMENT ON "EcrSells" (MOMENT);
CREATE UNIQUE INDEX DIX_ECRS_ID ON "Ecrs" (ID);
CREATE UNIQUE DESCENDING INDEX DIX_ECRS_SERNUMBER ON "Ecrs" (SERNUMBER);
CREATE INDEX IX_ECRS_NAME ON "Ecrs" (NAME);
CREATE UNIQUE INDEX IX_ECRS_SERNUMBER ON "Ecrs" (SERNUMBER);
CREATE UNIQUE DESCENDING INDEX DIX_GOODS_CODE ON "Goods" (CODE);
CREATE UNIQUE INDEX DIX_GOODS_ID ON "Goods" (ID);
CREATE INDEX IX_GOODS_ARTICUL ON "Goods" (ARTICUL);
CREATE UNIQUE INDEX IX_GOODS_CODE ON "Goods" (CODE);
CREATE INDEX IX_GOODS_DEFPRICE ON "Goods" (DEFPRICE);
CREATE INDEX IX_GOODS_NAME ON "Goods" (NAME);
CREATE UNIQUE INDEX DIX_HOURS_ID ON "Hours" (ID);
CREATE UNIQUE DESCENDING INDEX DIX_HOURS_ZHOUR ON "Hours" (ZHOUR);
CREATE UNIQUE INDEX IX_HOURS_ZHOUR ON "Hours" (ZHOUR);
CREATE UNIQUE DESCENDING INDEX DIX_PORTS_NUMBER ON "Ports" (NUMBER);
CREATE UNIQUE INDEX IX_PORTS_ID ON "Ports" (ID);
CREATE UNIQUE INDEX IX_PORTS_NUMBER ON "Ports" (NUMBER);
CREATE UNIQUE INDEX DIX_TAXES_ID ON "Taxes" (ID);
CREATE UNIQUE DESCENDING INDEX DIX_TAXES_NUMBER ON "Taxes" (NUMBER);
CREATE INDEX IX_TAXES_NAME ON "Taxes" (NAME);
CREATE UNIQUE INDEX IX_TAXES_NUMBER ON "Taxes" (NUMBER);


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: AIT_BARCODES */
CREATE TRIGGER AIT_BARCODES FOR "BarCodes"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_BARCODES_ID, 1);
END
^

/* Trigger: AIT_DEPARTS */
CREATE TRIGGER AIT_DEPARTS FOR "Departs"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_DEPARTS_ID, 1);
END
^

/* Trigger: AIT_DEPPRICE */
CREATE TRIGGER AIT_DEPPRICE FOR "DepPrice"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_DEPPRICE_ID, 1);
END
^

/* Trigger: AIT_ECRGOODS */
CREATE TRIGGER AIT_ECRGOODS FOR "EcrGoods"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_ECRGOODS_ID, 1);
END
^

/* Trigger: AIT_ECRPAYS */
CREATE TRIGGER AIT_ECRPAYS FOR "EcrPays"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_ECRPAYS_ID, 1);
if (NEW.moment IS NULL) then NEW.moment = 'NOW';
END
^

/* Trigger: AIT_ECRS */
CREATE TRIGGER AIT_ECRS FOR "Ecrs"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_ECRS_ID, 1);
END
^

/* Trigger: AIT_ECRSELLS */
CREATE TRIGGER AIT_ECRSELLS FOR "EcrSells"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_ECRSELLS_ID, 1);
IF (NEW.MOMENT IS NULL) THEN NEW.MOMENT = 'NOW';
END
^

/* Trigger: AIT_GOODS */
CREATE TRIGGER AIT_GOODS FOR "Goods"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_GOODS_ID, 1);
END
^

/* Trigger: AIT_HOURS */
CREATE TRIGGER AIT_HOURS FOR "Hours"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_HOURS_ID, 1);
END
^

/* Trigger: AIT_PORTS */
CREATE TRIGGER AIT_PORTS FOR "Ports"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_PORTS_ID, 1);
END
^

/* Trigger: AIT_TAXES */
CREATE TRIGGER AIT_TAXES FOR "Taxes"
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
IF (NEW.ID IS NULL) THEN NEW.ID = GEN_ID(GEN_TAXES_ID, 1);
END
^

/* Trigger: CHT_DEL_DEPARTS */
CREATE TRIGGER CHT_DEL_DEPARTS FOR "Departs"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'DEPARTS_DELETE'; END
^

/* Trigger: CHT_DEL_ECRGOODS */
CREATE TRIGGER CHT_DEL_ECRGOODS FOR "EcrGoods"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'ECRGOODS_DELETE'; END
^

/* Trigger: CHT_DEL_ECRPAYS */
CREATE TRIGGER CHT_DEL_ECRPAYS FOR "EcrPays"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'ECRPAYS_DELETE'; END
^

/* Trigger: CHT_DEL_ECRS */
CREATE TRIGGER CHT_DEL_ECRS FOR "Ecrs"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'ECRS_DELETE'; END
^

/* Trigger: CHT_DEL_ECRSELLS */
CREATE TRIGGER CHT_DEL_ECRSELLS FOR "EcrSells"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'ECRSELLS_DELETE'; END
^

/* Trigger: CHT_DEL_HOURS */
CREATE TRIGGER CHT_DEL_HOURS FOR "Hours"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'HOURS_DELETE'; END
^

/* Trigger: CHT_DEL_PORTS */
CREATE TRIGGER CHT_DEL_PORTS FOR "Ports"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'PORTS_DELETE'; END
^

/* Trigger: CHT_DEL_TAXES */
CREATE TRIGGER CHT_DEL_TAXES FOR "Taxes"
ACTIVE AFTER DELETE POSITION 0
AS BEGIN POST_EVENT 'TAXES_DELETE'; END
^

/* Trigger: CHT_INS_DEPARTS */
CREATE TRIGGER CHT_INS_DEPARTS FOR "Departs"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'DEPARTS_INSERT'; END
^

/* Trigger: CHT_INS_ECRGOODS */
CREATE TRIGGER CHT_INS_ECRGOODS FOR "EcrGoods"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'ECRGOODS_INSERT'; END
^

/* Trigger: CHT_INS_ECRPAYS */
CREATE TRIGGER CHT_INS_ECRPAYS FOR "EcrPays"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'ECRPAYS_INSERT'; END
^

/* Trigger: CHT_INS_ECRS */
CREATE TRIGGER CHT_INS_ECRS FOR "Ecrs"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'ECRS_INSERT'; END
^

/* Trigger: CHT_INS_ECRSELLS */
CREATE TRIGGER CHT_INS_ECRSELLS FOR "EcrSells"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'ECRSELLS_INSERT'; END
^

/* Trigger: CHT_INS_HOURS */
CREATE TRIGGER CHT_INS_HOURS FOR "Hours"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'HOURS_INSERT'; END
^

/* Trigger: CHT_INS_PORTS */
CREATE TRIGGER CHT_INS_PORTS FOR "Ports"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'PORTS_INSERT'; END
^

/* Trigger: CHT_INS_TAXES */
CREATE TRIGGER CHT_INS_TAXES FOR "Taxes"
ACTIVE AFTER INSERT POSITION 0
AS BEGIN POST_EVENT 'TAXES_INSERT'; END
^

/* Trigger: CHT_UPD_DEPARTS */
CREATE TRIGGER CHT_UPD_DEPARTS FOR "Departs"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'DEPARTS_UPDATE'; END
^

/* Trigger: CHT_UPD_ECRGOODS */
CREATE TRIGGER CHT_UPD_ECRGOODS FOR "EcrGoods"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'ECRGOODS_UPDATE'; END
^

/* Trigger: CHT_UPD_ECRPAYS */
CREATE TRIGGER CHT_UPD_ECRPAYS FOR "EcrPays"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'ECRPAYS_UPDATE'; END
^

/* Trigger: CHT_UPD_ECRS */
CREATE TRIGGER CHT_UPD_ECRS FOR "Ecrs"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'ECRS_UPDATE'; END
^

/* Trigger: CHT_UPD_ECRSELLS */
CREATE TRIGGER CHT_UPD_ECRSELLS FOR "EcrSells"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'ECRSELLS_UPDATE'; END
^

/* Trigger: CHT_UPD_HOURS */
CREATE TRIGGER CHT_UPD_HOURS FOR "Hours"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'HOURS_UPDATE'; END
^

/* Trigger: CHT_UPD_PORTS */
CREATE TRIGGER CHT_UPD_PORTS FOR "Ports"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'PORTS_UPDATE'; END
^

/* Trigger: CHT_UPD_TAXES */
CREATE TRIGGER CHT_UPD_TAXES FOR "Taxes"
ACTIVE AFTER UPDATE POSITION 0
AS BEGIN POST_EVENT 'TAXES_UPDATE'; END
^

SET TERM ; ^



/******************************************************************************/
/***                           Stored Procedures                            ***/
/******************************************************************************/


SET TERM ^ ;

ALTER PROCEDURE ADD_BARCODE (
    IMTU INTEGER,
    BARCODE VARCHAR(13),
    ZOOM DOUBLE PRECISION,
    CHANGE INTEGER)
RETURNS (
    RES INTEGER)
AS
 declare variable id_barcode integer;
 declare variable id_goods integer;
 declare variable goods_id integer;
 begin
  res = -1;
  if ((IMTU is null) or (barcode is null)) then
    exit;
  select id from "Goods" where IncrMTU = :IMTU
  into :id_goods;
  select id, goodsid from "BarCodes" where BARCODE = :barcode
  into :id_barcode, :goods_id;
  if (id_barcode is not null) then begin
    if (goods_id <> id_goods) then begin
      if (change = 0) then begin
        res = -2;
        exit;
      end
      else begin
        update "BarCodes" 
        set GOODSID = :id_goods,
            ZOOM = :zoom
        where id = :id_barcode;
        res = 2;
      end
    end
    else begin
      update "BarCodes" 
      set ZOOM = :zoom
      where id = :id_barcode;
      res = 2;
    end
  end
  else begin
    id_barcode = GEN_ID(GEN_BARCODES_ID, 1);
    insert into "BarCodes" values (:id_barcode, :id_goods, :barcode, :zoom);
    res = 1;
  end
 end^


ALTER PROCEDURE ADD_GOODS (
    CODE INTEGER,
    IMTU INTEGER,
    IED INTEGER,
    NAME VARCHAR(30),
    ANYPRICE CHAR(1),
    CHCKINT CHAR(1),
    CHCKCNT CHAR(1))
RETURNS (
    RES INTEGER)
AS
 declare variable ID_GOODS integer;
 begin
    res = -1;
    if ((code is null) or (name is null)) then
        exit;
    if (anyprice is null) then anyprice = 'f';
    if (chckint is null) then chckint = 'f';
    if (chckcnt is null) then chckcnt = 'f';
    select id from "Goods" where INCRMTU = :IMTU
    into :id_goods;
    if (id_goods is not null) then begin
        update "Goods"
        set
            CODE = :code,
            NAME = :name,
            ECRNAME = :name,
            CHKINTEGER = :chckint,
            ANYPRICE = :anyprice,
            CHKCOUNT = :chckcnt
        where id = :id_goods;
        res = 1;
    end
    else begin
        id_goods = GEN_ID(GEN_GOODS_ID, 1);
        insert into "Goods" (ID,CODE,NAME,ECRNAME,
                            DISABLED,CHKINTEGER,ANYPRICE,CHKCOUNT,INCRMTU,INCRED)
        values (:id_goods,:code,:name,:name,'F',:chckint,:anyprice,:chckcnt, :imtu, :ied);
        res = 1;
    end
 end^


ALTER PROCEDURE ADD_PRICE (
    IMTU INTEGER,
    DEPART INTEGER,
    PRICE DOUBLE PRECISION,
    TAXID INTEGER)
RETURNS (
    RES INTEGER)
AS
 declare variable ID_GOODS integer;
 declare variable ID_DEPART integer;
 declare variable ID_PRICES integer;
 begin
    res = -1;
    if ((imtu is null) or (depart is null) or (price is null)) then
        exit;
    select id from "Goods" where IncrMtu = :IMTU
    into :id_goods;
    if (id_goods is null) then 
        exit;
    select id from "Departs" where NUMBER = :depart
    into :id_depart;
    if (id_depart is null) then 
        exit;
    select id from "DepPrice" 
    where DEPARTID = :id_depart and GOODSID = :id_goods
    into :id_prices;
    if (taxid < 0) then taxid = 2;
    if (id_prices is not null) then begin
        update "DepPrice" 
        set PRICE = :price, taxid = :taxid
        where id = :id_prices;
    end
    else begin
        id_prices = GEN_ID(GEN_DEPPRICE_ID, 1);
        insert into "DepPrice" values (:id_prices,:id_depart,:id_goods,:price,:taxid);
    end
    res = 1;
 end^


ALTER PROCEDURE INSERT_CHECK (
    SERNUMBER INTEGER,
    MOMENT TIMESTAMP,
    CHKNUMBER INTEGER,
    SUMM DOUBLE PRECISION,
    KIND INTEGER,
    OPER INTEGER)
RETURNS (
    RES INTEGER)
AS
  declare variable id Integer;
begin
  id = GEN_ID(GEN_ECRPAYS_ID, 1);
  if (KIND = 0) then
    INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCASH, OPER)
    VALUES(:id, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);
  else
    if (KIND = 1) then
      INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCHECK, OPER)
      VALUES(:id, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);
    else
      if (KIND = 2) then
        INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCREDIT, OPER)
        VALUES(:id, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);
      else
        if (KIND = 3) then
          INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCARD, OPER)
          VALUES(:id, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);

  RES = id;
  SUSPEND;
end^


ALTER PROCEDURE UPD_BARCODES
AS
begin
    POST_EVENT 'BARCODES_UPDATE';
end^


ALTER PROCEDURE UPD_DEPPRICES
AS
begin
    POST_EVENT 'DEPPRICE_UPDATE';
end^


ALTER PROCEDURE UPD_GOODS
AS
begin
    POST_EVENT 'GOODS_UPDATE';
end^


ALTER PROCEDURE UPDATE_CHECK (
    ID INTEGER,
    SERNUMBER INTEGER,
    MOMENT TIMESTAMP,
    CHKNUMBER INTEGER,
    SUMM DOUBLE PRECISION,
    KIND INTEGER,
    OPER INTEGER)
RETURNS (
    RES INTEGER)
AS
declare variable VID integer;
declare variable PAYCASH double precision;
declare variable PAYCREDIT double precision;
declare variable PAYCARD double precision;
declare variable PAYCHECK double precision;
begin
  SELECT ID, PAYCASH, PAYCREDIT, PAYCARD, PAYCHECK from "EcrPays" where ID = :ID and SERNUMBER = :SERNUMBER and CHKNUMBER = :CHKNUMBER
  INTO :vid, :PAYCASH, :PAYCREDIT, :PAYCARD, :PAYCHECK;
  if (PAYCASH is Null) then PAYCASH = 0;
  if (PAYCREDIT is Null) then PAYCREDIT = 0;
  if (PAYCARD is Null) then PAYCARD = 0;
  if (PAYCHECK is Null) then PAYCHECK = 0;
  if (vID is not Null) then begin
      if (KIND = 0) then
        UPDATE "EcrPays" SET PAYCASH = :PAYCASH + :SUMM, PAYSUM = PAYSUM + :SUMM, TOTAL = TOTAL + :SUMM WHERE ID = :vID;
      else
        if (KIND = 1) then
            UPDATE "EcrPays" SET PAYCHECK = :PAYCHECK + :SUMM, PAYSUM = PAYSUM + :SUMM, TOTAL = TOTAL + :SUMM WHERE ID = :vID;
        else
          if (KIND = 2) then
              UPDATE "EcrPays" SET PAYCREDIT = :PAYCREDIT + :SUMM, PAYSUM = PAYSUM + :SUMM, TOTAL = TOTAL + :SUMM WHERE ID = :vID;
          else
            if (KIND = 3) then
                UPDATE "EcrPays" SET PAYCARD = :PAYCARD + :SUMM, PAYSUM = PAYSUM + :SUMM, TOTAL = TOTAL + :SUMM WHERE ID = :vID;
  end
  else begin
      vid = GEN_ID(GEN_ECRPAYS_ID, 1);
      if (KIND = 0) then
        INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCASH, OPER)
        VALUES(:vid, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);
      else
        if (KIND = 1) then
          INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCHECK, OPER)
          VALUES(:vid, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);
        else
          if (KIND = 2) then
            INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCREDIT, OPER)
            VALUES(:vid, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);
          else
            if (KIND = 3) then
              INSERT INTO "EcrPays"(ID, SERNUMBER, MOMENT, CHKNUMBER, TOTAL, PAYSUM, PAYCARD, OPER)
              VALUES(:vid, :SERNUMBER, :MOMENT, :CHKNUMBER, :SUMM, :SUMM, :SUMM, :OPER);
  end
  RES = vid;
  SUSPEND;
end^



SET TERM ; ^
