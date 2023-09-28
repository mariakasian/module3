SELECT
    p.pname AS NAME,
    SUM(w.salary * ((DATE_PART('year', p.finish_date::date) - DATE_PART('year', p.start_date::date)) * 12 +
                   (DATE_PART('month', p.finish_date::date) - DATE_PART('month', p.start_date::date)))) AS PRICE
FROM project AS p
JOIN project_worker AS pw ON p.project_id = pw.project_id
JOIN worker AS w ON pw.worker_id = w.worker_id
GROUP BY p.pname
ORDER BY PRICE DESC;


