import os
from dotenv import load_dotenv

# Загрузить переменные из .env
load_dotenv()

# Настроить параметры конфигурации
class Config:
    DBNAME = os.getenv('DBNAME') # название вашей базы данных
    USER = os.getenv('USER') # имя пользователя базы данных
    PASSWORD = os.getenv('PASSWORD') # пароль пользователя базы данных

