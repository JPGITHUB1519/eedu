from app import dbh

rows = dbh.execute("SELECT * FROM user")
print rows