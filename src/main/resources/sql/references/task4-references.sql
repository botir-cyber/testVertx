ALTER TABLE ONLY task4.country
    ADD CONSTRAINT country_region_fk FOREIGN KEY (region)
        REFERENCES task4.region(region_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE ONLY task4.location
    ADD CONSTRAINT location_country_fk FOREIGN KEY (country)
        REFERENCES task4.country(country_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE ONLY task4.job_task
    ADD CONSTRAINT job_task_title_fk FOREIGN KEY (title)
        REFERENCES task4.task(title) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE ONLY task4.job_task
    ADD CONSTRAINT job_task_job_fk FOREIGN KEY (job)
        REFERENCES task4.job(job_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
