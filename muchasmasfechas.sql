SELECT MAKE_TIMESTAMP(2021,11,17,13,43,20.3), 
		'2021-11-17 13:43:20.3'::timestamp,
		'17/11/2021 01:43:20.3'::timestamp;				
		
--Se puede hacer Between entre make_timestamp y make_timestamp

SELECT MAKE_INTERVAL (days => 10,
					 years => 1,
					 weeks => 4,
					 mins => 10,
					 secs => 20);
--igual que current_date					 
SELECT now();




