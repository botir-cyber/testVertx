DROP FUNCTION IF EXISTS task4.location_get_all;
CREATE FUNCTION task4.location_get_all(
  in_login_id BIGINT
)
RETURNS TABLE (
  location_id BIGINT,
  street_address TEXT,
  postal_code TEXT,
  city TEXT,
  state_province TEXT,
  country BIGINT)
AS $$
/******************************************************************************
**		File: task4.location_get_all.sql
**		Name: task4.location_get_all
**		Desc: Get locations data
*******************************************************************************
**		Auth: botir
**		Date: 2021-08-19
*******************************************************************************
**		Change History
**		Date: 			Author:				Description:
*******************************************************************************
**		2021-08-19		botir     	Created
**
*******************************************************************************
**		Return values: location infor.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.location_get_all';
  STEP_INDEX INTEGER;
  STEP_DESC VARCHAR(500);
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

  IF in_login_id IS NULL OR in_login_id < 0 THEN
      RAISE EXCEPTION 'Nonexistent ID --> % step % %', in_login_id, STEP_INDEX, STEP_DESC
      USING HINT = 'Please check your login';
  END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 20;
  RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------
  RETURN QUERY
    SELECT
        location.location_id,
        location.street_address,
        location.postal_code,
        location.city,
        location.state_province,
        location.country    FROM task4.location
    WHERE
        NOT location.deleted;
END;
$$ LANGUAGE plpgsql;