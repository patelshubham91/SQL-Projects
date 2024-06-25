# Music Store Analysis using SQL

![image](https://github.com/patelshubham91/SQL-Projects/blob/main/Music-store-analysis-using-SQL/Project%20Image.jpg)

# Project Objective
The main objective of this project is to extract and analyze key business insights from a music store's database. This involves querying the database to gather information about employees, invoices, customers, music genres, and sales. The project aims to answer specific questions related to the store’s operations, such as identifying the senior most employee, determining the countries and cities with the highest invoices, and recognizing the best customers and artists. Additionally, the project seeks to identify popular music genres in different countries and analyze customer spending patterns to support business decisions, promotional events, and targeted marketing strategies.

# Database Schema

![image](https://github.com/patelshubham91/SQL-Projects/blob/main/Music-store-analysis-using-SQL/DATABASE%20SCHEMA.jpg)

# Business Problems
## Question Set 1 - Easy
* Who is the senior most employee based on job title?
* Which countries have the most Invoices?
* What are top 3 values of total invoice?
* Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
* Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money.

## Question Set 2 - Moderate
* Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A.
* Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands.
* Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

## Question Set 3 - Advanced
* Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent.
* We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres.
* Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.

# Key Insights
* Mohan Madan, holding the position of Senior General Manager, is the senior-most employee in the company.
* The USA and Canada lead in the number of invoices, with 131 and 76 invoices respectively, indicating major markets.
* The highest invoice amounts are 23.76, 19.8, and 19.8, highlighting the largest sales transactions in the dataset.
* Prague stands out as the city with the highest sum of invoice totals, amounting to 273.24, making it a prime candidate for hosting a promotional Music Festival.
* František Wichterlová is the top customer, having spent a total of 144.54, signifying a valuable customer for personalized rewards and loyalty programs.
* There are 58 identified Rock music listeners, providing a focused target audience for marketing campaigns. Their details include email, first name, last name, and genre.
* AC/DC is the leading rock band with 18 tracks, followed by other top bands. This insight is useful for collaborations and promotions with popular artists.
* The track "How Many More Times" is the longest song at 711836 milliseconds, offering insight into customer preferences for longer music tracks.
* Steve Murray spent the highest amount, 17.82, on a single artist, which can inform decisions on exclusive artist promotions.
* Rock music is the most popular genre in Argentina and Australia, purchased 18 times in Australia, showing regional music preferences.
* In Argentina, Diego Gutiérrez spent the most, totaling 39.6. In Australia, Mark Taylor is the top spender with 81.18. These insights help in identifying high-value customers in different regions for targeted marketing efforts.

# Recommendations
* Focus promotional efforts and marketing campaigns in the USA and Canada, as these countries have the highest number of invoices. Tailor these promotions to the preferences and behaviors of customers in these regions.
* Develop personalized loyalty programs and rewards for top spenders like František Wichterlová. This will help retain high-value customers and encourage repeat purchases.
* Leverage the list of 58 Rock music listeners for targeted marketing campaigns. Personalized emails and promotions can drive engagement and sales among this specific customer segment.
* Consider collaborations or special promotions with top Rock music artists like AC/DC. Featuring popular artists in campaigns can attract their fans and increase sales.
* Given that Rock music is the most popular genre in multiple countries, increase the availability and variety of Rock music tracks in the store. This can cater to the existing demand and attract more customers.
* Consider offering more tracks similar in length to "How Many More Times," the longest track in the dataset. Analyzing preferences for song length can help optimize the music catalog.
* Segment customers based on their spending patterns on different artists. This can help in designing artist-specific promotions and personalized recommendations, enhancing customer satisfaction and sales.
* Develop regional marketing strategies based on the most popular genres in each country. For instance, promote Rock music heavily in Argentina and Australia where it is most popular.

# Requirements
* My SQL: For Data Analysis
* Canva: For Presenting Insights
