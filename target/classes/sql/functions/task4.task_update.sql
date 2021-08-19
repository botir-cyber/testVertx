DROP FUNCTION IF EXISTS task4.task_update;
CREATE FUNCTION task4.task_update(
  in_login_id BIGINT,
  in_task_id BIGINT,
  in_task_name TEXT,
  in_title TEXT)
RETURNS BIGINT
AS $$
/******************************************************************************
**		File: task4.task_update.sql
**		Name: task4.task_update
**		Desc: update task's data
*******************************************************************************
**		Auth: botir
**		Date: 2021-08-19
*******************************************************************************
**		Change History
**		Date: 			Author:				Description:
*******************************************************************************
**		2021-08-19		botir     	Created
*******************************************************************************
**		Return values: task id.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.task_update';
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
  IF NOT EXISTS(SELECT * FROM task4.task WHERE task.task_id = in_task_id AND NOT deleted) THEN
      RAISE EXCEPTION 'task % not exists --> % step %', in_task_id, STEP_INDEX, STEP_DESC
      USING HINT = 'Please check your task ID';
  END IF;

---------------------------------------------------------------------------------------------------------------------------------------------------
  STEP_INDEX := 20;
  RAISE NOTICE '%', FN_NAME || ': Select Data';
----------------------------------------------------------------------------------------------------------------------------------------------------

  UPDATE task4.task
    SET
      task_name = in_task_name,
      title = in_title,
      modified_on = now(),
      modified_by = in_login_id
    WHERE
      task.task_id = in_task_id
      AND NOT task.deleted
    RETURNING task_id INTO result;

RETURN result;
END;
$$ LANGUAGE plpgsql;
