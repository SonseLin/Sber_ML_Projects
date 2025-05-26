WITH Combined AS (
    SELECT pizza_name AS object_name FROM menu
),
NoDuplicates AS (
    SELECT 
        object_name,
        ROW_NUMBER() OVER (PARTITION BY object_name ORDER BY object_name) AS row_num
    FROM 
        Combined
)
SELECT 
    object_name
FROM 
    NoDuplicates
WHERE 
    row_num = 1
ORDER BY 
    object_name;