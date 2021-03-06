/******************************************************************************/
/****         Generated by IBExpert 2004.04.01 19.11.2005 17:59:34         ****/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1251;

CREATE DATABASE '127.0.0.1:C:\Dukat2\Data\MVENGINE.GDB'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 4096
DEFAULT CHARACTER SET WIN1251;



SET TERM ^ ; 



/******************************************************************************/
/****                          Stored Procedures                           ****/
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
  EXIT;
END^


CREATE PROCEDURE ADD_CHANGES (
    IMTU INTEGER)
RETURNS (
    RES INTEGER)
AS
BEGIN
  EXIT;
END^


CREATE PROCEDURE ADD_GOODS (
    IMTU INTEGER,
    CODE INTEGER,
    NAME VARCHAR(30),
    TAXGRP INTEGER,
    ANYPRICE CHAR(1),
    CHCKINT CHAR(1),
    CHCKCNT CHAR(1))
RETURNS (
    RES INTEGER)
AS
BEGIN
  EXIT;
END^


CREATE PROCEDURE ADD_PRICE (
    IMTU INTEGER,
    DEPART INTEGER,
    PRICE DOUBLE PRECISION)
RETURNS (
    RES INTEGER)
AS
BEGIN
  EXIT;
END^



SET TERM ; ^


/******************************************************************************/
/****                          Stored Procedures                           ****/
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

  if ((imtu is null) or (barcode is null)) then
    exit;

  select id from "Goods" where CODE = :imtu
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
  
end
^

ALTER PROCEDURE ADD_CHANGES (
    IMTU INTEGER)
RETURNS (
    RES INTEGER)
AS
declare variable id_goods integer;
declare variable id_changes integer;
begin

    res = -1;

    if (imtu is null) then
        exit;

    select id from "Goods" where CODE = :imtu
    into :id_goods;

    if (id_goods is null) then 
        exit;

    id_changes = GEN_ID(GEN_GOODSCHANGES_ID, 1);

    insert into "GoodsChanges" values (:id_changes,:id_goods,1,'localhost');

    res = 1;

end
^

ALTER PROCEDURE ADD_GOODS (
    IMTU INTEGER,
    CODE INTEGER,
    NAME VARCHAR(30),
    TAXGRP INTEGER,
    ANYPRICE CHAR(1),
    CHCKINT CHAR(1),
    CHCKCNT CHAR(1))
RETURNS (
    RES INTEGER)
AS
declare variable id_goods integer;
declare variable id_EcrRef integer;
declare variable MaxEcrLine integer;

begin

    res = -1;

    if ((imtu is null) or (code is null) or (name is null)) then
        exit;
    if (anyprice is null) then anyprice = 'f';
    if (chckint is null) then chckint = 'f';
    if (chckcnt is null) then chckcnt = 'f';

    select id from "Goods" where CODE = :imtu
    into :id_goods;

    if (id_goods is not null) then begin
        if (taxgrp > 0) then begin

            update "Goods"
            set
                NAME = :name,
                ECRNAME = :name,
                TAXID = :taxgrp, 
                CHKINTEGER = :chckint,
                ANYPRICE = :anyprice,
                CHKCOUNT = :chckcnt
            where id = :id_goods;

        end
        else begin

            update "Goods"
            set
                NAME = :name,
                ECRNAME = :name,
                CHKINTEGER = :chckint,
                ANYPRICE = :anyprice,
                CHKCOUNT = :chckcnt
            where id = :id_goods;

        end

        select id from "GoodsInEcrRef"
        where GOODSID = :id_goods
        into :id_EcrRef;

        if (id_EcrRef is not null) then begin

             update "GoodsInEcrRef"
             set ECRCODE = :code
             where id = :id_EcrRef;

        end
        else begin

            id_EcrRef = GEN_ID(GEN_GOODSINECRREF_ID, 1);

            select MAX(ECRLINE) from "GoodsInEcrRef" 
            into :MaxEcrLine;
            if (MaxEcrLine is null) then MaxEcrLine = 20;
            MaxEcrLine = MaxEcrLine + 1;

            insert into "GoodsInEcrRef" values (:id_EcrRef,:id_goods,1,:code,:MaxEcrLine);

        end

        res = 1;

    end
    else begin

        if (taxgrp < 0) then taxgrp = 2;

        id_goods = GEN_ID(GEN_GOODS_ID, 1);

        insert into "Goods" (ID,CODE,NAME,ECRNAME,TAXID,GOODSGRPID,
                            DISABLED,CHKINTEGER,ANYPRICE,CHKCOUNT)
        values (:id_goods,:imtu,:name,:name,:taxgrp,1,'F',:chckint,:anyprice,:chckcnt);

        id_EcrRef = GEN_ID(GEN_GOODSINECRREF_ID, 1);

        select MAX(ECRLINE) from "GoodsInEcrRef" 
        into :MaxEcrLine;
        if (MaxEcrLine is null) then MaxEcrLine = 20;
        MaxEcrLine = MaxEcrLine + 1;

        insert into "GoodsInEcrRef" values (:id_EcrRef,:id_goods,1,:code,:MaxEcrLine);

        res = 1;

    end

end
^

ALTER PROCEDURE ADD_PRICE (
    IMTU INTEGER,
    DEPART INTEGER,
    PRICE DOUBLE PRECISION)
RETURNS (
    RES INTEGER)
AS
declare variable id_goods integer;
declare variable id_depart integer;
declare variable id_prices integer;
begin

    res = -1;

    if ((imtu is null) or (depart is null) or (price is null)) then
        exit;

    select id from "Goods" where CODE = :imtu
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

    if (id_prices is not null) then begin
        
        update "DepPrice" 
        set PRICE = :price
        where id = :id_prices;

    end
    else begin

        id_prices = GEN_ID(GEN_DEPPRICE_ID, 1);

        insert into "DepPrice" values (:id_prices,:id_depart,:id_goods,0,:price,:id_depart);

    end

    res = 1;

end
^


SET TERM ; ^
