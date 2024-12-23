-- This query shows a list of the daily top Google Search terms.
SELECT
   /*refresh_date AS Day,*/ 
   table1.term AS Top_Term,

   

       -- These search terms are in the top 25 in the US each day.
   rank,
FROM `bigquery-public-data.google_trends.top_terms` as table1

WHERE
   rank <= 3
       -- Choose only the top term each day.
   AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
       -- Filter to the last 2 weeks.
   /*AND 
    SEARCH('regoin', 'UK')*/
    
GROUP BY week, Top_Term, rank /*group by the week*/
ORDER BY week DESC
/*ORDER BY Day DESC*/
   -- Show the days in reverse chronological order.