/* Question: What are the top paying Data Analyst Jobs?
-- Identify the top 10 highest paying Data Analyst Roles that are available remotely
-- Focuses on job postings with specified salaries(remove nulls)
-- Why? Highlight the top-paying opportunities for Data Analyst, offering insight into employment opportunities
*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
WHERE
job_title_short = 'Data Analyst' AND
salary_year_avg IS NOT NULL AND
job_location = 'Anywhere'
ORDER BY
salary_year_avg DESC
LIMIT 10