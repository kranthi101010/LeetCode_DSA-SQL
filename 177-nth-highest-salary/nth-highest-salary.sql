CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) 
RETURNS TABLE (Salary INT) AS $$ 
BEGIN
  RETURN QUERY (
    WITH cte AS (
      SELECT e.salary, Dense_RANK() OVER (ORDER BY e.salary DESC) AS ranking 
      FROM Employee e  -- Explicitly alias the table to avoid ambiguity
    )
    SELECT CASE 
             WHEN (SELECT COUNT(*) FROM cte) >= N 
             THEN (SELECT c.salary FROM cte c WHERE c.ranking = N LIMIT 1)
             ELSE NULL 
           END AS Salary
  );
END;
$$ LANGUAGE plpgsql;
