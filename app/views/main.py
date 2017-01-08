from flask import Blueprint, render_template

mainbp = Blueprint('main',__name__, template_folder='templates')

@mainbp.route('/')
def main():
	return "Main Page"