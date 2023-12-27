# Используем базовый образ Python
FROM python:3.10

# Установка переменной среды для отключения буферизации вывода Python
ENV PYTHONUNBUFFERED 1

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /code

# Копируем зависимости проекта в контейнер
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Копируем содержимое подкаталога venv/djangoandstripe в контейнер
COPY venv/StirpeAndDjango /code/

# Копируем manage.py в контейнер
COPY venv/StirpeAndDjango/manage.py /code/

EXPOSE 8000

# Запускаем сервер Django
CMD ["python", "/code/venv/StirpeAndDjango/manage.py", "runserver", "0.0.0.0:8000"]


