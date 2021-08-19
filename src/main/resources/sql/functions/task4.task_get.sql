DROP FUNCTION IF EXISTS task4.task_get;
CREATE FUNCTION task4.task_get(
    in_login_id BIGINT,
    in_task_id BIGINT
)
RETURNS TABLE (
    task_id BIGINT,
    task_name TEXT,
    title TEXT)
AS $$
/******************************************************************************
**		File: task4.task_get.sql
**		Name: task4.task_get
**		Desc: Get task data
*******************************************************************************
**		Auth: botir
**		Date: 2021-08-19
*******************************************************************************
**		Change History
**		Date: 			Author:				Description:
*******************************************************************************
**		2021-08-19		botir     	Created
*******************************************************************************
**		Return values: task infor.
*******************************************************************************
**/

DECLARE
    FN_NAME CONSTANT TEXT := 'task4.task_get';
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

    IF in_task_id IS NULL OR in_task_id < 0 THEN
        RAISE EXCEPTION 'Nonexistent ID --> % step % %', in_task_id, STEP_INDEX, STEP_DESC
        USING HINT = 'Please check your task ID';
    END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
    STEP_INDEX := 20;
    RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------
    RETURN QUERY
        SELECT
            task.task_id,
            task.task_name,
            task.title        FROM task4.task
        WHERE
            task.task_id = in_task_id
            AND NOT task.deleted;
END;
$$ LANGUAGE plpgsql;