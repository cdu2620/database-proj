from common import *

#US1; get the calendar link for a specific host’s availability
def simple_query_5(category):
	tmpl = '''
	SELECT description, Host_Users_username
	FROM Page
	WHERE activity_category = %s
	'''
	cmd = cur.mogrify(tmpl, (category,))
	print_cmd(cmd)
	cur.execute(cmd)
	result = cur.fetchall()
	for row in result:
		pp(row)



user_story_5 = '''
As a : Adventure guest
I want to : find all the activities in a certain category
So I can : see the the different activities within a category I'm interested in

Simple
'''

print(user_story_5);
simple_query_5( 'Water' )   