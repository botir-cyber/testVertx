DROP FUNCTION IF EXISTS task4.country_delete;
CREATE FUNCTION task4.country_delete(
  in_login_id BIGINT,
  in_country_id BIGINT
)
RETURNS BIGINT
AS $$
/******************************************************************************
**		File: task4.country_delete.sql
**		Name: task4.country_delete
**		Desc: delete country
*******************************************************************************
**		Auth: botir
**		Date: 2021-08-19
*******************************************************************************
**		Change History
**		Date: 			  Author:				Description:
*******************************************************************************
**		2021-08-19		botir   Created
**
*******************************************************************************
**		Return values: country id.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.country_delete';
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
    IF NOT EXISTS(SELECT * FROM task4.country WHERE country.country_id = in_country_id AND NOT deleted) THEN
        RAISE EXCEPTION 'Cannot delete country % not exists --> % step %', in_country_id, STEP_INDEX, STEP_DESC
        USING HINT = 'Please check your country ID';
    END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 20;
  RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------

  UPDATE task4.country
    SET
        deleted_on = now(),
        deleted_by = in_login_id,
        deleted = TRUE
    WHERE
        country.country_id = in_country_id
        AND NOT deleted
  RETURNING country_id INTO result;

  RETURN result;
END;
$$ LANGUAGE plpgsql;
