SELECT
	skills,
	ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
	job_postings_fact AS jpf
JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE
	job_title_short = 'Data Analyst'
	AND salary_year_avg IS NOT NULL
GROUP BY
	skills
ORDER BY
	avg_salary DESC

SELECT *
FROM job_postings_fact