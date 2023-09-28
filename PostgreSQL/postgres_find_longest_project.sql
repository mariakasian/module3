SELECT project.pname,
    (DATE_PART('year', project.finish_date::date) - DATE_PART('year', project.start_date::date)) * 12 +
              (DATE_PART('month', project.finish_date::date) - DATE_PART('month', project.start_date::date)) as duration_months
FROM project
WHERE (DATE_PART('year', project.finish_date::date) - DATE_PART('year', project.start_date::date)) * 12 +
              (DATE_PART('month', project.finish_date::date) - DATE_PART('month', project.start_date::date)) = (
    SELECT MAX(duration_months)
    FROM (
        SELECT
            project_id,
            (DATE_PART('year', project.finish_date::date) - DATE_PART('year', project.start_date::date)) * 12 +
              (DATE_PART('month', project.finish_date::date) - DATE_PART('month', project.start_date::date)) as duration_months
        FROM project
    ) AS project_durations
);

