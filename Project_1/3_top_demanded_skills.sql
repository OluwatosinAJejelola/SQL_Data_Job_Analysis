/* Question: What are the most in-demand skills for Data Analyst job postings in UAE
-- Join job posting to INNER JOIN table similar to query 2
-- Identify the top 5 in-demand skills for Data Analyst
-- Focus on all job postings in UAE
WHY? Retrieves the top 5 skills with the highest demand in the jo market,
providing insights into the most valuable skilss for job seekers
*/

SELECT 
    job_location,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'United Arab Emirates'
GROUP BY
    skills,job_location
ORDER BY
    demand_count DESC
LIMIT 5