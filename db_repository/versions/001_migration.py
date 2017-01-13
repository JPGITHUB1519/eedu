from sqlalchemy import *
from migrate import *


from migrate.changeset import schema
pre_meta = MetaData()
post_meta = MetaData()
user = Table('user', pre_meta,
    Column('iduser', INTEGER, primary_key=True, nullable=False),
    Column('username', VARCHAR(length=45)),
    Column('password', VARCHAR(length=45)),
    Column('email', VARCHAR(length=45)),
    Column('registered_date', DATE),
    Column('birthdate', DATE),
    Column('is_active', BOOLEAN),
)

users = Table('users', post_meta,
    Column('iduser', Integer, primary_key=True, nullable=False),
    Column('username', String(length=45)),
    Column('password', String(length=45)),
    Column('email', String(length=45)),
    Column('registered_date', Date, default=ColumnDefault(<function utcnow at 0x02688330>)),
    Column('birthdate', Date),
    Column('is_active', Boolean),
)


def upgrade(migrate_engine):
    # Upgrade operations go here. Don't create your own engine; bind
    # migrate_engine to your metadata
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    pre_meta.tables['user'].drop()
    post_meta.tables['users'].create()


def downgrade(migrate_engine):
    # Operations to reverse the above upgrade go here.
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    pre_meta.tables['user'].create()
    post_meta.tables['users'].drop()
