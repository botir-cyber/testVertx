-- Table: task4.job_task;

-- DROP TABLE task4.job_task;

CREATE TABLE IF NOT EXISTS task4.job_task (
    job_task_id BIGSERIAL NOT NULL,
    CONSTRAINT pk_task4_job_task_job_task_id PRIMARY KEY (job_task_id)
);

ALTER TABLE task4.job_task
ADD COLUMN IF NOT EXISTS title TEXT,
ADD COLUMN IF NOT EXISTS job BIGINT,

ADD COLUMN IF NOT EXISTS created_on TIMESTAMP WITH TIME ZONE DEFAULT now(),
ADD COLUMN IF NOT EXISTS created_by BIGINT NOT NULL,
ADD COLUMN IF NOT EXISTS modified_on TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS modified_by BIGINT,
ADD COLUMN IF NOT EXISTS deleted_on TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS deleted_by BIGINT,
ADD COLUMN IF NOT EXISTS deleted BOOLEAN NOT NULL DEFAULT FALSE;