DROP FUNCTION IF EXISTS task4.job_get_list;
CREATE FUNCTION task4.job_get_list(
  in_login_id BIGINT,
  in_skip BIGINT,
  in_page_size BIGINT
)
RETURNS TABLE (
  job_id BIGINT,
  job_name TEXT)
AS $$
/******************************************************************************
**		File: task4.job_get_list.sql
**		Name: task4.job_get_list
**		Desc: Get jobs data
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
**		Return values: job infor.
*******************************************************************************
**/

DECLARE
  FN_NAME CONSTANT TEXT := 'task4.job_get_list';
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
        job.job_id,
        job.job_name    FROM task4.job
    WHERE
        NOT job.deleted
    OFFSET in_skip
    LIMIT in_page_size;
END;
$$ LANGUAGE plpgsql;