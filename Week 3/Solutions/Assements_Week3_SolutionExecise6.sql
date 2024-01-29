CREATE VIEW members_voucher AS
SELECT m.member_id, m.email, m.name, SUM(p.price) AS tot_spending
FROM departments AS d
INNER JOIN sales AS s
ON departments.id = sales.department_id
INNER JOIN products AS p
ON products.id = sales.product_id
INNER JOIN members as m
ON  m.id = s.member_id
WHERE department_id  IN (SELECT s.department_id
						FROM sales AS s
                        INNER JOIN products as p
                        ON s.product_id = p.id
                        GROUP BY s.department_id
                        HAVING SUM(p.price) > 10000)
GROUP BY member_id, m.email, m.name
HAVING tot_spending > 1000;
WITH departments_10k AS (
						SELECT s.department_id
						FROM sales AS s
                        INNER JOIN products as p
                        ON s.product_id = p.id
                        GROUP BY s.department_id
                        HAVING SUM(p.price) > 10000)
SELECT m.member_id, m.email, m.name, SUM(p.price) AS tot_spending
FROM departments AS d
INNER JOIN sales AS s
ON departments.id = sales.department_id
INNER JOIN products AS p
ON products.id = sales.product_id
INNER JOIN members as m
ON  m.id = s.member_id
WHERE department_id  IN ( SELECT  department_id
								FROM departments_10k)
GROUP BY member_id, m.email, m.name
HAVING tot_spending > 1000;