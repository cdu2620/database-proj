from common import *

#US1; get the calendar link for a specific host’s availability
def simple_query_3(pattern):
	query = '''
	SELECT listing_id, description
	  FROM Listing
	WHERE description ILIKE %s;
	'''
	cmd = cur.mogrify(query, (pattern,))
	print_cmd(cmd)
	cur.execute(cmd)
	#result = cur.callproc('search',(pattern,))
	result = cur.fetchall()
	for row in result:
		pp(row)


user_story_3 = '''
As a : Guest
I want to : search for listings by description
So I can : find a listing that has the features that i want

Simple
'''

print(user_story_3);
simple_query_3( 'the garage' )   