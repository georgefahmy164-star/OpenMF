# استخدام نسخة بايثون تدعم المكتبات القديمة
FROM python:3.9-slim

# تثبيت الأدوات الأساسية التي تطلبها مكتبات بايثون مثل cffi
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ ملف المتطلبات وتثبيتها
COPY flask-backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الكود
COPY . .

# أمر التشغيل
CMD ["python", "flask-backend/run.py"]
