-- Q1-RetrieveThe names of the employees who worked from 5 to 9 o’clock.

SELECT d.fname AS'driver name'
FROM driver d , drive dr
where d.driv_ssn=dr.driver_driv_ssn AND fshift like '%5%' AND tshift like'%9%';


-- Q2-The meRetrieve tro code that arrived Al-Shuhada station at 06:42.

SELECT S. mertro_code AS'code of merto'
FROM stop s , station st
WHERE S.station_id=ST.id AND ST.name ='Al-Shohadaa' AND S.arrive='06:42:00';

-- Q3RetrieveThe number of drivers who have driven the metro is 4321.

SELECT COUNT(D.driver_driv_ssn) AS 'number of driver'
FROM drive d
WHERE mertro_code='4321';

-- Q4Retrieve Names of the most suitable employees to work at Al Shuhada station
select fname AS'name of emplyee near abaasia'
from other_employee
where address like'%abbasia%';

-- Q5Retrieve The names of the interchange stations in the second line.

SELECT s.name
FROM station_has_line h ,station s
WHERE s.id=h.station_id AND s.no_of_plateform='4' AND h.line_no='2';


-- Q6-Retrieve The number of employees in El-gaish  station
 
SELECT COUNT(o.other_ssn) AS 'no of employee'
FROM other_employee O ,station s
WHERE O.station_id =S.id AND s.name='El Geish';


-- Q7Retrieve The nearest station to Ain Shams University.

SELECT s.name
FROM station s , places p
WHERE s.id=p.station_id
AND p.famous_places LIKE '%Ainshams%';

-- Q8-Retrieve The number of stations that a smart card passes through its value 700€.

SELECT numbre_of_station 
FROM smart_card
WHERE price='700';

-- Q9Retrieve The names of customers whose smart cards are about to expire from 09/09/2018 to 9-11-2018

SELECT C.fname
FROM customer c ,smart_card sc
WHERE c.cust_ssn=sc.customer_ssn AND sc.expirt_date BETWEEN '9-09-2018' AND '9-11-2018' ;

-- Q10 -Retrieve Names of employees who have a smart card.

SELECT O.fname 
FROM other_employee O
WHERE O.other_ssn =ANY (SELECT C.cust_ssn 
FROM customer C );


-- Q11-Retrieve The names of customers who passed through Cairo University station.

SELECT C.fname 
FROM customer c,smart_card sc ,pass p
WHERE c.cust_ssn=sc.customer_ssn AND sc.code=p.smart_card_code AND P.from_station=(SELECT name 
FROM station
WHERE name ='Cairo University' );


-- Q12Retrieve The number of trips made from Demerdash station to Cairo University station.
SELECT count(p.smart_card_code) AS 'number of trip'
FROM pass p 
WHERE P.from_station='Cairo University' AND p.to_station='El-Demerdash';

-- Q13Retrieve The name of the driver whose salary is greater than all drivers.

SELECT d.fname 
FROM driver d
WHERE salary=(SELECT max( salary) FROM driver );

-- Q14-Retrieve The number of trains that passed the Maadi station.
 
SELECT count(S.mertro_code) AS 'number of metro'
FROM stop S
WHERE S.station_id=(SELECT id FROM station WHERE name ='Maadi' );


-- Q15-Retrieve The number of trains that passed through Maadi station from 06:20 to 06:36.

SELECT count(S.mertro_code) AS 'number of metro'
FROM stop S
WHERE  S.station_id=(SELECT id FROM station WHERE name ='Maadi' )
AND s.arrive BETWEEN '06:20' AND '06:36' ;

-- Q16-Retrieve Most line have stations.

SELECT terminal , max(no_of_station) AS 'MAX NO OF STATION'
FROM line;

-- Q17Retrieve Average of number of employee.

SELECT avg(O.other_ssn) AS 'avg employee' , O.`type_of_ job`
FROM other_employee O
GROUP BY O.`type_of_ job`;



-- Q18-Retrieve Customers’ names and their gender
 
SELECT COUNT(C.cust_ssn), C.sex
FROM customer c
group by c.sex;

-- Q19-Retrieve The phone number of the employee whose name is Ahmed.

SELECT phone
FROM other_employee 
WHERE fname ='Ahmed';
-- Q20Retrieve The speed and model of the metro, which has number of cars equal 8.

SELECT model , speed 
FROM mertro
WHERE no_of_cars='8';
