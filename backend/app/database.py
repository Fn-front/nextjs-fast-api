from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os
from dotenv import load_dotenv
import time
from sqlalchemy.exc import OperationalError

load_dotenv()

SQLALCHEMY_DATABASE_URL = os.getenv("DATABASE_URL")

def get_engine(url):
    retries = 5
    while retries > 0:
        try:
            engine = create_engine(url)
            engine.connect()
            return engine
        except OperationalError:
            retries -= 1
            time.sleep(2)
    raise Exception("Could not connect to the database")

engine = get_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()