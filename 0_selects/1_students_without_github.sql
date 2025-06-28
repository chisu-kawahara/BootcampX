SELECT id, 
      name, 
      email, 
      cohort_id
FROM students
WHERE github IS NULL  /* only rows with no GitHub username */
ORDER BY cohort_id  /* roups them by cohort */