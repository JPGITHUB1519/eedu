from app import db
from .models import User

def registerUser(username, password, email, birthdate):
	user = User(username=username, 
				password=password, 
				email=email, 
				birthdate=birthdate,
				is_active=1
				)
	db.session.add(user)
	db.session.commit()

