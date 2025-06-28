-- Create the assignments table
CREATE TABLE assignments (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  content TEXT NOT NULL,
  day INTEGER NOT NULL,
  chapter INTEGER NOT NULL,
  duration INTEGER
);

-- Create the assignment_submissions table
CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);
