from common import *

def simple_query_1(host):

	tmpl = '''
	SELECT calendar_link
	FROM Host
	WHERE Users_username = %s
	'''
	cmd = cur.mogrify(tmpl, (host,))
	print_cmd(cmd)
	cur.execute(cmd)
	result = cur.fetchall()
	pp(result)

user_story_1 = '''
As a : Guest
I want to : get the calendar link for a specific host's availability
So I can : figure out when to book their property

Simple
'''

print(user_story_1);
simple_query_1( 'cdu2620' )   

#US1; get the calendar link for a specific host’s availability