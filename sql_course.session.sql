SELECT
	COUNT(*) AS total_jobs,
	sd.skill_id,
    sd.skills
FROM
	job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
INNER JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE
	jpf.job_work_from_home = TRUE
GROUP BY
	sd.skill_id
ORDER BY
	total_jobs DESC
LIMIT 5;