/* Question: What are the skills required for the top-paying Data Analyst jobs
-- Use the top 10 top-paying Data Analyst job from the first query
-- Add the specific skills required for the roles
Why? it prove a detailed look at which top-paying job demand sertain skills
Helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title_short,
        salary_year_avg,
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
    )

, top_skill AS ( 
    SELECT 
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id=top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
)
SELECT
    skills,
    COUNT(skills) AS skills_count
FROM 
top_skill
GROUP BY
skills
ORDER BY
skills_count DESC
LIMIT 10

