FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
# تأكد أن هذا المسار هو مكان ملف run.py الخاص بك
CMD ["python", "flask-backend/run.py"]
