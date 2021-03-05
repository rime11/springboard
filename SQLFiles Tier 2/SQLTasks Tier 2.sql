/* Welcome to the SQL mini project. You will carry out this project partly in
the PHPMyAdmin interface, and partly in Jupyter via a Python connection.

This is Tier 2 of the case study, which means that there'll be less guidance for you about how to setup
your local SQLite connection in PART 2 of the case study. This will make the case study more challenging for you: 
you might need to do some digging, aand revise the Working with Relational Databases in Python chapter in the previous resource.

Otherwise, the questions in the case study are exactly the same as with Tier 1. 

PART 1: PHPMyAdmin
You will complete questions 1-9 below in the PHPMyAdmin interface. 
Log in by pasting the following URL into your browser, and
using the following Username and Password:

URL: https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

In this case study, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */


/* QUESTIONS */
/* Q1: Some of the facilities charge a fee to members, but some do not.
Write a SQL query to produce a list of the names of the facilities that do. */

SELECT name as Facilities_with_member_charge
FROM Facilities
WHERE membercost !=0;

/* Q2: How many facilities do not charge a fee to members? */
SELECT count(*)
FROM Facilities
WHERE membercost = 0;

/* Q3: Write an SQL query to show a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost.
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */
SELECT facid, name, membercost, monthlymaintenance
FROM Facilities
WHERE membercost !=0
AND membercost < (monthlymaintenance * 0.2);

/* Q4: Write an SQL query to retrieve the details of facilities with ID 1 and 5.
Try writing the query without using the OR operator. */
SELECT *
FROM Facilities
WHERE facid
IN ( 1, 5 )

/* Q5: Produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100. Return the name and monthly maintenance of the facilities
in question. */
SELECT name, monthlymaintenance,
CASE WHEN monthlymaintenance >100
THEN 'Expensive'
ELSE 'Cheap'
END AS label
FROM Facilities

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Try not to use the LIMIT clause for your solution. */
SELECT surname, firstname
FROM Members
WHERE joindate = (
SELECT MAX( joindate )
FROM Members)

/* Q7: Produce a list of all members who have used a tennis court.
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */
SELECT DISTINCT court.name AS court_name, 
    CASE WHEN m.memid = 0 then 'GUEST' 
    ELSE CONCAT( m.firstname, ' ', m.surname ) END AS member_name
FROM Bookings AS b
INNER JOIN (
    SELECT facid, name
    FROM Facilities
    WHERE name LIKE 'Tennis%') AS court
USING ( facid )
LEFT JOIN Members AS m
USING ( memid )
ORDER BY member_name, court_name


/* Q8: Produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30. Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */
SELECT CASE WHEN m.memid = 0 THEN m.firstname
        ELSE concat(m.firstname,' ',m.surname) END as name,
    f.name, 
    b.slots * CASE WHEN b.memid =0 THEN f.guestcost
        ELSE f.membercost END AS cost
FROM Bookings AS b
LEFT JOIN Members AS m
USING ( memid )
LEFT JOIN Facilities AS f
USING ( facid )
WHERE DATE( b.starttime ) = '2012-09-14'
AND (
slots * CASE WHEN b.memid =0 THEN f.guestcost
    ELSE membercost END) >30

/* Q9: This time, produce the same result as in Q8, but using a subquery. */

SELECT CASE WHEN m.memid =0 THEN m.firstname
ELSE CONCAT( m.firstname, ' ', m.surname ) END AS name, f.name, 
subquery.slots * CASE WHEN subquery.memid =0 THEN f.guestcost
ELSE f.membercost END AS cost
FROM (
	SELECT *
	FROM Bookings
	WHERE DATE( starttime ) = '2012-09-14') AS subquery
INNER JOIN Facilities AS f
USING ( facid )
INNER JOIN Members AS m
USING ( memid ) 
WHERE subquery.slots * CASE WHEN subquery.memid=0 THEN f.guestcost
ELSE f.membercost END > 30
    
/* PART 2: SQLite

Export the country club data from PHPMyAdmin, and connect to a local SQLite instance from Jupyter notebook 
for the following questions.  

QUESTIONS:
/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

    pd.read_sql_query('select f.name, sum(subquery.price*subquery.slots) as revenue \
                  from (select Bookings.facid,memid,slots,\
                  case when memid = 0 THEN guestcost\
                  else membercost end as price\
                  from Bookings\
                  left join Facilities\
                  using(facid))as subquery\
                  left join Facilities as f\
                  using(facid)\
                  group by facid\
                  HAVING revenue < 1000\
                  order by revenue',engine)
    
/* Q11: Produce a report of members and who recommended them in alphabetic surname,firstname order */

    recommended = pd.read_sql_query('SELECT  a.surname,a.firstname, b.firstname || " " || b.surname recommended_by\
                  from Members a, Members b\
                  where a.recommendedby = b.memid\
                  order by a.surname,a.firstname ASC',engine)


/* Q12: Find the facilities with their usage by member, but not guests */
    df = pd.read_sql_query('with by_facility as (select sum(slots) as total_slots,facid \
                 from Bookings\
                 where memid != 0\
                 group by facid)\
                 select f.name as facility_name, bf.total_slots as total_member_usage_by_slot\
                 from Facilities as f\
                  left join by_facility as bf\
                  using (facid)'
                 ,engine)

/* Q13: Find the facilities usage by month, but not guests */

    df = pd.read_sql_query('SELECT Facilities.name, strftime("%m",date(starttime)) AS MONTH , SUM( slots ) AS total_slots_booked\
                    FROM Bookings\
                    left join Facilities\
                    using(facid)\
                    where Bookings.memid !=0\
                    GROUP BY MONTH , Facilities.name',engine)
