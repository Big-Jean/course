CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(50)
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE Grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Teachers (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
);

CREATE TABLE Health(
    health_id SERIAL PRIMARY KEY,
    condition VARCHAR(1000),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);