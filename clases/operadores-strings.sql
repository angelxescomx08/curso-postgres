SELECT
    id,
    name,
    UPPER(name) as upper_case,
    LOWER(name) as lower_case,
    CONCAT(id,'_',name) as concat_function,
    id||'_'||name as contat_pipe,
    LENGTH(name)
FROM
    users;