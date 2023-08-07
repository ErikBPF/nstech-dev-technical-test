import mysql.connector
import pandas as pd
import numpy as np

class DataLoader:
    def __init__(self, host, port, user, password, database):
        self.host = 'localhost'
        self.port = '3306'
        self.user = 'root'
        self.password = 'cantanias20'
        self.database = 'db_nstech'

    def connect(self):
            self.connection = mysql.connector.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database=self.database
            )
            self.cursor = self.connection.cursor()

    def close(self):
            if self.connection.is_connected():
                self.cursor.close()
                self.connection.close()

    def load_csv_to_table(self, table_name, csv_filename):
        csv_path = f"C:/Users/FlaviaCarolinePereir/Documents/GitHub/nstech-dev-technical-test/data/{csv_filename}"
        try:
            df = pd.read_csv(csv_path)
            df = df.replace({np.nan: None})
            columns = ', '.join(df.columns)
            values = ', '.join(['%s' for _ in df.columns])
            insert_query = f"INSERT INTO {table_name} ({columns}) VALUES ({values})"
            self.cursor.executemany(insert_query, df.values.tolist())
            self.connection.commit()
            print(f"Dados do arquivo {csv_filename} inseridos na tabela {table_name} com sucesso!")
        except mysql.connector.Error as erro:
            print(f"Falha ao inserir dados do arquivo {csv_filename} na tabela {table_name}: {erro}")

if __name__ == '__main__':
    loader = DataLoader(host='localhost', port='3306', user='root', password='cantanias20', database='db_nstech')
    loader.connect()
    loader.load_csv_to_table('tb_cartoes', 'cartoes.csv')
    loader.load_csv_to_table('tb_gols', 'gols.csv')
    loader.load_csv_to_table('tb_partidas', 'partidas.csv')
    loader.close()