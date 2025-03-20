FROM python:3.12

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

# Ensure the `manage.py` is executable
RUN chmod +x manage.py

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]