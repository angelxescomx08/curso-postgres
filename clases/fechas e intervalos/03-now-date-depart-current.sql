SELECT
    now(),
    CURRENT_TIME,
    CURRENT_DATE,
    date_part('hours', now()) AS hours,
    date_part('minutes', now()) AS minutes,
    date_part('seconds', now()) AS seconds,
    date_part('days', now()) AS day,
    date_part('months', now()) AS month,
    date_part('years', now()) AS year;