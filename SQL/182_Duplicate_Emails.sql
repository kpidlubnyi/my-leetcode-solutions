SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1

-- same aproach, thanks to HAVING :D