CREATE TABLE nodes (
    point1 VARCHAR(2),
    point2 VARCHAR(2),
    cost INTEGER
);
INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('d', 'c', 30),
    ('c', 'd', 30),
    ('a', 'd', 20),
    ('d', 'a', 20);
CREATE VIEW v_tour AS (
    WITH RECURSIVE CTE_a as (
        SELECT point1,
            point2,
            cost,
            ARRAY [point1, point2]::VARCHAR [] AS visited,
            1 as count
        FROM nodes
        WHERE point1 = 'a'
    ),
    CTE_path AS (
        SELECT cost AS total_cost,
            point2 AS end_point,
            visited,
            count
        FROM CTE_a
        UNION ALL
        SELECT p.total_cost + n.cost,
            n.point2 AS end_point,
            p.visited || n.point2,
            count + 1
        FROM CTE_path as p
            JOIN nodes as n ON p.end_point = n.point1
        WHERE NOT p.visited @> ARRAY [n.point2]::VARCHAR []
    ),
    CTE_full_path AS (
        SELECT p.total_cost + CTE_a.cost as total_cost,
            p.visited || CTE_a.point1 as tour
        FROM CTE_path as p
            JOIN CTE_a ON p.end_point = CTE_a.point2
            AND p.count + 1 = 4
    )
    SELECT total_cost,
        tour
    FROM CTE_full_path
);
SELECT *
FROM v_tour
WHERE total_cost IN (
        SELECT MIN(total_cost)
        FROM v_tour
    )
ORDER BY total_cost,
    tour;