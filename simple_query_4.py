from common import *

def simple_query_4(place):
	query = '''
	SELECT round(avg(size), 2)
    FROM Properties
	WHERE country = %s
	'''
	cmd = cur.mogrify(query, (place,))
	print_cmd(cmd)
	cur.execute(cmd)
	result = cur.fetchall()
	for row in result:
		pp(row)


user_story_4 = '''
As a : Guest
I want to : find average size of properties in certain location
So I can : see if the properties in the location I want to go to will be the right size

Analytical
'''

print(user_story_4);
simple_query_4( 'USA' )   