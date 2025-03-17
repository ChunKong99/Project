/*
2) What are the skills required for these top-paying roles?
a) Use the top 10 highest-paying Data Analyst jobs from first query
b) Add the specific skills required for these roles
c) Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name	
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
	top_paying_jobs.*,
	skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
	salary_year_avg DESC


SELECT
	COUNT(*) as total_job_postings,	
	sd.skills AS skills
FROM
	job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE
        jpf.job_work_from_home = True AND
        jpf.job_title_short = 'Data Analyst' AND
        jpf.salary_year_avg IS NOT NULL
GROUP BY
	skills
ORDER BY
	total_job_postings DESC
LIMIT 5