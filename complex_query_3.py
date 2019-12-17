from common import *

def complex_query_9(loc):
	query = '''
	SELECT l.listing_id, l.description
	  FROM Listing as l
	  JOIN Properties as p ON l.Properties_property_id = p.property_id
	 WHERE p.city = %s AND l.price < (SELECT AVG(l2.price)
				   FROM Listing as l2
			   	   JOIN Properties as p2 ON l2.Properties_property_id = p2.property_id
			      WHERE p2.city = %s
			      GROUP BY p2.city)
	'''
	cmd = cur.mogrify(query, (loc,loc))
	print_cmd(cmd)
	cur.execute(cmd)
	result = cur.fetchall()
	for row in result:
		pp(row)



user_story_9= '''
As a : Guest
I want to : see all the listings that have a price less than the average price of listings in a city
So I can : make sure I'm getting the best deal.

Simple
'''

print(user_story_9);
complex_query_9('New York')   

