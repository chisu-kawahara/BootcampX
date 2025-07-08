const { Pool } = require("pg");

const pool = new Pool({
	user: "development", // local Postgres username
	password: "development", // password
	host: "localhost", // Default for local DB
	database: "bootcampx", // Name of DB
});

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;

const values = [`%${cohortName}%`, limit];

pool
  .query(`
    SELECT students.id, students.name, cohorts.name AS cohort
    FROM students
    JOIN cohorts ON cohorts.id = cohort_id
    WHERE cohorts.name LIKE $1
    LIMIT $2;
  `, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(err => console.error("query error", err.stack));
