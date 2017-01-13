from app import app, db
import datetime
class User(db.Model):
	__tablename__ = "users"
	iduser = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(45), index=True, unique=True)
	password = db.Column(db.String(45))
	email = db.Column(db.String(45))
	registered_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
	birthdate = db.Column(db.Date)
	is_active = db.Column(db.Boolean)

	def __repr__(self):
		return "<User %r>" % (self.body)

	def serialize(self):
		return {
			"iduser" : self.iduser,
			"email" : self.email,
			"registered_date" : self.registered_date,
			"is_active" : self.is_active
		}
