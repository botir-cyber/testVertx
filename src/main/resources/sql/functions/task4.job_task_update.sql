DROP FUNCTION IF EXISTS task4.job_task_update;
CREATE FUNCTION task4.job_task_update(
  in_login_id BIGINT,
  in_job_task_id BIGINT,
  in_title TEXT,
  in_job BIGINT)
RETURNS BIGINT
AS $$
/******************************************************************************
**		File: task4.job_task_update.sql
**		Name: task4.job_task_update
**		Desc: update job_task's data
*******************************************************************************
**		Auth: botir
**		Date: 2021-08-19
*******************************************************************************
**		Change History
**		Date: 			Author:				Description:
*******************************************************************************
**		2021-08-19		botir     	Created
*******************************************************************************
**		Return values: job_task id.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.job_task_update';
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
  IF NOT EXISTS(SELECT * FROM task4.job_task WHERE job_task.job_task_id = in_job_task_id AND NOT deleted) THEN
      RAISE EXCEPTION 'job_task % not exists --> % step %', in_job_task_id, STEP_INDEX, STEP_DESC
      USING HINT = 'Please check your job_task ID';
  END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 20;
  RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------

  UPDATE task4.job_task
    SET
      title = in_title,
      job = in_job,
      modified_on = now(),
      modified_by = in_login_id
    WHERE
      job_task.job_task_id = in_job_task_id
      AND NOT job_task.deleted
    RETURNING job_task_id INTO result;

RETURN result;
END;
$$ LANGUAGE plpgsql;
