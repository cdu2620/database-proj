from common import *

def complex_query_8(price):
	query = '''

	SELECT avg(h.rating)
	  FROM Host as h
	  JOIN Listing as l ON l.Host_Users_username = h.Users_username
	 WHERE l.price > %s
	'''
	cmd = cur.mogrify(query, (price,))
	print_cmd(cmd)
	cur.execute(cmd)
	result = cur.fetchall()
	for row in result:
		pp(row)

	# result = cur.callproc('fn_percent_incr',(,))
	# for row in result:
	# 	pp(row)



user_story_8= '''
As a : Guest
I want to : find the average user rating whose listing is above a certain price
So I can : see whether it's worth spending that extra money to stay in their property

Complex
'''

print(user_story_8);
complex_query_8(100)   


#comparing dates in sql