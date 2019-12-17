from common import *

def complex_query_10(property):
	query = '''

	SELECT g.Users_username
	  FROM Guests as g
	  JOIN Bookings as b ON b.Guests_Users_username = g.Users_username
	  JOIN Listing as l ON l.listing_id = b.Listing_listing_id
	  JOIN Properties as p ON l.Properties_property_id = p.property_id
	 WHERE p.property_id = %s
	'''
	cmd = cur.mogrify(query, (property,))
	print_cmd(cmd)
	cur.execute(cmd)
	result = cur.fetchall()
	for row in result:
		pp(row)


user_story_10= '''
As a : Host
I want to : View all the guests who've stayed in a certain property
So I can : get a general idea of how many people + profits I can make

Simple
'''

print(user_story_10);
complex_query_10(1)   


#comparing dates in sql