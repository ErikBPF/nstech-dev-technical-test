# Script para alimentação de tabelas criadas no banco de dados

#Biblioteca DBMS para postgresql
import psycopg2

#Conexão para banco de dados
connection = psycopg2.connect(user = "postgres",
                              password = "postgres-test",
                              host = "localhost",  
                              port = "15432",
                              database = "postgres"
              )

#Cursor para banco de dados, o qual executa os comandos da conexão
cursor = connection.cursor()

#Para carregar arquivos '.csvs' nas tabelas criadas

copy_sql = """
           COPY partidas FROM stdin WITH CSV HEADER
           DELIMITER ',' 
           """
#Para abrir o arquivo '.csv' referente a cada tabela
with open('C:/Users/Lais Menezes/Documents/nstech-dev-technical-test/data/partidas.csv', 'r', encoding="utf-8") as partidas:
    cursor.copy_expert(sql=copy_sql, file=partidas)

    connection.commit() #necessário para edição do banco de dados


copy_sql2 = """
           COPY gols FROM stdin WITH CSV HEADER
           DELIMITER ',' 
           """

with open('C:/Users/Lais Menezes/Documents/nstech-dev-technical-test/data/gols.csv', 'r', encoding="utf-8") as gols:
    cursor.copy_expert(sql=copy_sql2, file=gols)

    connection.commit() #necessário para edição do banco de dados

copy_sql3 = """
           COPY cartoes FROM stdin WITH CSV HEADER
           DELIMITER ',' 
           """

with open('C:/Users/Lais Menezes/Documents/nstech-dev-technical-test/data/cartoes.csv', 'r', encoding="utf-8") as cartoes:
    cursor.copy_expert(sql=copy_sql3, file=cartoes)

    connection.commit() #necessário para edição do banco de dados

#Para encerrar o cursor e a conexão
cursor.close()
connection.close()
