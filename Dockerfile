# Використовуємо офіційний образ Python як базовий
FROM python:3.9

# Встановимо робочий каталог у контейнері
WORKDIR /app

# Копіюємо файл requirements.txt та встановлюємо залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проект до робочого каталогу
COPY . .

# Виставляємо порт, який буде прослуховувати застосунок
EXPOSE 8000

# Команда для запуску FastAPI застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

