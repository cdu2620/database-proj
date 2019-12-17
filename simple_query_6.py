from common import *

def simple_query_6(start, end, user):
	query = '''
	SELECT booking_id
 	FROM Bookings
	WHERE %s < start_date and end_date < %s and Guests_Users_username = %s
	'''
	cmd = cur.mogrify(query, (start, end, user))
	print_cmd(cmd)
	cur.execute(cmd)
	result = cur.fetchall()
	for row in result:
		pp(row)



user_story_6 = '''
As a : Host
I want to : select all bookings by a certain user between a certain start and end date
So I can : see all the information associated with a certain guest

Simple
'''

print(user_story_6);
simple_query_6( '2019-12-20', '2019-12-27', 'christi3' )   


#comparing dates in sql