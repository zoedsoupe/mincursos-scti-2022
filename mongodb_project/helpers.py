from pymongo import MongoClient
from pymongo.errors import ConnectionFailure

db_name = "mongodb_project"

def db_is_alive():
    try:
        # Espera 2s para conectar ao servidor
        client = MongoClient(serverSelectionTimeoutMS=2000)
        # O comando ismaster é barato e não precisa de autenticação
        client.admin.command('ismaster')
        return True
    except ConnectionFailure:
        return False
    finally:
        if client:
            client.close()

def get_db():
    if db_is_alive():
        return MongoClient(serverSelectionTimeoutMS=2000)[db_name]
    else:
        print('Falha ao se conectar ao servidor do MongoDB')

def create_collection(client, name):
    return client[name]

