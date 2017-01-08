from flask import Flask 
from flask_sqlalchemy import SQLAlchemy
from dbhelper import *
app = Flask(__name__)
app.config.from_object('config')
# database
db = SQLAlchemy(app)
# creating dbhelper
dbh = SQL(db.engine)
from.views import main
from app import models
# registering blueprint
app.register_blueprint(main.mainbp)