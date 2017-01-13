import datetime
from app import app

def convertStringToDate(str_date):
	""" Convert a string with the format dd yy mm to date"""
	date_separator = '-'
	date = datetime.datetime.strptime(str_date, "%d" + date_separator + "%m" + date_separator + "%Y").strftime("%d" + date_separator + "%m" +  date_separator + "%Y")
	return date