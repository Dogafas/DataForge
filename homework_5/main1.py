from dotenv import load_dotenv
import os
import psycopg2
from psycopg2 import sql
from config import Config
load_dotenv()

class PhoneBook:
    def __init__(self, dbname=None, user=None, password=None, host="localhost", port="5432"):
        self.dbname = dbname or Config.DBNAME
        self.user = user or Config.USER
        self.password = password or Config.PASSWORD
        self.host = host
        self.port = port
        self.connect_to_db()

    def connect_to_db(self):
        """Подключение к базе данных с обработкой ошибок"""
        try:
            self.conn = psycopg2.connect(
                dbname=self.dbname,
                user=self.user,
                password=self.password,
                host=self.host,
                port=self.port,
                client_encoding="UTF8"
            )
            self.cur = self.conn.cursor()
        except psycopg2.Error as e:
            print(f"Ошибка при подключении к базе данных: {e}")
            raise

    def execute_query(self, query, values=None, fetch=False):
        """Вспомогательный метод для выполнения запросов"""
        try:
            self.cur.execute(query, values)
            if fetch:
                return self.cur.fetchall()
            self.conn.commit()
        except psycopg2.Error as e:
            print(f"Ошибка выполнения запроса: {e}")
            self.conn.rollback()
            raise

    def create_tables(self):
        """Создаем структуру базы данных с таблицами person, phone"""
        person_table_query = """
            CREATE TABLE IF NOT EXISTS person (
                account_id SERIAL PRIMARY KEY,
                first_name TEXT,
                last_name TEXT,
                update_ts TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
                email VARCHAR(255) CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
            );
        """

        phone_table_query = """
            CREATE TABLE IF NOT EXISTS phone (
                phone_id SERIAL PRIMARY KEY,
                account_id INT REFERENCES person(account_id),
                phone TEXT CHECK (phone ~* '^\+?[0-9]{10,15}$'),
                phone_type TEXT CHECK (phone_type IN ('mobile', 'home', 'work', 'other')),
                primary_phone BOOLEAN DEFAULT FALSE,
                update_ts TIMESTAMP WITH TIME ZONE DEFAULT NOW()
            );
            CREATE UNIQUE INDEX IF NOT EXISTS unique_primary_phone ON phone (account_id, primary_phone) 
            WHERE primary_phone = TRUE;
        """

        self.execute_query(person_table_query)
        self.execute_query(phone_table_query)

    def add_client(self, first_name, last_name, email):
        """Добавляет новую персону и возвращает ID"""
        query = """
            INSERT INTO person (first_name, last_name, email) 
            VALUES (%s, %s, %s) RETURNING account_id;
        """
        return self.execute_query(query, (first_name, last_name, email), fetch=True)[0][0]

    def add_phone(self, account_id, phone, phone_type, primary_phone=False):
        """Добавляет телефон клиенту"""
        query = """
            INSERT INTO phone (account_id, phone, phone_type, primary_phone) 
            VALUES (%s, %s, %s, %s);
        """
        self.execute_query(query, (account_id, phone, phone_type, primary_phone))

    def update_client(self, account_id, **kwargs):
        """Обновляет данные клиента"""
        set_clause = ", ".join([f"{key} = %s" for key in kwargs.keys()])
        values = list(kwargs.values()) + [account_id]
        query = sql.SQL(f"UPDATE person SET {set_clause} WHERE account_id = %s")
        self.execute_query(query, values)

    def delete_phone(self, phone_id):
        """Удаляет телефон по ID"""
        query = "DELETE FROM phone WHERE phone_id = %s;"
        self.execute_query(query, (phone_id,))

    def delete_client(self, account_id):
        """Удаляет клиента и все его телефоны"""
        delete_phone_query = "DELETE FROM phone WHERE account_id = %s;"
        delete_person_query = "DELETE FROM person WHERE account_id = %s;"
        self.execute_query(delete_phone_query, (account_id,))
        self.execute_query(delete_person_query, (account_id,))

    def find_client(self, **kwargs):
        """Ищет клиента по заданным параметрам"""
        where_clause = " AND ".join([f"{key} = %s" for key in kwargs.keys()])
        values = list(kwargs.values())
        query = sql.SQL(f"SELECT * FROM person WHERE {where_clause}")
        return self.execute_query(query, values, fetch=True)

    def close(self):
        """Закрывает подключение к базе данных"""
        if self.cur:
            self.cur.close()
        if self.conn:
            self.conn.close()


"""Код демонстрирующий работу всех написанных функций"""

# подключитесь к своей БД со своим логином и паролем
# phone_book = PhoneBook(dbname=ваша БД, user= Ваш user, password= Ваш пароль)
phone_book = PhoneBook(dbname=Config.DBNAME, user=Config.USER, password=Config.PASSWORD)

# Создаем таблицы в базе данных
phone_book.create_tables()

# Добавляем нового клиента
account_id = phone_book.add_client(first_name="Иван", last_name="Иванов", email="ivan@example.com")
account_id_1 = phone_book.add_client(first_name="Алексей", last_name="Петров", email="alexey@example.com")
account_id_2 = phone_book.add_client(first_name="Мария", last_name="Сидорова", email="maria@example.com")
account_id_3 = phone_book.add_client(first_name="Дмитрий", last_name="Смирнов", email="dmitry@example.com")
account_id_4 = phone_book.add_client(first_name="Екатерина", last_name="Кузнецова", email="ekaterina@example.com")
account_id_5 = phone_book.add_client(first_name="Анна", last_name="Морозова", email="anna@example.com")
account_id_6 = phone_book.add_client(first_name="Сергей", last_name="Васильев", email="sergey@example.com")
account_id_7 = phone_book.add_client(first_name="Ольга", last_name="Новикова", email="olga@example.com")
account_id_8 = phone_book.add_client(first_name="Михаил", last_name="Федоров", email="mikhail@example.com")
account_id_9 = phone_book.add_client(first_name="Ирина", last_name="Попова", email="irina@example.com")
account_id_10 = phone_book.add_client(first_name="Николай", last_name="Лебедев", email="nikolay@example.com")


# Добавляем телефон клиенту
phone_book.add_phone(account_id=account_id, phone="+79991234567", phone_type="mobile", primary_phone=True)
phone_book.add_phone(account_id=account_id, phone="+79137906522", phone_type="other")
phone_book.add_phone(account_id=account_id_2, phone="+79992345678", phone_type="mobile", primary_phone=True)
phone_book.add_phone(account_id=account_id_2, phone="+79138017633", phone_type="work")
phone_book.add_phone(account_id=account_id_3, phone="+79993456789", phone_type="mobile", primary_phone=True)
phone_book.add_phone(account_id=account_id_3, phone="+79139128744", phone_type="mobile")
phone_book.add_phone(account_id=account_id_4, phone="+79994567890", phone_type="home", primary_phone=True)
phone_book.add_phone(account_id=account_id_4, phone="+79130239855", phone_type="mobile")
phone_book.add_phone(account_id=account_id_5, phone="+79995678901", phone_type="work", primary_phone=True)
phone_book.add_phone(account_id=account_id_5, phone="+79131340966", phone_type="home")
phone_book.add_phone(account_id=account_id_6, phone="+79996789012", phone_type="mobile", primary_phone=True)
phone_book.add_phone(account_id=account_id_6, phone="+79132451077", phone_type="work")
phone_book.add_phone(account_id=account_id_7, phone="+79997890123", phone_type="mobile", primary_phone=True)
phone_book.add_phone(account_id=account_id_7, phone="+79133562188", phone_type="home")
phone_book.add_phone(account_id=account_id_8, phone="+79998901234", phone_type="home", primary_phone=True)
phone_book.add_phone(account_id=account_id_8, phone="+79134673299", phone_type="mobile")
phone_book.add_phone(account_id=account_id_9, phone="+79999012345", phone_type="work", primary_phone=True)
phone_book.add_phone(account_id=account_id_9, phone="+79135784300", phone_type="work")
phone_book.add_phone(account_id=account_id_10, phone="+79990123456", phone_type="other", primary_phone=True)
phone_book.add_phone(account_id=account_id_10, phone="+79136895411", phone_type="mobile")


# Обновляем данные клиента
phone_book.update_client(account_id=account_id_1, first_name="Петр 1", email="petr1@example.com")
phone_book.update_client(account_id=account_id_2, first_name="Петр 2", email="petr2@example.com")
phone_book.update_client(account_id=account_id_3, first_name="Петр 3", email="petr3@example.com")
phone_book.update_client(account_id=account_id_4, first_name="Петр 4", email="petr4@example.com")
phone_book.update_client(account_id=account_id_5, first_name="Петр 5", email="petr5@example.com")
phone_book.update_client(account_id=account_id_6, first_name="Петр 6", email="petr6@example.com")
phone_book.update_client(account_id=account_id_7, first_name="Петр 7", email="petr7@example.com")
phone_book.update_client(account_id=account_id_8, first_name="Петр 8", email="petr8@example.com")
phone_book.update_client(account_id=account_id_9, first_name="Петр 9", email="petr9@example.com")
phone_book.update_client(account_id=account_id_10, first_name="Петр 10", email="petr10@example.com")

# Ищем клиента по email
clients = phone_book.find_client(email="petr5@example.com")
for client in clients:
    print(f"Найден клиент: {client}")

# Удаляем телефон
phone_book.delete_phone(phone_id=9)

# Удаляем клиента
phone_book.delete_client(account_id=7)

# Закрываем соединение с базой данных
phone_book.close()