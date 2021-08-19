DROP FUNCTION IF EXISTS task4.country_add;
CREATE FUNCTION task4.country_add(
  in_login_id BIGINT,
  in_country_name TEXT,
  in_region BIGINT)
RETURNS BIGINT
AS $$
/******************************************************************************
**        File: task4.country_add.sql
**        Name: task4.country_add
**        Desc: add country's data
*******************************************************************************
**        Auth: botir
**        Date: 2021-08-19
*******************************************************************************
**        Change History
**        Date:                        Author:              Description:
*******************************************************************************
**        2021-08-19        botir            Created
*******************************************************************************
**        Return values: country id infor.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.country_add';
  STEP_INDEX INTEGER;
  STEP_DESC VARCHAR(500);
  result BIGINT;
BEGIN

---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 0;
  STEP_DESC := FN_NAME || ': Initialized ...';
  RAISE NOTICE '%', STEP_DESC;
----------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 10;
  STEP_DESC := FN_NAME || ': Validation check permission';
  RAISE NOTICE '%', STEP_DESC;
----------------------------------------------------------------------------------------------------------------------------------------------------
-- to do need to complete this step


---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 20;
  RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------

  INSERT INTO task4.country(
    country_name,
    region,
    created_by,
    deleted
    )
  VALUES (
    in_country_name,
    in_region,
    in_login_id,
    FALSE
  )
  RETURNING country_id INTO result;

  RETURN result;
END;
$$ LANGUAGE plpgsql;

