from flask import Blueprint, render_template

securitybp = Blueprint('security', __name__, template_folder='templates')

@securitybp.route('/login')
def login():
	""" View for SignupUsers"""
	return render_template('security/login.html')

@securitybp.route('/signup')
def signup():
	""" View for SignUp Users"""
	return "Sign Up View"

@securitybp.route('/logout')
def logout():
	""" View for Logout Users"""
	return "Logout View"