DROP FUNCTION IF EXISTS task4.region_get;
CREATE FUNCTION task4.region_get(
    in_login_id BIGINT,
    in_region_id BIGINT
)
RETURNS TABLE (
    region_id BIGINT,
    region_name TEXT)
AS $$
/******************************************************************************
**		File: task4.region_get.sql
**		Name: task4.region_get
**		Desc: Get region data
*******************************************************************************
**		Auth: botir
**		Date: 2021-08-19
*******************************************************************************
**		Change History
**		Date: 			Author:				Description:
*******************************************************************************
**		2021-08-19		botir     	Created
*******************************************************************************
**		Return values: region infor.
*******************************************************************************
**/

DECLARE
    FN_NAME CONSTANT TEXT := 'task4.region_get';
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

    IF in_region_id IS NULL OR in_region_id < 0 THEN
        RAISE EXCEPTION 'Nonexistent ID --> % step % %', in_region_id, STEP_INDEX, STEP_DESC
        USING HINT = 'Please check your region ID';
    END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
    STEP_INDEX := 20;
    RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------
    RETURN QUERY
        SELECT
            region.region_id,
            region.region_name        FROM task4.region
        WHERE
            region.region_id = in_region_id
            AND NOT region.deleted;
END;
$$ LANGUAGE plpgsql;