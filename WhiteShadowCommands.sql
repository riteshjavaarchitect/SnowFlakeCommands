CREATE OR REPLACE PROCEDURE SNOWFLAKE_SANDBOX_DB.PUBLIC.TEST_TABLE_ON_THE_FLY(table_name VARCHAR)
  RETURNS TABLE(N_NAME VARCHAR(1000))
  LANGUAGE SQL
AS
DECLARE
  res RESULTSET;
  query VARCHAR DEFAULT 'select N_NAME from IDENTIFIER(?) where N_NATIONKEY = 0;';
BEGIN
  res := (EXECUTE IMMEDIATE :query USING(table_name));
  RETURN TABLE(res);
END;


CALL SNOWFLAKE_SANDBOX_DB.PUBLIC.TEST_TABLE_ON_THE_FLY(SELECT TO_VARCHAR('SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.' || KeyColumn) from SNOWFLAKE_SANDBOX_DB.PUBLIC.ALGERIA where ID = :year);

CREATE OR REPLACE PROCEDURE RIGHTSHIP.RIGHTSHIPONDB.TEST_TABLE_ON_DDDD()
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS 
$$
  var resultSet = snowflake.execute({ sqlText:
    `SELECT t.$1 FROM @RightShip.RightShipOnDB.RightShip_AWS_STAGE (file_format => RightShip.RightShipOnDB.RightShip_Parquet) t;;`
  });
  return resultSet;
$$;
//CALL RIGHTSHIP.RIGHTSHIPONDB.TEST_TABLE_ON_DDDD();


CREATE OR REPLACE PROCEDURE RightShip.RightShipOnDB.TEST_TABLE_ON_THE_FLY(table_name VARCHAR)
  RETURNS TABLE(N_NAME VARCHAR(1000))
  LANGUAGE SQL
AS
DECLARE
  res RESULTSET;
  query VARCHAR DEFAULT 'select N_NAME from IDENTIFIER(?) where N_NATIONKEY = 0;';
BEGIN
  res := (EXECUTE IMMEDIATE :query USING(table_name));
  RETURN TABLE(res);
END;

select * 
 FROM TO_VARCHAR(select s3_location from RightShip.RightShipOnDB.RightShip_Test_AWS 
  where s3_location = '@RightShip.RightShipOnDB.RightShip_AWS_STAGE');

CALL RightShip.RightShipOnDB.TEST_TABLE_ON_THE_FLY(SELECT TO_VARCHAR(select s3_location from RightShip.RightShipOnDB.RightShip_Test_AWS 
  where s3_location = '@RightShip.RightShipOnDB.RightShip_AWS_STAGE'));


LIST '@RightShip.RightShipOnDB.RightShip_AWS_STAGE';





CREATE OR REPLACE PROCEDURE RIGHTSHIP.RIGHTSHIPONDB.TEST_TABLE_ON_CCCC(TABLE_NAME VARCHAR)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS 
$$
  var resultSet = snowflake.execute({ sqlText:
    `SELECT t.$1 FROM '` + TABLE_NAME + `' (file_format => RightShip.RightShipOnDB.RightShip_Parquet) t;;`
  });
  return resultSet;
$$;
CALL RIGHTSHIP



