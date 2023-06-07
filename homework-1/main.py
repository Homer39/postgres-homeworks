"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import os

password = os.getenv('psql_pass')


def fill_in_table(conn, table_name: str, filename: str) -> None:
    """
    Импортирует данные в таблицу
    """
    with conn:
        with open(filename, 'r', encoding="utf-8") as f:
            text = f.readlines()
            column = (text[0].replace('"', '').rstrip())
            with conn.cursor() as cur:
                for row_id in range(1, len(text)):
                    # Для считывания строк при записи в таблицу 'customers', выполняются следующие действия с кавычками
                    row = text[row_id].replace("'", "''").replace('"', "'").rstrip()
                    table = f"INSERT INTO {table_name} ({column}) VALUES ({row})"
                    cur.execute(table)
                conn.commit()


conn = psycopg2.connect(host='localhost', database='north', user='postgres', password=password)
try:
    fill_in_table(conn, 'customers', os.path.join('north_data', 'customers_data.csv'))
    fill_in_table(conn, 'employees', os.path.join('north_data', 'employees_data.csv'))
    fill_in_table(conn, 'orders', os.path.join('north_data', 'orders_data.csv'))
finally:
    conn.close()
