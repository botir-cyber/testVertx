DROP FUNCTION IF EXISTS task4.location_delete;
CREATE FUNCTION task4.location_delete(
  in_login_id BIGINT,
  in_location_id BIGINT
)
RETURNS BIGINT
AS $$
/******************************************************************************
**		File: task4.location_delete.sql
**		Name: task4.location_delete
**		Desc: delete location
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
**		Return values: location id.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.location_delete';
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
    IF NOT EXISTS(SELECT * FROM task4.location WHERE location.location_id = in_location_id AND NOT deleted) THEN
        RAISE EXCEPTION 'Cannot delete location % not exists --> % step %', in_location_id, STEP_INDEX, STEP_DESC
        USING HINT = 'Please check your location ID';
    END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 20;
  RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------

  UPDATE task4.location
    SET
        deleted_on = now(),
        deleted_by = in_login_id,
        deleted = TRUE
    WHERE
        location.location_id = in_location_id
        AND NOT deleted
  RETURNING location_id INTO result;

  RETURN result;
END;
$$ LANGUAGE plpgsql;
