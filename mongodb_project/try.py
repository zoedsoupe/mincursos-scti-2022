from pymongo import MongoClient
from pymongo.errors import ConnectionFailure

client = MongoClient()

try:
   # The ismaster command is cheap and does not require auth.
   client.admin.command('ismaster')
   print("Connected")
except ConnectionFailure:
   print("Server not available")
