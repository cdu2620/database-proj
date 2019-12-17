from common import *


def complex_query_7():
	query = '''
		SELECT * FROM Listing
	'''
	cmd = cur.mogrify(query)
	# print_cmd(cmd)
	cur.execute(cmd)

	rows = cur.fetchall()
	print("Table before Trigger (see listing 1) :")
	pp(rows)

	tmp = '''
	CREATE OR REPLACE FUNCTION fn_set_perincr() RETURNS trigger
	LANGUAGE PLPGSQL AS
	$$
	BEGIN
	    UPDATE Listing
	        SET perincr = (new.price - old.price)/old.price * 100
             WHERE listing_id = old.listing_id;
             return null;

	END
	$$;

	DROP TRIGGER IF EXISTS tr_perincr ON Listing;
	
	CREATE TRIGGER tr_perincr
	AFTER UPDATE OF price ON Listing
	FOR EACH ROW
	    EXECUTE PROCEDURE fn_set_perincr();
	'''

	cmd2 = cur.mogrify(tmp)
	print_cmd(cmd2)
	cur.execute(cmd2)

	test = '''
	UPDATE Listing
		SET price = price + price*2
		WHERE listing_id = 1;
	'''

	cmd3 = cur.mogrify(test)
	print_cmd(cmd3)
	cur.execute(cmd3)

	cur.execute(cmd)

	rows = cur.fetchall()
	print("Table after Trigger (see listing 1):")
	pp(rows)


user_story_7 = '''
As a : Guest
I want to : see the percent increase in the price for a Listing
So I can : see if I'm getting a good deal and find the best time to buy

Complex
'''

print(user_story_7);
complex_query_7()   


#comparing dates in sql