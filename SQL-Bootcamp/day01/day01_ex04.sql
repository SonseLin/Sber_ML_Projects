WITH OrderCounts AS (
    SELECT person_id, COUNT(*) AS order_count
    FROM person_order
    WHERE order_date = '2022-01-07'
    GROUP BY person_id
),
VisitCounts AS (
    SELECT person_id, COUNT(*) AS visit_count
    FROM person_visits
    WHERE visit_date = '2022-01-07'
    GROUP BY person_id
)

SELECT person_id
FROM (
    SELECT person_id
    FROM person_order
    WHERE order_date = '2022-01-07'
) po
WHERE po.person_id IN (
    SELECT person_id
    FROM OrderCounts oc
    WHERE oc.order_count > (
        SELECT COALESCE(vc.visit_count, 0)
        FROM VisitCounts vc
        WHERE vc.person_id = oc.person_id
    )
)
UNION ALL
SELECT person_id
FROM (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-07'
) pv
WHERE pv.person_id IN (
    SELECT person_id
    FROM VisitCounts vc
    WHERE vc.visit_count > (
        SELECT COALESCE(oc.order_count, 0)
        FROM OrderCounts oc
        WHERE oc.person_id = vc.person_id
    )
);
