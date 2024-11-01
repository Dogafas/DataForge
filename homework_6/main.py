import json
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Table, Date
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker, declarative_base
from config import Config

Base = declarative_base()

# таблица для связи книг и магазинов
book_store = Table('book_store', Base.metadata,
    Column('book_id', Integer, ForeignKey('books.id'), primary_key=True),
    Column('store_id', Integer, ForeignKey('stores.id'), primary_key=True)
)

class Publisher(Base):
    __tablename__ = 'publishers'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)

    books = relationship('Book', back_populates='publisher')

class Book(Base):
    __tablename__ = 'books'
    id = Column(Integer, primary_key=True)
    title = Column(String, nullable=False)
    publisher_id = Column(Integer, ForeignKey('publishers.id'))

    publisher = relationship('Publisher', back_populates='books')
    sales = relationship('Sale', back_populates='book')
    stores = relationship('Store', secondary=book_store, back_populates='books')

class Store(Base):
    __tablename__ = 'stores'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)

    books = relationship('Book', secondary=book_store, back_populates='stores')

class Sale(Base):
    __tablename__ = 'sales'
    id = Column(Integer, primary_key=True)
    book_id = Column(Integer, ForeignKey('books.id'))
    store_id = Column(Integer, ForeignKey('stores.id'))
    price = Column(Integer, nullable=False)
    date = Column(Date, nullable=False)
    count = Column(Integer, nullable=False) 

    book = relationship('Book', back_populates='sales')
    store = relationship('Store')


# строка продлючения к источнику данных
DSN = f"{Config.DRIVER}://{Config.USER}:{Config.PASSWORD}@{Config.HOST}:{Config.PORT}/{Config.DBNAME}"
# движок для подключения к вашей БД
engine = create_engine(DSN)
# Создание всех таблиц в базе данных, определенных в модели, если они еще не существуют
Base.metadata.create_all(engine)

# Создание сессии
Session = sessionmaker(bind=engine)
session = Session()

class DataLoader: # загрузка данных в таблицы БД
    def __init__(self, session):
        self.session = session

    def load_data_from_json(self, file_path):
        with open(file_path, 'r', encoding='utf-8') as f:
            return json.load(f)

    def insert_data_to_db(self, data):
        for publisher_data in data['publishers']:
            publisher = Publisher(name=publisher_data['name'])
            self.session.add(publisher)

        for book_data in data['books']:
            book = Book(title=book_data['title'], publisher_id=book_data['publisher_id'])
            self.session.add(book)

        for store_data in data['stores']:
            store = Store(name=store_data['name'])
            self.session.add(store)

        for sale_data in data['sales']:
            sale = Sale(
                book_id=sale_data['book_id'],
                store_id=sale_data['store_id'],
                price=sale_data['price'],
                date=sale_data['date'],
                count=sale_data['count']
            )
            self.session.add(sale)

        for book_store_data in data['book_store']:
            book = self.session.query(Book).filter_by(id=book_store_data['book_id']).first()
            store = self.session.query(Store).filter_by(id=book_store_data['store_id']).first()
            if book and store:
                book.stores.append(store)

        self.session.commit()

# Создание экземпляра класса DataLoader
data_loader = DataLoader(session)

# Проверка, есть ли уже данные в базе данных
if not session.query(Publisher).first():
    # Загрузка данных из JSON-файла и вставка в базу данных
    data = data_loader.load_data_from_json('sales_book.json')
    data_loader.insert_data_to_db(data)

# Запрос на получение имени издателя
publisher_name = input("Введите писателя: ")

# Запрос к базе данных
sales_info = session.query(
    Book.title,
    Store.name,
    Sale.price,
    Sale.date
).join(Publisher, Book.publisher_id == Publisher.id)\
 .join(Sale, Sale.book_id == Book.id)\
 .join(Store, Sale.store_id == Store.id)\
 .filter(Publisher.name.ilike(f"%{publisher_name}%"))\
 .all()

if not sales_info:
    print(f"Книги автора {publisher_name} не было в продаже")
else:
# Для удобочитаемости вывода результата зададим одинаковую ширину столбцам
    max_title_length = max(len(sale.title) for sale in sales_info) if sales_info else 0
    max_store_length = max(len(sale.name) for sale in sales_info) if sales_info else 0
    max_price_length = max(len(str(sale.price)) for sale in sales_info) if sales_info else 0
    max_date_length = 10  # Длина даты в формате 'dd-mm-yyyy'

    # Вывод результатов
    for sale in sales_info:
        print(f"{sale.title:<{max_title_length}} | "
            f"{sale.name:<{max_store_length}} | "
            f"{sale.price:<{max_price_length}} | "
            f"{sale.date.strftime('%d-%m-%Y'):<{max_date_length}} | "
            
        )
