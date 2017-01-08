from app import app, db

class User(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(64), index=True, unique=True)
	def __repr__(self):
		return "<Post %r>" % (self.body)
