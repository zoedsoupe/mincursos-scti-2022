import sqlite3

def get_db():
    try:
        conn = sqlite3.connect('sqlite_project.db')
        return conn.cursor()
    except sqlite3.Error as err:
        print('Erro ao conectar ao SQLite', err)
        exit()
    finally:
        if conn:
            conn.close()

