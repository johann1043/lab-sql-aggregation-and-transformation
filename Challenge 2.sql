
# 1. Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:

    # 1.1 The total number of films that have been released.
    
    Select count(release_year) From film;
    
    # 1.2 The number of films for each rating.
    
    SELECT rating, count(film_id)
    FROM film
	GROUP BY rating;
    
    # 1.3 The number of films for each rating, sorting the results in descending order of the number of films. This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly. 

    SELECT rating, count(film_id)
    FROM film
	GROUP BY rating
    ORDER BY count(film_id) ASC;


# 2. Using the film table, determine:

    # 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
   
    SELECT rating, 
    FORMAT(AVG(length), 2)
    FROM film
	GROUP BY rating
    ORDER BY AVG(length) ASC;
   
   # 2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.


SELECT title, FORMAT(AVG(length), 2),
       CASE 
           WHEN FORMAT(AVG(length), 2) > 120 THEN 'True'
           ELSE 'False'
       END AS is_average_greater_than_120
FROM film
group by title;

