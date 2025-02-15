DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
)

-- A simple subquery that allowed us to leave only the first occurrences of each email.