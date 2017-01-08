import sys

from sqlalchemy import Column, ForeignKey, Integer, String, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine
from werkzeug import generate_password_hash, check_password_hash


Base = declarative_base()

class User(Base):
	__tablename__ = 'user'
	id = Column(Integer, primary_key = True)
	name = Column(String(80), nullable = False)

	@property 
	def serialize(self):
		return {
			'id' : self.id,
			'name' : self.name
		}

### insert at end of the line ###
engine = create_engine('sqlite:///database.db')
Base.metadata.create_all(engine) 