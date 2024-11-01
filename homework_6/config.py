import os
from dotenv import load_dotenv

# Загрузить переменные из .env
load_dotenv()

# Настроить параметры конфигурации

class Config:
    DRIVER = os.getenv('DRIVER', 'postgresql') # драйвер подключения
    DBNAME = os.getenv('DBNAME')  # название вашей базы данных
    USER = os.getenv('USER')  # имя пользователя базы данных
    PASSWORD = os.getenv('PASSWORD')  # пароль пользователя базы данных
    HOST = os.getenv('HOST', 'localhost')  # хост базы данных, по умолчанию localhost
    PORT = os.getenv('PORT', '5432')  # порт базы данных, по умолчанию 5432
