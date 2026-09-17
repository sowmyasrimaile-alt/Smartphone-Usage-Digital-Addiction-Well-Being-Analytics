USE smartphone_usage;

SELECT * FROM smartphone_usage;
SELECT gender, COUNT(*),SUM(CASE WHEN addicted_label=1 THEN 1 ELSE 0 END)AS addicted_count FROM smartphone_usage GROUP BY gender;
SELECT AVG(daily_screen_time_hours), AVG(sleep_hours), AVG(stress_level = 'High')
FROM smartphone_usage;
SELECT * FROM smartphone_usage
WHERE age IS NULL OR daily_screen_time_hours IS NULL OR addiction_level IS NULL;
SELECT addicted_label, stress_level, COUNT(*)
FROM smartphone_usage
GROUP BY addicted_label, stress_level;
SELECT academic_work_impact, AVG(daily_screen_time_hours), AVG(social_media_hours), AVG(gaming_hours)
FROM smartphone_usage
GROUP BY academic_work_impact;
SELECT addiction_level, COUNT(*), AVG(daily_screen_time_hours), AVG(sleep_hours)
FROM smartphone_usage
GROUP BY addiction_level;
select count(user_id) from smartphone_usage;