from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Table, Date, func
from sqlalchemy.orm import relationship, sessionmaker, declarative_base
import json
from config import Config

Base = declarative_base()

# Таблица для связи книг и магазинов
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

class DataLoader:
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
                       )
            self.session.add(sale)

        for book_store_data in data['book_store']:
            book = self.session.query(Book).filter_by(id=book_store_data['book_id']).first()
            store = self.session.query(Store).filter_by(id=book_store_data['store_id']).first()
            if book and store:
                book.stores.append(store)

        self.session.commit()

def initialize_data(session, data_loader, json_file='sales_book.json'):
    if not session.query(Publisher).first():
        data = data_loader.load_data_from_json(json_file)
        data_loader.insert_data_to_db(data)

def get_publisher_filter(publisher_input):
    try:
        publisher_id = int(publisher_input)
        return Publisher.id == publisher_id
    except ValueError:
        return func.lower(Publisher.name) == publisher_input.lower()

def query_sales_info(session, publisher_filter):
    sales_info = session.query(
        Book.title,
        Store.name,
        Sale.price,
        Sale.date
    ).join(Publisher, Book.publisher_id == Publisher.id)\
     .join(Sale, Sale.book_id == Book.id)\
     .join(Store, Sale.store_id == Store.id)\
     .filter(publisher_filter)\
     .all()

    if not sales_info:
        print("Книг этого автора не было в продаже")
    else:
        for sale in sales_info:
            print(f"{sale.title:<25} | {sale.name:<20} | {sale.price:^6} | {sale.date.strftime('%d-%m-%Y')} | ")



def main():    
    DSN = f"{Config.DRIVER}://{Config.USER}:{Config.PASSWORD}@{Config.HOST}:{Config.PORT}/{Config.DBNAME}"
    engine = create_engine(DSN)
    Session = sessionmaker(bind=engine)
    # Создание сессии и загрузчика данных
    session = Session()
    data_loader = DataLoader(session)
    
    # Инициализация данных, если база данных пуста
    initialize_data(session, data_loader)

    # Получение ввода от пользователя
    publisher_input = input("Введите имя и фамилию издателя или его ID: ")
    
    # Формирование фильтра для автора книги
    publisher_filter = get_publisher_filter(publisher_input)
    
    # Выполнение запроса и вывод результата
    query_sales_info(session, publisher_filter)

if __name__ == "__main__":
    main()