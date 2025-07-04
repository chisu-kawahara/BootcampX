SELECT cohorts.name as cohort, SUM(completed_at-started_at) AS total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;