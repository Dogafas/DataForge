from config import Config

# Создаем экземпляр класса PhoneBook
from main1 import PhoneBook

phone_book = PhoneBook(dbname=Config.DBNAME, user=Config.USER, password=Config.PASSWORD)

# Создаем таблицы в базе данных
# phone_book.create_tables()

# Добавляем нового клиента
account_id = phone_book.add_client(first_name="Иван", last_name="Иванов2", email="ivan@example.com")
print(f"Добавлен клиент с ID: {account_id}")

# Добавляем телефон клиенту
# phone_book.add_phone(account_id=account_id, phone="+79991234567", phone_type="mobile", primary_phone=True)
phone_book.add_phone(account_id=account_id, phone="+79997654321", phone_type="home", primary_phone=False)

# Обновляем данные клиента
phone_book.update_client(account_id=account_id, first_name="Петр", email="petr@example.com")

# Ищем клиента по email
clients = phone_book.find_client(email="petr@example.com")
for client in clients:
    print(f"Найден клиент: {client}")

# Удаляем телефон
phone_book.delete_phone(phone_id=1)

# Удаляем клиента
phone_book.delete_client(account_id=14)

# Закрываем соединение с базой данных
phone_book.close()