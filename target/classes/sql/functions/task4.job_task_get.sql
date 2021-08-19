DROP FUNCTION IF EXISTS task4.job_task_get;
CREATE FUNCTION task4.job_task_get(
    in_login_id BIGINT,
    in_job_task_id BIGINT
)
RETURNS TABLE (
    job_task_id BIGINT,
    title TEXT,
    job BIGINT)
AS $$
/******************************************************************************
**		File: task4.job_task_get.sql
**		Name: task4.job_task_get
**		Desc: Get job_task data
*******************************************************************************
**		Auth: botir
**		Date: 2021-08-19
*******************************************************************************
**		Change History
**		Date: 			Author:				Description:
*******************************************************************************
**		2021-08-19		botir     	Created
*******************************************************************************
**		Return values: job_task infor.
*******************************************************************************
**/

DECLARE
    FN_NAME CONSTANT TEXT := 'task4.job_task_get';
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

    IF in_job_task_id IS NULL OR in_job_task_id < 0 THEN
        RAISE EXCEPTION 'Nonexistent ID --> % step % %', in_job_task_id, STEP_INDEX, STEP_DESC
        USING HINT = 'Please check your job_task ID';
    END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
    STEP_INDEX := 20;
    RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------
    RETURN QUERY
        SELECT
            job_task.job_task_id,
            job_task.title,
            job_task.job        FROM task4.job_task
        WHERE
            job_task.job_task_id = in_job_task_id
            AND NOT job_task.deleted;
END;
$$ LANGUAGE plpgsql;