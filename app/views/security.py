from flask import Blueprint, render_template
from app.querys import *
from datetime import datetime
from app.utils.dates import * 
securitybp = Blueprint('security', __name__, template_folder='templates')

@securitybp.route('/login')
def login():
	""" View for SignupUsers"""
	return render_template('security/login.html')

@securitybp.route('/signup')
def signup():
	""" View for SignUp Users"""
	registerUser('jean','1519','juanpedro1519@gmail.com', convertStringToDate('15-01-2015'))
	return render_template('security/signup.html')

@securitybp.route('/logout')
def logout():
	""" View for Logout Users"""
	return "Logout View"