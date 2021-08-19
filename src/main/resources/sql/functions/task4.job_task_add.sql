DROP FUNCTION IF EXISTS task4.job_task_add;
CREATE FUNCTION task4.job_task_add(
  in_login_id BIGINT,
  in_title TEXT,
  in_job BIGINT)
RETURNS BIGINT
AS $$
/******************************************************************************
**        File: task4.job_task_add.sql
**        Name: task4.job_task_add
**        Desc: add job_task's data
*******************************************************************************
**        Auth: botir
**        Date: 2021-08-19
*******************************************************************************
**        Change History
**        Date:                        Author:              Description:
*******************************************************************************
**        2021-08-19        botir            Created
*******************************************************************************
**        Return values: job_task id infor.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.job_task_add';
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

  INSERT INTO task4.job_task(
    title,
    job,
    created_by,
    deleted
    )
  VALUES (
    in_title,
    in_job,
    in_login_id,
    FALSE
  )
  RETURNING job_task_id INTO result;

  RETURN result;
END;
$$ LANGUAGE plpgsql;

