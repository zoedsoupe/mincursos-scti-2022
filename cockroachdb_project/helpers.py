import psycopg2

conn_url = 'postgresql://root@localhost:26257?sslcert=certs%2Fclient.root.crt&sslkey=certs%2Fclient.root.key&sslmode=verify-full&sslrootcert=certs%2Fca.crt'

def db_is_alive():
    try:
        conn = psycopg2.connect(conn_url)
        client = conn.cursor()
        return True
    except psycopg2.OperationalError:
        return False
    finally:
        if 'conn' in locals():
            conn.close()

def get_db():
    if db_is_alive():
        return psycopg2.connect(conn_url).cursor()
    else:
        print('Falha ao se conectar ao servidor do CockroachDB')
