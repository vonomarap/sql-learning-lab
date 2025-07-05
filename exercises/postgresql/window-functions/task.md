# Task

Using `clinic.cases`, rank doctors by the number of active cases they currently own.

Requirements:

- active cases are rows where `end_date IS NULL`
- return `responsible_doctor_id`, `active_case_count`, and rank
- doctors with the same number of active cases must share the same rank
