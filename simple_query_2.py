from common import *


def simple_query_2():
	tmpl = '''
	SELECT Users_username
	FROM Host
	WHERE rating = 5;
	'''
	cmd = cur.mogrify(tmpl)
	print_cmd(cmd)
	cur.execute(tmpl)
	rows = cur.fetchall()
	for row in rows:
		pp(rows)

user_story_2 = '''
As a : Guest
I want to : see all the hosts with 5-star ratings
So I can : find reliable hosts to buy listings from

Simple
'''

print(user_story_2);
simple_query_2()


'''
	DROP FUNCTION IF EXISTS get_five_star_ratings();

	CREATE FUNCTION get_five_star_ratings()
	RETURNS table(Users_username varchar)
	LANGUAGE sql AS
	$$
'''