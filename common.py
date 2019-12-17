import psycopg2
from pprint import pprint as pp

SHOW_CMD = True
def print_cmd(cmd):
    if SHOW_CMD:
        print(cmd.decode('utf-8'))

conn = psycopg2.connect(database='phase2', user='isdb')
conn.autocommit = True
cur = conn.cursor()

