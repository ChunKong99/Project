SELECT
	COUNT(*) AS total_jobs,
	skills
FROM
	skills_dim
INNER JOIN skills_job_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_id IN (
SELECT
	job_id
FROM
	job_postings_fact
WHERE
	job_work_from_home = TRUE
)
GROUP BY
	skills
ORDER BY
	total_jobs DESC